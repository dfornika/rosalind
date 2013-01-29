#!/usr/bin/env Rscript

input <- readLines('stdin', n=1, warn=FALSE)

countBases <- function(base, seq) {
  n <- length(attr(gregexpr(pattern=base, text=seq)[[1]], "match.length"))
  return(n)
}

output <- list()

output[['A']] <- countBases("A", input)
output[['C']] <- countBases("C", input)
output[['G']] <- countBases("G", input)
output[['T']] <- countBases("T", input)

cat(c(output$A, output$C, output$G, output$T, '\n'))