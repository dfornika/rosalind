import sys
from Bio import ExPASy
from Bio import SwissProt

input = sys.stdin.readline().rstrip()
handle = ExPASy.get_sprot_raw(input)
record = SwissProt.read(handle)

for i in record.cross_references:
    if (i[0] == 'GO'):
       if (i[2][0] == 'P'):
           print i[2][2:]
