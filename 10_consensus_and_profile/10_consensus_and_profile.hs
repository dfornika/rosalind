module Main where

import Data.List (findIndices)

main :: IO ()
main = do
  input <- getContents
  let seqs = lines input
  
  mapM_ putStrLn seqs
  putStrLn $ show $ countOccurences (seqs!!0) 'A'
  
  putStrLn $ map head seqs  
  
  putStrLn $ show $ oneProfile seqs

countOccurences :: String -> Char -> Int
countOccurences seq base = length $ findIndices (\x -> x == base) seq

oneProfile :: [String] -> [Int]
oneProfile [] = []
oneProfile seqs = countOccurences currentColumn 'A' 
                : countOccurences currentColumn 'C'
                : countOccurences currentColumn 'G'
                : countOccurences currentColumn 'T'
                : []
    where currentColumn = map head seqs

int2base :: Int -> Char
int2base 0 = 'A'
int2base 1 = 'C'
int2base 2 = 'G'
int2base 3 = 'T'
int2base _ = 'N'