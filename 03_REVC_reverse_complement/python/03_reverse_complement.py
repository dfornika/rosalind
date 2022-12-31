#!/usr/bin/env python

import sys

seq = sys.stdin.readline().strip()

def complement(s):
  """Return the complementary sequence string."""
  basecomplement = {'A': 'T', 'C': 'G', 'G': 'C', 'T': 'A'}
  letters = list(s)
  letters = [basecomplement[base] for base in letters]
  return ''.join(letters)

print(complement(seq[::-1]))
