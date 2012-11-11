module Main where

import Bio.Core.Sequence
import Bio.Sequence.Fasta
import qualified Data.Map as Map 
import qualified Data.ByteString.Lazy.Char8 as B

main :: IO()
main = do
  seqs <- readFasta "./rosalind_gc.txt"

  -- keys are floating-point values representing GC content (eg. 0.51068724)
  let keys = map calcGCRatio (map (toStr . seqdata) seqs)
  -- values are the sequence IDs as Strings (eg. "Rosalind_1733")
  let values = map (B.unpack . unSL . seqlabel) seqs

  let gcMap = Map.fromList $ zip keys values

  putStrLn $ snd $ head $ Map.toDescList gcMap
  putStrLn $ ratio2percent $ fst $ head $ Map.toDescList gcMap

toStr :: SeqData -> String
toStr = (B.unpack . unSD) 

detectGC :: Char -> Int
detectGC 'G' = 1
detectGC 'C' = 1
detectGC  _  = 0

calcGCRatio :: String -> Float
calcGCRatio seq = (fromIntegral $ sum $ map detectGC seq) / (fromIntegral $ length seq)

ratio2percent :: Float -> String
ratio2percent x = show (x * 100) ++ "%" 