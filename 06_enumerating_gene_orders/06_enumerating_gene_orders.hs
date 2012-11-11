module Main where

import Data.List (permutations, intersperse)

main :: IO()
main = do
  input <- getLine

  putStrLn $ show $ length $ permutations [1..(read input :: Int)]
  mapM_ putStrLn $ map ints2string $ permutations [1..(read input :: Int)]

ints2string :: [Int] -> String
ints2string xs = intersperse ' ' (concat $ map show xs) 