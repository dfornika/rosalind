default: rna_transcription

rna_transcription.o: rna_transcription.c
	cc -c rna_transcription.c -o rna_transcription.o

rna_transcription: rna_transcription.o
	cc rna_transcription.o -o rna_transcription

clean:
	-rm -f rna_transcription.o
	-rm -f rna_transcription
