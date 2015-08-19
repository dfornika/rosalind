#!/usr/bin/env Rscript

input <- readLines('stdin', n=1, warn=FALSE)
rev   <- rev(input)
output <- rep("N", nchar(input))

for (i in 1:nchar(rev)){
  if(rev[i]=="A") {output[i]<-"T"}
  if(rev[i]=="C") output[i]<-"G"    
  if(rev[i]=="G") output[i]<-"C"    
  if(rev[i]=="T") output[i]<-"A"
}

cat(rev(output), '\n')