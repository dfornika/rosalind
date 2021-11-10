default: counting_nucleotides

counting_nucleotides.o: 01_counting_nucleotides.c
	cc -c 01_counting_nucleotides.c -o counting_nucleotides.o

counting_nucleotides: counting_nucleotides.o
	cc counting_nucleotides.o -o counting_nucleotides

clean:
	-rm -f counting_nucleotides.o
	-rm -f counting_nucleotides
