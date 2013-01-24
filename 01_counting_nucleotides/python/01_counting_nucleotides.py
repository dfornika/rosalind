#!/usr/bin/env python

import sys

seq = sys.stdin.readline().strip()
nucleotide_counts = dict((base, seq.count(base)) for base in seq)

print " ".join(str(nucleotide_counts[x]) for x in ["A", "C", "G", "T"])
