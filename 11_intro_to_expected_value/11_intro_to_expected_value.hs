module Main where

import Control.Monad (liftM)

main :: IO ()
main = do
  ints       <- liftM words getLine
  gcContents' <- liftM words getLine
  let m = read $ (ints!!0)::Int
  let n = read $ (ints!!1)::Int
  let gcContents = map (\x -> read x :: Float) gcContents'

  mapM_ putStrLn $ map show gcContents
  mapM_ putStrLn $ map show $ map (expectedValue m n) gcContents

expectedValue :: Int -> Int -> Float -> Float
expectedValue m n gc = fromIntegral (n - (m - 1)) * probIdentical m gc

probIdentical :: Int -> Float -> Float
probIdentical m gc = fromIntegral m * probOneBaseIdentical gc

-- Taken from my solution to Intro to Probability (PROB)
probOneBaseIdentical :: Float -> Float
probOneBaseIdentical x = (2*((1 - x)/2)^2) + (2*(x/2)^2)