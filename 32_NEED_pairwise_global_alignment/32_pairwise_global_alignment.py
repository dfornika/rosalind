import sys
import subprocess
import re
from Bio import Entrez
from Bio import SeqIO

genbankIDs = sys.stdin.readline().rstrip().split()

Entrez.email = "dfornika@gmail.com"
handle = Entrez.efetch(db="nucleotide", id=genbankIDs, rettype="fasta")
records = list (SeqIO.parse(handle, "fasta"))

aseqHandle = open("aseq.fasta", 'w')
bseqHandle = open("bseq.fasta", 'w')
aseqHandle.write(records[0].format("fasta"))
bseqHandle.write(records[1].format("fasta"))
aseqHandle.close()
bseqHandle.close()

needle = subprocess.Popen(["needle",
                           "-asequence", "aseq.fasta",
                           "-bsequence", "bseq.fasta",
                           "-gapopen", "11",
                           "-gapextend", "1",
                           "-endweight", "Yes",
                           "-endopen", "10",
                           "-endextend", "1",
                           "-auto", "Yes",
                           "-stdout", "Yes"], stdout=subprocess.PIPE)
output, err = needle.communicate()

score = int(float(output.split('\n')[30].split(' ')[2]))

print score
