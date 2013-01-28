module Main where

import Control.Monad (liftM)

main :: IO ()
main = do
  -- It's ugly, but this line takes a string of whitespace-separated
  -- numbers from stdin and returns a list of integers
  input <- liftM (\x -> read x :: Int) getLine

  let intList = [1..input]

  putStrLn $ show $ intList
