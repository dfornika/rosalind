module Main where

import Control.Monad (liftM, replicateM)
import Data.List(permutations, intersperse)

main :: IO ()
main = do
  input <- liftM (\x -> read x :: Int) getLine

  let intList = permutations [1..input]
  let ones    = replicateM input [1,-1]
  let output = [zipWith (*) x y | x <- intList, y <- ones]

  putStrLn $ show $ length output
  mapM_ putStrLn $ map concat $ map (intersperse " ") $ map (map show) output
