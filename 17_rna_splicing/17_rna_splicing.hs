module Main where

import Control.Monad (liftM)
import Data.Maybe (fromJust)
import Data.Map (findWithDefault, fromList)
import qualified Data.Text as T

main = do
  (genomicSeq:introns) <- liftM (T.lines . T.pack) $ getContents
  let splices = map (flip T.breakOn genomicSeq) introns
  let donors  = map fst splices
  let acceptors = zipWith T.stripPrefix introns (map snd splices)
  mapM_ putStrLn $ (map show donors)
  mapM_ putStrLn $ (map show acceptors)

translate :: String -> Char
translate key = Map.findWithDefault 'X' key codonMap
                where codonMap = Map.fromList [ ("UUU", 'F')
                                              , ("UUC", 'F')
                                              , ("UUA", 'L')
                                              , ("UUG", 'L')
                                              , ("CUU", 'L')
                                              , ("CUC", 'L')
                                              , ("CUA", 'L')
                                              , ("CUG", 'L')
                                              , ("AUU", 'I')
                                              , ("AUC", 'I') -- 10
                                              , ("AUA", 'I')
                                              , ("AUG", 'M')
                                              , ("GUU", 'V')
                                              , ("GUC", 'V')
                                              , ("GUA", 'V')
                                              , ("GUG", 'V')
                                              , ("UCU", 'S')
                                              , ("UCC", 'S')
                                              , ("UCA", 'S')
                                              , ("UCG", 'S') -- 20
                                              , ("CCU", 'P')
                                              , ("CCC", 'P')
                                              , ("CCA", 'P')
                                              , ("CCG", 'P')
                                              , ("ACU", 'T')
                                              , ("ACC", 'T')
                                              , ("ACA", 'T')
                                              , ("ACG", 'T')
                                              , ("GCU", 'A')
                                              , ("GCC", 'A') -- 30
                                              , ("GCA", 'A')
                                              , ("GCG", 'A')
                                              , ("UAU", 'Y')
                                              , ("UAC", 'Y')
                                              , ("UAA", ' ')
                                              , ("UAG", ' ')
                                              , ("CAU", 'H')
                                              , ("CAC", 'H')
                                              , ("CAA", 'Q')
                                              , ("CAG", 'Q') -- 40
                                              , ("AAU", 'N')
                                              , ("AAC", 'N')
                                              , ("AAA", 'K')
                                              , ("AAG", 'K')
                                              , ("GAU", 'D')
                                              , ("GAC", 'D')
                                              , ("GAA", 'E')
                                              , ("GAG", 'E')
                                              , ("UGU", 'C')
                                              , ("UGC", 'C') -- 50
                                              , ("UGA", ' ')
                                              , ("UGG", 'W')
                                              , ("CGU", 'R')
                                              , ("CGC", 'R')
                                              , ("CGA", 'R')
                                              , ("CGG", 'R')
                                              , ("AGU", 'S')
                                              , ("AGC", 'S')
                                              , ("AGA", 'R')
                                              , ("AGG", 'R') -- 60
                                              , ("GGU", 'G')
                                              , ("GGC", 'G')
                                              , ("GGA", 'G')
                                              , ("GGG", 'G') ]
