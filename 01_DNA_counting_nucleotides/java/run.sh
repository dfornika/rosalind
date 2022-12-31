#!/usr/bin/env bash

make 2>&1 > /dev/null

java CountingNucleotides < ../input.txt
