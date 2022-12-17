# Copyright (c) Microsoft Corporation.
# Licensed under the MIT license.

import time
import sys
import struct
from collections import namedtuple

import GMMData
import BAData
import HandData
import LSTMData

from PyTorchGMM import PyTorchGMM
from PyTorchBA import PyTorchBA
from PyTorchLSTM import PyTorchLSTM

measurable_time_not_achieved = -1

# Performs the entire benchmark process according to the documentation
def run_benchmark(module, _input):
    module.prepare(_input)

    min_samples = 10
    min_time = 500

    count = 0
    min_runtime = -1
    time_sum = 0

    gradient = None

    while time_sum < 10000  and (count < min_samples or time_sum < min_time):
        start = time.time()
        module.calculate_jacobian()
        end = time.time()
        current_time = int((end - start ) * 1000)

        if min_runtime == -1 or current_time < min_runtime:
            min_runtime = current_time

        time_sum += current_time
        count+=1

    print(min_runtime)

    for e in module.gradient:
        print(e.item())