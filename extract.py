import csv

with open('gmm.csv', newline='') as csvfile:
    reader = csv.DictReader(csvfile)
    sum = {}
    for row in reader:
        for cell in row:
            if cell not in sum:
                sum[cell] = 0
            sum[cell] += float(row[cell])
    for col in sum:
        sum[col] /= 25
    print(sum)