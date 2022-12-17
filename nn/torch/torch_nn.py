
import torch
from torch.autograd.functional import jacobian
import time
import sys

def func(input):
    x = first_layer(input)
    x = second_layer(x)
    x = softmax(x)
    x = torch.sum(x)
    return x

input_size = int(sys.argv[1])
hidden_size = int(sys.argv[2])
out_size = int(sys.argv[3])

torch.set_num_threads(1)

first_layer = torch.nn.Linear(input_size, hidden_size, dtype = torch.double)
second_layer = torch.nn.Linear(hidden_size, out_size, dtype = torch.double)
softmax = torch.nn.Softmax(dim=0)



min_samples = 10
min_time = 500

count = 0
min_runtime = -1
time_sum = 0

while time_sum < 10000  and (count < min_samples or time_sum < min_time):
    input = torch.rand(input_size, requires_grad=True, dtype = torch.double)
    start = time.time()
    jacobian(func, input)
    end = time.time()
    current_time = int((end - start ) * 1000)

    if min_runtime == -1 or current_time < min_runtime:
        min_runtime = current_time

    time_sum += current_time
    count+=1

print(min_runtime)