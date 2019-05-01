#! /usr/bin/env python

import sys

for line in sys.stdin:
    line = line.strip()
    title, year, rating, votes = line.split("\t")
    try:
        result = [title, year, rating, votes]
        print("\t".join(str(v) for v in result))
    except ValueError:
        pass
