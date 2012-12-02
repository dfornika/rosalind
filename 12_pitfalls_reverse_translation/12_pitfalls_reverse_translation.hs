module Main where

import qualified Data.Map as Map
import Data.Int(Int64)

main :: IO ()
main = do
  seq <- getLine

  -- Note that 3 is appended to the input seq because
  -- there are three possible stop codons
  putStrLn $ show $
    (foldl1 (*) (3:(map aa2int seq))) `mod` 1000000

-- Map each amio acid to the number of possible codons that encode that aa
aa2int :: Char -> Integer
aa2int aa = Map.findWithDefault 1 aa aaMap
           where aaMap = Map.fromList [ ('F', 2)
                                      , ('L', 6)
                                      , ('I', 3)
                                      , ('M', 1)
                                      , ('V', 4)
                                      , ('S', 6)
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
                                      , ('G', 4) ]
