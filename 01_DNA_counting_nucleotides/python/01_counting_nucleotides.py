#!/usr/bin/env python

import sys


def main():
    seq = sys.stdin.readline().strip()
    nucleotide_counts = dict((base, seq.count(base)) for base in seq)

    print(" ".join(str(nucleotide_counts[x]) for x in ["A", "C", "G", "T"]))

if __name__ == '__main__':
    main()
