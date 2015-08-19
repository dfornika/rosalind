module Main where

main :: IO()
main = do
  seq <- getLine
  putStrLn (map dna2rna seq)

dna2rna :: Char -> Char
dna2rna 'A' = 'A'
dna2rna 'C' = 'C'
dna2rna 'G' = 'G'
dna2rna 'T' = 'U'
dna2rna  _  = 'N'