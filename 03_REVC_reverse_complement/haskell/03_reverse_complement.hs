module Main where

main :: IO()
main = do
  seq <- getLine
  putStrLn $ reverse $ map complement seq

complement :: Char -> Char
complement 'A' = 'T'
complement 'C' = 'G'
complement 'G' = 'C'
complement 'T' = 'A'
complement  _  = 'N' 