module Main where

import Data.Map (fromList)
import Control.Monad (liftM)
import Data.Char (isSpace)

main = do
  alphabet <- liftM (filter (/= ' ')) $ getLine
  n <- liftM (\x -> read x :: Int) $ getLine
  let alphaMap = fromList $ zip alphabet [1..]

  putStrLn $ show $ alphaMap
  putStrLn $ show $ n
ordering :: String -> String -> Ordering
ordering = undefined

char2int :: Char -> Int
char2int = undefined
