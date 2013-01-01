module Main where

import Control.Monad (liftM)
import Data.List (isInfixOf, subsequences, sortBy, nub)
import Data.Ord (comparing)

main :: IO()
main = do
  seqs <- liftM lines $ getContents

  putStrLn $ subTwoSeqs (seqs!!0) (seqs!!1)

subTwoSeqs :: String -> String -> String
subTwoSeqs [] _ = []
subTwoSeqs _ [] = []
subTwoSeqs x y = head $ reverse $ sortBy (comparing length)
                 [matches | matches <- (nub . subsequences) x, (matches `isInfixOf` y && matches `isInfixOf` x)]
