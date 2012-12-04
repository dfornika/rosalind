module Main where

import System.Environment (getArgs)
import Bio.Sequence.Fasta (readFasta)

main :: IO ()
main = do
  (file:_) <- getArgs
  seqs <- readFasta file

  mapM_ putStrLn $ map show seqs
