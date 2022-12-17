# Copyright (c) Microsoft Corporation.
# Licensed under the MIT license.

import os
import sys
sys.path.append(sys.path[0] + ("/" if sys.path[0] else None) + "..")
import GMMData
import BAData
import LSTMData
from PyTorchGMM import PyTorchGMM
from PyTorchBA import PyTorchBA
from PyTorchLSTM import PyTorchLSTM
import input_utils
from Benchmark import run_benchmark

# function printing to stderr
def eprint(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)

def main(argv):
    try:

        test_type = argv[1]
        input_filepath = os.path.normpath(argv[2])

        # read only 1 point and replicate it?

        # If the given prefix is a directory then add a separator to its end
        # thus we can just use concatenation further

        module = None

        if test_type == "GMM":
            # read gmm input
            module = PyTorchGMM()
            _input = input_utils.read_gmm_instance(input_filepath, False)
        elif test_type == "BA":
            # read ba input
            module = PyTorchBA()
            _input = input_utils.read_ba_instance(input_filepath)
        elif test_type == "LSTM":
            module = PyTorchLSTM()
            _input = input_utils.read_lstm_instance(input_filepath)
        else:
            raise RuntimeError("Python runner doesn't support tests of " + test_type + " type")

        run_benchmark(
            module,
            _input,
        )

    except RuntimeError as ex:
        eprint("Runtime exception caught: ", ex)
    except Exception as ex:
        eprint("An exception caught: ", ex)

    return 0

if __name__ == "__main__":
    main(sys.argv[:])