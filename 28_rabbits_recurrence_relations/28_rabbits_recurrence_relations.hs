module Main where

import Control.Monad(liftM)

main :: IO()
main = do
  [n,k] <- liftM (map (\x -> read x :: Int)) $ liftM words getLine
  putStrLn $ show $ rabbitPairs n k

rabbitPairs :: Int -> Int -> Int
rabbitPairs 1 _ = 1
rabbitPairs 2 _ = 1
rabbitPairs n k = rabbitPairs (n-1) k
