module Main where

import Data.Map (Map, fromList, findWithDefault)
import Data.List (sortBy, sort)
import Control.Monad (liftM, replicateM)
import Data.Char (isSpace, digitToInt)

main = do
  alphabet <- liftM (filter (/= ' ')) $ getLine
  n <- liftM (\x -> read x :: Int) $ getLine
  let alphaMap  = fromList $ zip alphabet [0..]
  let alphaMap' = fromList $ zip [0..] alphabet

  let allStrings   = n `replicateM` alphabet
  let allStrings'  = sort $ map fromDigits $ map (map (char2int alphaMap)) allStrings
  let allStrings'' = map (map (int2char alphaMap')) $ map toDigits allStrings'

  putStrLn $ show $ allStrings
  putStrLn $ show $ allStrings'
  putStrLn $ show $ allStrings''
  putStrLn $ show $ alphaMap
  putStrLn $ show $ alphaMap'
  putStrLn $ show $ n

--  mapM_ putStrLn $ sortBy ordering allStrings

ordering :: String -> String -> Ordering
ordering = undefined

char2int :: Map Char Int -> Char -> Int
char2int m a = findWithDefault 0 a m

int2char :: Map Int Char -> Int -> Char
int2char m i = findWithDefault '*' i m

-- handy function to convert eg. [1,2,3] -> 123
-- from user sth on this thread: http://stackoverflow.com/a/1918515
fromDigits :: [Int] -> Int
fromDigits = foldl addDigit 0
   where addDigit num d = 10*num + d

toDigits :: Int -> [Int]
toDigits x = map digitToInt (show x)
