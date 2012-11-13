module Main where

main :: IO ()
main = do
  ints          <- getLine
  probabilities <- getLine
  let m = ints!!0
  let n = ints!!1

