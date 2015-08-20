module Main where

import Data.List (sortBy)
import Data.Ord (comparing)

main :: IO ()
main = do
  seq <- getLine
  let len = length seq
  let restrict_sites' =
        concat $ map (findPalindrome seq len) [4..12]
  let restrict_sites = sortBy (comparing fst) $
                       zip (map ((len + 1) -) (map fst restrict_sites'))
                           (map snd restrict_sites')

  mapM_ putStrLn $ map printOneSite restrict_sites

printOneSite :: (Int, Int) -> String
printOneSite (a, b) = (show a) ++ " " ++ (show b)

findPalindrome :: String -> Int -> Int -> [(Int, Int)]
findPalindrome [] _ _ = []
findPalindrome seq m n
  | length seq < n = []
  | take n seq == revComp (take n seq) = (length seq, n) : findPalindrome (tail seq) m n
  | otherwise                          = findPalindrome (tail seq) m n

revComp :: String -> String
revComp seq = reverse $ map complement seq

complement :: Char -> Char
complement 'A' = 'T'
complement 'C' = 'G'
complement 'G' = 'C'
complement 'T' = 'A'
complement  _  = 'N'
