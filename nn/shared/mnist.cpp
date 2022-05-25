#include <vector>
#include <cmath>
#include <iostream>
#include <fstream>
#include <cstring>
#include <filesystem>
#include <unistd.h>
#include <limits.h>
#include <unistd.h>
#include <stdlib.h>
#include <unistd.h>
#include <random>
#include <sstream>
#include <sstream>
#include <iostream>
#include <iomanip>


extern "C" {

void print_mnist(double *digit) {
    for (int i = 0; i < 28; i++) {
        for (int j = 0; j < 28; j++) {
            char brightness = digit[i * 28 + j] > 0 ? '#' : ' ';
            std::cout << brightness;
        }

        std::cout << std::endl;
    }
}

int reverseInt(int i) {
    unsigned char ch1, ch2, ch3, ch4;
    ch1 = i & 255;
    ch2 = (i >> 8) & 255;
    ch3 = (i >> 16) & 255;
    ch4 = (i >> 24) & 255;
    return ((int) ch1 << 24) + ((int) ch2 << 16) + ((int) ch3 << 8) + ch4;
}

void
readMNIST(int NumberOfImages, int DataOfAnImage, std::vector<std::vector<double>> &data, std::vector<int> &labels) {
    data.resize(NumberOfImages, std::vector<double>(DataOfAnImage));
    labels.resize(NumberOfImages, 0);
    std::ifstream file("train-images.idx3-ubyte", std::ios::binary);
    std::ifstream labels_file("train-labels.idx1-ubyte", std::ios::binary);
    if (file.is_open()) {
        int magic_number = 0;
        int number_of_images = 0;
        int n_rows = 0;
        int n_cols = 0;
        file.read((char *) &magic_number, sizeof(magic_number));
        labels_file.read((char *) &magic_number, sizeof(magic_number));

        file.read((char *) &number_of_images, sizeof(number_of_images));
        labels_file.read((char *) &number_of_images, sizeof(number_of_images));

        file.read((char *) &n_rows, sizeof(n_rows));
        n_rows = reverseInt(n_rows);

        file.read((char *) &n_cols, sizeof(n_cols));
        n_cols = reverseInt(n_cols);

        for (int i = 0; i < NumberOfImages; ++i) {
            char label;
            labels_file.read(&label, 1);
            labels[i] = label;

            for (int r = 0; r < n_rows; ++r) {
                for (int c = 0; c < n_cols; ++c) {
                    unsigned char temp = 0;
                    file.read((char *) &temp, sizeof(temp));
                    data[i][(n_rows * r) + c] = ((double) temp) / 255;
                }
            }
        }
    }
}

std::vector<std::vector<double>> train_data;
std::vector<int> labels_data;

void initMnist() {
    readMNIST(10000, 784, train_data, labels_data);
}

double *readInput(int index) {
    return &train_data[index][0];
}

void print_digit(int index){
    print_mnist(readInput(index));
}

int readLabel(int index) {
    return labels_data[index];
}
}