import sys
from Bio.ExPASy import ScanProsite

with open (sys.argv[1], "r") as inFile:
    sequence=inFile.read().replace('\n', '')

handle = ScanProsite.scan(seq=sequence)
result = ScanProsite.read(handle)
print result[-1]['signature_ac']
