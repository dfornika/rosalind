module Main where

import Control.Monad (liftM)

main :: IO ()
main = do
  -- It's ugly, but this line takes a string of whitespace-separated
  -- numbers from stdin and returns a list of integers
  input <- liftM ((map (\x -> read x :: Double)) . words) $ getLine

  let (x, y, z) = ((input!!0), (input!!1), (input!!2))

  putStrLn $ show $ calcProb x y z

calcProb :: Double -> Double -> Double -> Double
calcProb x y z =   (x/tot) * ((x-1)/(tot-1)) * (4/4)
                 + (x/tot) * (y/(tot-1))     * (4/4)
                 + (x/tot) * (z/(tot-1))     * (4/4)
                 + (y/tot) * (x/(tot-1))     * (4/4)
                 + (y/tot) * ((y-1)/(tot-1)) * (3/4)
                 + (y/tot) * (z/(tot-1))     * (2/4)
                 + (z/tot) * (x/(tot-1))     * (4/4)
                 + (z/tot) * (y/(tot-1))     * (2/4)
                 + (z/tot) * ((z-1)/(tot-1)) * (0/4)
  where tot = x + y + z
