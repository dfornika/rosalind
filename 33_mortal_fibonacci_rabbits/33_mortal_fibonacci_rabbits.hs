module Main where

import Control.Monad(liftM)

main :: IO()
main = do
  [n,k] <- liftM (map (\x -> read x :: Integer)) $ liftM words getLine
  putStrLn $ show $ rabbitPairs n k

rabbitPairs :: Integer -> Integer -> Integer
rabbitPairs 1 _ = 1
rabbitPairs 2 _ = 1
rabbitPairs n k = (maturePairs n k) + (immaturePairs n k)
  where immaturePairs  n k = k * (maturePairs (n - 1) k)
        maturePairs    n k = rabbitPairs (n - 1) k
