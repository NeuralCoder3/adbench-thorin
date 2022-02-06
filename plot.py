import os
from os import walk
import re
from collections import OrderedDict
import time
import matplotlib.pyplot as plt
import numpy as np

class Benchmark:
    def __init__(self, d, k, n, path):
        self.d = d
        self.k = k
        self.n = n
        self.path = path

    def __str__(self):
        return "{d} {k} {n} {path}".format(d=self.d, k=self.k, n=self.n, path=self.path)


def groupBy(list, key):
    res = OrderedDict()
    for benchmark in list:
        keyValue = key(benchmark)

        if keyValue in res:
            res[keyValue].append(benchmark)
        else:
            res[keyValue] = [benchmark]
    return res

def transform(line):
    elems = [int(x) for x in line.strip().split(";") if x != ""]

    return {
        "d": elems[0],
        "k": elems[1],
        "n": elems[2],
        "measurements": elems[3:]
    }


def main():

    commands = [
        "Cpp Manual",
        "Cpp Enzyme",
        "Impala Enzyme"
    ]

    with open("results/evaluation.csv") as file:
        lines = [transform(x) for x in file.readlines()]

        res = groupBy(lines, key=lambda b: b["d"])
        for key in sorted(res.keys()):
            items = [x["measurements"] for x in sorted(res[key], key=lambda a: a["k"])]

            test = np.transpose(np.array(items) / 1000.0)

            for i, plot in enumerate(test):
                plt.plot(plot, label=commands[i])
            plt.legend()
            plt.show()




if __name__ == '__main__':
    main()