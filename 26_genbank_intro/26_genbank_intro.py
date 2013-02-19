import sys
from Bio import Entrez

genus = sys.stdin.readline().rstrip()
date1 = sys.stdin.readline().rstrip()
date2 = sys.stdin.readline().rstrip()
Entrez.email = "dfornika@gmail.com"
handle = Entrez.esearch(db="nucleotide", term=genus+'[Organism] AND rbcL[Gene] AND ' + date1 + ':' + date2 + '[Publication Date]')
record = Entrez.read(handle)
print record["Count"]
