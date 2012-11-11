module Main where

main :: IO()
main = do
  seq1 <- getLine
  seq2 <- getLine
  putStrLn seq1
  putStrLn seq2

