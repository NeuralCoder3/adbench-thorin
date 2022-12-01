

import subprocess
import torch
import time

for i in range(1, 50):
    size = 1000 * i
    size_str = str(size)
    subprocess.run(["python3", "torch_benchmark2.py", size_str, size_str, "2", "0"])