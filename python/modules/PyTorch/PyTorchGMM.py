# Copyright (c) Microsoft Corporation.
# Licensed under the MIT license.

import numpy as np
import torch

from modules.PyTorch.utils import to_torch_tensors, torch_jacobian
from shared.ITest import ITest
from shared.GMMData import GMMInput, GMMOutput
from modules.PyTorch.gmm_objective import gmm_objective



class PyTorchGMM(ITest):
    '''Test class for GMM differentiation by PyTorch.'''

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

    def calculate_objective(self, times):
        '''Calculates objective function many times.'''

        for i in range(times):
            self.objective = gmm_objective(*self.inputs, *self.params)

    def calculate_jacobian(self, times):
        '''Calculates objective function jacobian many times.'''

        for i in range(times):
            self.objective, self.gradient = torch_jacobian(
                gmm_objective,
                self.inputs,
                self.params
            )