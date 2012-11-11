module Main where

import Text.Printf (printf)

main :: IO()
main = do
  input <- getLine
  let gcRatios = map (\x -> read x :: Float) (words input)

  mapM_ (printf "%.3f ") $ map probIdentical gcRatios 

probIdentical :: Float -> Float
probIdentical x = (2*((1 - x)/2)^2) + (2*(x/2)^2)