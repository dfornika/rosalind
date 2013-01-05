module Main where

import Data.Map (Map, fromList, findWithDefault)
import Data.List (sortBy, sort)
import Control.Monad (liftM, replicateM)
import Data.Char (isSpace)

main = do
  alphabet <- liftM (filter (/= ' ')) $ getLine
  n <- liftM (\x -> read x :: Int) $ getLine
  let alphaMap = fromList $ zip alphabet [1..]

  -- Thanks to user ehird on StackOverflow for this trick:
  -- http://stackoverflow.com/questions/9542313/how-to-generate-a-list-of-all-possible-strings-from-shortest-to-longest#comment12091830_9542313
  let allStrings   = [1..n] >>= (`replicateM` alphabet)
  let allStrings'  = sort $ map fromDigits $ map (map (char2int alphaMap)) allStrings
  let allStrings'' = undefined

  putStrLn $ show $ allStrings'
  putStrLn $ show $ alphaMap
  putStrLn $ show $ n

--  mapM_ putStrLn $ sortBy ordering allStrings

ordering :: String -> String -> Ordering
ordering = undefined

char2int :: Map Char Int -> Char -> Int
char2int m a = findWithDefault 0 a m

-- handy function to convert eg. [1,2,3] -> 123
-- from user sth on this thread: http://stackoverflow.com/a/1918515
fromDigits :: [Int] -> Int
fromDigits = foldl addDigit 0
   where addDigit num d = 10*num + d
