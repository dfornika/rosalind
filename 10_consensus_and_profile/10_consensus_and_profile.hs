module Main where

import Data.List (findIndices)
import Text.Printf (printf)

main :: IO ()
main = do
  input <- getContents

  let seqs = lines input
  let posList = [1..(length $ seqs!!0)]

  mapM_ putStrLn seqs 
  
  let profileMatrix =  map (oneProfile seqs) posList
  
  printf "%s" "A: "
  mapM_ (printf "%d ") (map (!!0) profileMatrix)
  printf "%s" "\n"

  printf "%s" "C: "
  mapM_ (printf "%d ") (map (!!1) profileMatrix)
  printf "%s" "\n"

  printf "%s" "G: "
  mapM_ (printf "%d ") (map (!!2) profileMatrix)
  printf "%s" "\n"

  printf "%s" "T: "
  mapM_ (printf "%d ") (map (!!3) profileMatrix)
  printf "%s" "\n"

countOccurences :: String -> Char -> Int
countOccurences seq base = length $ findIndices (\x -> x == base) seq

{-- Take a list of DNA sequences, plus a position and return the 
    profile for that position in the order [A, C, G, T]

    e.g. ["AATCT"
         ,"ACTTT"  -> 2 -> [2,1,0,0]
         ,"TAGGT"]
--}
oneProfile :: [String] -> Int -> [Int]
oneProfile [] _ = []
oneProfile seqs pos = countOccurences currentColumn 'A' 
                    : countOccurences currentColumn 'C'
                    : countOccurences currentColumn 'G'
                    : countOccurences currentColumn 'T'
                    : []
    where currentColumn = map (!!(pos-1)) seqs

-- Quick utility function useful for working with lists 
-- that are formatted [A, C, G, T]
int2base :: Int -> Char
int2base 0 = 'A'
int2base 1 = 'C'
int2base 2 = 'G'
int2base 3 = 'T'
int2base _ = 'N'