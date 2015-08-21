import sys
from Bio import Entrez
from Bio import SeqIO

genbankIDs = sys.stdin.readline().rstrip().split()
Entrez.email = "dfornika@gmail.com"
handle = Entrez.efetch(db="nucleotide", id=genbankIDs, rettype="fasta")
records = list (SeqIO.parse(handle, "fasta"))
records.sort(key = lambda x: len(x.seq), reverse=False)

print records[0].format("fasta")
