#! /usr/bin/env python

import sys
import csv

for line in sys.stdin:
    line = line.strip()

    try:
        reader = csv.reader([line], delimiter=',')
        for row in reader:
            title = row[1]
            year = row[2]
            rating = row[5]
            votes = row[6]

            if float(rating) <= 1:
                results = [title, year, rating, votes]
                print("\t".join(results))
    except ValueError:
        pass
