#!/usr/bin/env python

import sys

s = sys.stdin.readline().strip().split(' ')
word_counts = dict((word, s.count(word)) for word in s)

for (key, value) in word_counts.items():
    print key + " " + str(value)
