module Main where

import Control.Monad (liftM)
import Text.Printf (printf)
main :: IO ()
main = do
  ints       <- liftM words getLine
  gcContents' <- liftM words getLine
  let m = read $ (ints!!0)::Int -- m represents the length of the 'query' sequence (=< 10 bp)
  let n = read $ (ints!!1)::Int -- n represents the length of the sequence we are matching against (=< 10,000 bp)
  let gcContents = map (\x -> read x :: Float) gcContents'
  
  mapM_ (printf "%.3f ") $ map (expectedValue m n) gcContents

expectedValue :: Int -> Int -> Float -> Float
expectedValue m n gc = (fromIntegral (n - (m - 1))) * (probIdentical m gc)

probIdentical :: Int -> Float -> Float
probIdentical m gc = (probOneBaseIdentical gc) ^ (m)

-- Taken from my solution to Intro to Probability (PROB)
probOneBaseIdentical :: Float -> Float
probOneBaseIdentical x = (2*((1 - x)/2)^2) + (2*(x/2)^2)