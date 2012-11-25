#!/usr/bin/env python

import sys

seq = sys.stdin.readline().strip()

nucleotide_counts = dict((base, seq.count(base)) for base in seq)

for base in nucleotide_counts.keys():
  print nucleotide_counts[base],
