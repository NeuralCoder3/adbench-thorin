

import torch
from torch import nn
import time


class NeuralNetwork(nn.Module):
    def __init__(self, size):
        super(NeuralNetwork, self).__init__()
        self.stack = nn.Sequential(
            nn.Linear(size, size),
            nn.Linear(size, 2),
            nn.Softmax(dim=0),
        )

    def forward(self, x):
        x = self.stack(x)
        return torch.sum(x)


# cuda = torch.device('cuda')

# with torch.cuda.device(0):
for i in range(1, 50):
    size = 1000 * i

    torch.set_num_threads(10)
    x = torch.rand(size, requires_grad=True)

    model = NeuralNetwork(size)

    avg = 0
    runs = 5
    for k in range(runs):
        start = time.time()

        t = model(x)
        t.backward()
        # print(x.grad)

        end = time.time()
        avg += end - start
        # print(f"  {end - start:.2}s")
    avg /= runs
    print(f"{i}, {int(avg*1000)}")
