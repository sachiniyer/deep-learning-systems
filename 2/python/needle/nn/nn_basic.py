"""The module.
"""

from typing import List, Callable, Any
from needle.autograd import Tensor
from needle import ops
import needle.init as init
import numpy as np


class Parameter(Tensor):
    """A special kind of tensor that represents parameters."""


def _unpack_params(value: object) -> List[Tensor]:
    if isinstance(value, Parameter):
        return [value]
    elif isinstance(value, Module):
        return value.parameters()
    elif isinstance(value, dict):
        params = []
        for k, v in value.items():
            params += _unpack_params(v)
        return params
    elif isinstance(value, (list, tuple)):
        params = []
        for v in value:
            params += _unpack_params(v)
        return params
    else:
        return []


def _child_modules(value: object) -> List["Module"]:
    if isinstance(value, Module):
        modules = [value]
        modules.extend(_child_modules(value.__dict__))
        return modules
    if isinstance(value, dict):
        modules = []
        for k, v in value.items():
            modules += _child_modules(v)
        return modules
    elif isinstance(value, (list, tuple)):
        modules = []
        for v in value:
            modules += _child_modules(v)
        return modules
    else:
        return []


class Module:
    def __init__(self):
        self.training = True

    def parameters(self) -> List[Tensor]:
        """Return the list of parameters in the module."""
        return _unpack_params(self.__dict__)

    def _children(self) -> List["Module"]:
        return _child_modules(self.__dict__)

    def eval(self):
        self.training = False
        for m in self._children():
            m.training = False

    def train(self):
        self.training = True
        for m in self._children():
            m.training = True

    def __call__(self, *args, **kwargs):
        return self.forward(*args, **kwargs)


class Identity(Module):
    def forward(self, x):
        return x


class Linear(Module):
    def __init__(
        self, in_features, out_features, bias=True, device=None, dtype="float32"
    ):
        super().__init__()
        self.in_features = in_features
        self.out_features = out_features

        ### BEGIN YOUR SOLUTION
        self.weight = Parameter(
            init.kaiming_uniform(
                fan_in=in_features, fan_out=out_features, device=device, dtype=dtype
            )
        )
        if bias:
            self.bias = Parameter(
                init.kaiming_uniform(
                    fan_in=out_features,
                    fan_out=1,
                    device=device,
                    dtype=dtype,
                    requires_grad=True,
                ).reshape((1, out_features))
            )
        ### END YOUR SOLUTION

    def forward(self, X: Tensor) -> Tensor:
        ### BEGIN YOUR SOLUTION
        res = X @ self.weight
        if self.bias is not None:
            res = res + ops.broadcast_to(self.bias, res.shape)
        return res
        ### END YOUR SOLUTION


class Flatten(Module):
    def forward(self, X):
        ### BEGIN YOUR SOLUTION
        return X.reshape((X.shape[0], -1))
        ### END YOUR SOLUTION


class ReLU(Module):
    def forward(self, x: Tensor) -> Tensor:
        ### BEGIN YOUR SOLUTION
        return ops.relu(x)
        ### END YOUR SOLUTION


class Sequential(Module):
    def __init__(self, *modules):
        super().__init__()
        self.modules = modules

    def forward(self, x: Tensor) -> Tensor:
        ### BEGIN YOUR SOLUTION
        for module in self.modules:
            x = module(x)
        return x
        ### END YOUR SOLUTION


class SoftmaxLoss(Module):
    def forward(self, logits: Tensor, y: Tensor):
        ### BEGIN YOUR SOLUTION
        data_size = logits.shape[0]
        labels = (logits * init.one_hot(logits.shape[1], y)).sum()
        return (ops.logsumexp(logits, axes=(1,)).sum() - labels) / data_size
        ### END YOUR SOLUTION


class BatchNorm1d(Module):
    def __init__(self, dim, eps=1e-5, momentum=0.1, device=None, dtype="float32"):
        super().__init__()
        self.dim = dim
        self.eps = eps
        self.momentum = momentum
        ### BEGIN YOUR SOLUTION
        self.weight = Parameter(
            init.ones(dim, device=device, dtype=dtype, requires_grad=True)
        )
        self.bias = Parameter(
            init.zeros(dim, device=device, dtype=dtype, requires_grad=True)
        )
        self.running_mean = init.zeros(
            dim, device=device, dtype=dtype, requires_grad=False
        )
        self.running_var = init.ones(
            dim, device=device, dtype=dtype, requires_grad=False
        )
        ### END YOUR SOLUTION

    def forward(self, x: Tensor) -> Tensor:
        ### BEGIN YOUR SOLUTION
        if self.training:
            ex = x.sum(0) / x.shape[0]
            self.running_mean.data = (
                1 - self.momentum
            ) * self.running_mean.data + ex.data * self.momentum
            ex = ops.broadcast_to(ex, x.shape)
            sub = x - ex
            var_x = ops.summation(sub * sub, axes=0) / x.shape[0]
            self.running_var.data = (
                1 - self.momentum
            ) * self.running_var.data + var_x.data * self.momentum
        else:
            ex = ops.broadcast_to(self.running_mean, x.shape)  # batch_size, dim
            var_x = self.running_var
            sub = x - ex

        y = (var_x + self.eps) ** 0.5
        y = ops.broadcast_to(y, x.shape)
        w = ops.broadcast_to(self.weight, x.shape)
        b = ops.broadcast_to(self.bias, x.shape)
        h = w * (sub / y) + b
        return h
        ### END YOUR SOLUTION


class LayerNorm1d(Module):
    def __init__(self, dim, eps=1e-5, device=None, dtype="float32"):
        super().__init__()
        self.dim = dim
        self.eps = eps
        ### BEGIN YOUR SOLUTION
        self.weight = Parameter(init.ones(dim, dtype=dtype))
        self.bias = Parameter(init.zeros(dim, dtype=dtype))
        ### END YOUR SOLUTION

    def forward(self, x: Tensor) -> Tensor:
        ### BEGIN YOUR SOLUTION
        sub = x - ops.broadcast_to(
            (x.sum(1) / x.shape[1]).reshape((x.shape[0], 1)), x.shape
        )  # batch_size,

        y = (ops.summation(sub * sub, axes=(1,)) / x.shape[1] + self.eps) ** 0.5
        y = ops.broadcast_to(y.reshape((y.shape[0], 1)), x.shape)

        return ops.broadcast_to(
            self.weight.reshape((1, self.weight.shape[0])), x.shape
        ) * (sub / y) + ops.broadcast_to(
            self.bias.reshape((1, self.bias.shape[0])), x.shape
        )
        ### END YOUR SOLUTION


class Dropout(Module):
    def __init__(self, p=0.5):
        super().__init__()
        self.p = p

    def forward(self, x: Tensor) -> Tensor:
        ### BEGIN YOUR SOLUTION
        # use init.randb
        if self.training is False:
            return x
        mask = init.randb(*x.shape, p=1 - self.p)
        return x * mask / (1 - self.p)
        ### END YOUR SOLUTION


class Residual(Module):
    def __init__(self, fn: Module):
        super().__init__()
        self.fn = fn

    def forward(self, x: Tensor) -> Tensor:
        ### BEGIN YOUR SOLUTION
        return x + self.fn(x)
        ### END YOUR SOLUTION
