# Copyright (c) Microsoft Corporation.
# Licensed under the MIT license.

import numpy as np
import torch

from utils import to_torch_tensors, torch_jacobian
from LSTMData import LSTMInput, LSTMOutput
from lstm_objective import lstm_objective



class PyTorchLSTM:
    '''Test class for LSTM diferentiation by PyTorch.'''

    def prepare(self, input):
        '''Prepares calculating. This function must be run before
        any others.'''

        torch.set_num_threads(1)
        self.inputs = to_torch_tensors(
            (input.main_params, input.extra_params),
            grad_req = True
        )

        self.params = to_torch_tensors((input.state, input.sequence))
        self.gradient = torch.empty(0)
        self.objective = torch.zeros(1)

    def output(self):
        '''Returns calculation result.'''

        return LSTMOutput(self.objective.item(), self.gradient.numpy())

    def calculate_objective(self):
        '''Calculates objective function many times.'''

        self.objective = lstm_objective(*self.inputs, *self.params)

    def calculate_jacobian(self):
        ''' Calculates objective function jacobian many times.'''

        #self.objective = lstm_objective(*self.inputs, *self.params)

        self.objective, self.gradient = torch_jacobian(
            lstm_objective,
            self.inputs,
            self.params
        )