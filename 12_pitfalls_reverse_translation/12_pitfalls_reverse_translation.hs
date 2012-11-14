module Main where

import qualified Data.Map as Map
import Data.Int(Int64)

main :: IO ()
main = do
  seq <- getLine
  
  -- oof, this one's ugly
  putStrLn $ show $ (foldl1 (modMultiply 1000000) (3:(map aa2int seq)))

modMultiply :: Int -> Int -> Int -> Int 
modMultiply m a b = (a `mod` m) * b

aa2int :: Char -> Int
aa2int aa = Map.findWithDefault 1 aa aaMap
           where aaMap = Map.fromList [ ('F', 2)
                                      , ('L', 6)
                                      , ('I', 3)
                                      , ('M', 1)
                                      , ('V', 4)
                                      , ('S', 4)
                                      , ('P', 4)
                                      , ('T', 4)
                                      , ('A', 4)
                                      , ('Y', 2)
                                      , ('H', 2)
                                      , ('Q', 2)
                                      , ('N', 2)
                                      , ('K', 2)
                                      , ('D', 2)
                                      , ('E', 2)
                                      , ('C', 2)
                                      , ('W', 1)
                                      , ('R', 6)
                                      , ('S', 2)
                                      , ('G', 4) ]
