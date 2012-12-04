module Main where

import System.Environment (getArgs)
import qualified Data.ByteString.Lazy.Char8 as B
import Bio.Core.Sequence (SeqData, SeqLabel, unSD, unSL, seqdata, seqlabel)
import Bio.Sequence.Fasta (readFasta)

main :: IO ()
main = do
  (file:_) <- getArgs
  input <- readFasta file
  let seqs = map seq2string (map seqdata input)
  let labels = map label2string (map seqlabel input)
  let slPairs = zip labels seqs

  putStrLn $ show $
    map (matchSeqs 3 $ seqs!!0) (tail seqs)
  putStrLn $ show slPairs

matchSeqs :: Int -> String -> String -> Bool
matchSeqs n s1 s2
  | (reverse $ take n (reverse s1)) == take n s2 = True
  | otherwise                                    = False

seq2string :: SeqData -> String
seq2string = B.unpack . unSD

label2string :: SeqLabel -> String
label2string = B.unpack . unSL
