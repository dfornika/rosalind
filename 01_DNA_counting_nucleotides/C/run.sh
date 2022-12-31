#!/usr/bin/env bash

make 2>&1 > /dev/null

./counting_nucleotides < ../input.txt 
