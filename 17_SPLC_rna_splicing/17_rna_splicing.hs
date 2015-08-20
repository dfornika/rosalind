module Main where

import Control.Monad (liftM)
import Data.Map (findWithDefault, fromList)
import Data.String.Utils (split, replace)

main = do
  (genomicSeq:introns) <- liftM lines $ getContents
  let spliced = foldl (\x -> \y -> concat $ split y x)  genomicSeq introns

  putStrLn $ map translate $ chunk 3 $ replace "T" "U" spliced

-- This chunk function courtesy of:
-- http://www.haskell.org/haskellwiki/Data.List.Split
chunk :: Int -> [a] -> [[a]]
chunk n [] = []
chunk n xs = ys : chunk n zs
  where (ys,zs) = splitAt n xs

translate :: String -> Char
translate key = findWithDefault 'X' key codonMap
                where codonMap = fromList [ ("UUU", 'F')
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
