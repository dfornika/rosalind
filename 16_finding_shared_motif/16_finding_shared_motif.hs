module Main where

import Control.Monad (liftM)
import Data.List (isInfixOf, subsequences, sortBy, nub)
import Data.Ord (comparing)

main :: IO()
main = do
  seqs <- liftM lines $ getContents

  putStrLn $ foldl findMotif2 (head seqs) (tail seqs)

findMotif2 :: String -> String -> String
findMotif2 [] _ = []
findMotif2 _ [] = []
findMotif2 x y = head $ reverse $ sortBy (comparing length)
                 [matches | matches <- (nub . subsequences) x, (matches `isInfixOf` y && matches `isInfixOf` x)]
