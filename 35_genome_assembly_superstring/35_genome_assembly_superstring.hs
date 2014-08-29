module Main where

import System.Environment (getArgs)
import Control.Monad(liftM)
import Data.List((\\), isInfixOf, tails)

-- import qualified Data.ByteString.Lazy.Char8 as B

import Bio.Core.Sequence
import Bio.Sequence.Fasta(readFasta, seqdata, toStr)

main :: IO()
main = do
  file <- liftM head $ getArgs
  seqs <- readFasta file
  let seqStrings = map (toStr . seqdata) seqs
  putStrLn $ superString seqStrings

-- Thanks to Geoff Reedy on the Code Golf StackExchange:
-- http://codegolf.stackexchange.com/a/11774
a :: String -> [String] -> [(Int, String)]
a p [] = [(length p, p)]
a p seqs = [ r | w <- seqs, t <- tails w, isInfixOf w $ p ++ t, r <- a (p ++ t) (seqs \\ [w]) ]

superString :: [String] -> String
superString = snd . minimum . a ""
