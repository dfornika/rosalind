module Main where

import Data.List (findIndices)

main :: IO ()
main = do
  input <- getContents
  let seqs = lines input
  
  mapM_ putStrLn seqs
  print $ countOccurences (seqs!!0) 'A'

countOccurences :: String -> Char -> Int
countOccurences seq base = length $ findIndices (\x -> x == base) seq