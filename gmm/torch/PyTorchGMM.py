# Copyright (c) Microsoft Corporation.
# Licensed under the MIT license.

import numpy as np
import torch

from utils import to_torch_tensors, torch_jacobian
from GMMData import GMMInput, GMMOutput
from gmm_objective import gmm_objective

class PyTorchGMM:
    '''Test class for GMM differentiation by PyTorch.'''

    def __init__(self):
        pass

    def prepare(self, input):
        '''Prepares calculating. This function must be run before
        any others.'''

        torch.set_num_threads(1)

        self.inputs = to_torch_tensors(
            (input.alphas, input.means, input.icf),
            grad_req = True
        )

        self.params = to_torch_tensors(
            (input.x, input.wishart.gamma, input.wishart.m)
        )

        self.objective = torch.zeros(1)
        self.gradient = torch.empty(0)

    def output(self):
        '''Returns calculation result.'''

        return GMMOutput(self.objective.item(), self.gradient.numpy())

    def calculate_objective(self):
        '''Calculates objective function many times.'''

        self.objective = gmm_objective(*self.inputs, *self.params)

    def calculate_jacobian(self):
        '''Calculates objective function jacobian many times.'''

        self.objective, self.gradient = torch_jacobian(
            gmm_objective,
            self.inputs,
            self.params
        )