module Main where

import System.Environment (getArgs)
import qualified Data.ByteString.Lazy.Char8 as B
import Bio.Core.Sequence (SeqData, SeqLabel, unSD, unSL, seqdata, seqlabel)
import Bio.Sequence.Fasta (readFasta)
import qualified Data.Map as Map

main :: IO ()
main = do
  (file:_) <- getArgs
  input <- readFasta file
  let seqs = map seq2string (map seqdata input)
  let labels = map label2string (map seqlabel input)
  let slPairs = zip labels seqs

  putStrLn $ show $
    concat $ map (pairUp slPairs) slPairs

  putStrLn $ show slPairs

matchSeqs :: Int -> ((String, String), (String, String)) -> Bool
matchSeqs n ((l1, s1), (l2, s2))
  | (reverse $ take n (reverse s1)) == take n s2 = True
  | otherwise                                    = False

-- the 'pairUp' function generates a list of all combinations of sequences,
-- where each sequence is a pair of the form (label, sequence)
pairUp :: [(String, String)] -> (String, String) -> [((String, String), (String, String))]
pairUp [] _ = []
pairUp (x:xs) a
  | x == a     = pairUp xs a
  | otherwise  = (a, x) : pairUp xs a

seq2string :: SeqData -> String
seq2string = B.unpack . unSD

label2string :: SeqLabel -> String
label2string = B.unpack . unSL
