import sys
from Bio.Seq import Seq

input = sys.stdin.readline()
print input.count("A"), + input.count("C"), + input.count("G"), + input.count("T")
