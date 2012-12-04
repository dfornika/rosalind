module Main where

import System.Environment (getArgs)
import qualified Data.ByteString.Lazy.Char8 as B
import Bio.Core.Sequence (SeqData, unSD, seqdata)
import Bio.Sequence.Fasta (readFasta)

main :: IO ()
main = do
  (file:_) <- getArgs
  seqs <- readFasta file
  mapM_ putStrLn $ map seq2string (map seqdata seqs)

matchSeqs :: String -> String -> Int -> Bool
matchSeqs s1 s2 n
  | (reverse $ take n (reverse s1)) == take n s2 = True
  | otherwise                                  = False

seq2string :: SeqData -> String
seq2string = B.unpack . unSD
