
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
input = torch.rand(input_size, requires_grad=True, dtype = torch.double)

first_layer = torch.nn.Linear(input_size, hidden_size, dtype = torch.double)
second_layer = torch.nn.Linear(hidden_size, out_size, dtype = torch.double)
softmax = torch.nn.Softmax(dim=0)


start = time.time()
jacobian(func, input)
end = time.time()
print( int((end - start) * 1000))