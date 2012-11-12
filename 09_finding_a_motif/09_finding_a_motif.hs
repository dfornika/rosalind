module Main where

import Data.Maybe (fromJust)
import Text.Printf (printf)

main :: IO()
main = do
  seq   <- getLine
  query <- getLine

  let subList   = substrings (length query) seq
  let positions = [1..(length subList)]
  
  let tupleList = zip subList positions

  mapM_ (printf "%d ") $ findPositions query tupleList

substrings :: Int -> [a] -> [[a]]
substrings n [] = []
substrings n xs 
  | length xs < n = []
  | otherwise = take n xs : substrings n (drop 1 xs)

findPositions :: String -> [(String, Int)] -> [Int]
findPositions q xs = map snd (filter (\x -> fst x == q) xs)
    