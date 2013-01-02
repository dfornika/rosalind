module Main where

import Control.Monad (liftM)
import Data.List (isInfixOf, subsequences, sortBy, nub, maximumBy, tails)
import Data.Ord (comparing)
import Data.Function (on)
main :: IO()
main = do
  seqs <- liftM lines $ getContents

  putStrLn $ foldl lcstr (head seqs) (tail seqs)

-- findMotif2 is my implementation.  It works but it's slow.
findMotif2 :: String -> String -> String
findMotif2 [] _ = []
findMotif2 _ [] = []
findMotif2 x y = head $ reverse $ sortBy (comparing length)
                 [matches | matches <- (nub . subsequences) x, (matches `isInfixOf` y && matches `isInfixOf` x)]

-- lcstr is the wikibooks solution:
-- http://en.wikibooks.org/wiki/Algorithm_implementation/Strings/Longest_common_substring#Haskell
lcstr :: Ord a => [a] -> [a] -> [a]
lcstr xs ys = maximumBy (compare `on` length) . concat $ [f xs' ys | xs' <- tails xs] ++ [f xs ys' | ys' <- drop 1 $ tails ys]
  where f xs ys = scanl g [] $ zip xs ys
        g z (x, y) = if x == y then z ++ [x] else []
