#!/usr/bin/env Rscript

input <- readLines('stdin', n=1, warn=FALSE)

cat(gsub(pattern="T", replacement="U", x=input), '\n')