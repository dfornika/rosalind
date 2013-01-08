module Main where

import Data.Map (Map, fromList, findWithDefault)
import Data.List (sortBy, sort)
import Control.Monad (liftM, replicateM)
import Data.Char (isSpace, digitToInt)
import Numeric (showHex)

main = do
  alphabet <- liftM (filter (/= ' ')) $ getLine
  n <- liftM (\x -> read x :: Int) $ getLine
  let alphaMap  = fromList $ zip alphabet ['A'..'Z']
  let alphaMap' = fromList $ zip ['A'..'Z'] alphabet

  -- allStrings is the list of all possible strings of length =< n drawn
  -- from the input alphabet eg. ["D", "N", "A", "DD", "DN".."AAA"]
  let allStrings   = [1..n] >>= (`replicateM` alphabet)

  -- allStrings' is a representation of the set of all strings, with each letter
  -- replaced by its corresponding letter from the conventional romal alphabet ['A'..'Z']
  -- and sorted accordingly
  -- eg. ["A", "AB", "ABC", "B".."CCC"]
  let allStrings'  = sort $ map (map (char2char alphaMap)) allStrings

  -- allStrings'' has the list coverted back to the original alphabet
  let allStrings'' = map (map (char2char alphaMap')) allStrings'

  mapM_ putStrLn $ allStrings''

char2char :: Map Char Char -> Char -> Char
char2char m i = findWithDefault '*' i m

-- handy function to convert eg. [1,2,3] -> 123
-- from user sth on this thread: http://stackoverflow.com/a/1918515
fromDigits :: [Int] -> Int
fromDigits = foldl addDigit 0
   where addDigit num d = 10*num + d

toDigits :: Int -> [Int]
toDigits x = map digitToInt (show x)
