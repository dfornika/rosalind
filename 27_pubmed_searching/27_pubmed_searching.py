import sys
from Bio import Entrez

author = sys.stdin.readline().rstrip()
year   = sys.stdin.readline().rstrip()
Entrez.email = "dfornika@gmail.com"
handle = Entrez.esearch(db="pubmed", term=author + '[Author] AND ' + year + '[Publication Date]', retmax='100')
record = Entrez.read(handle)
pmids = map(int, record["IdList"])
print sorted(pmids)[0]
