module Main where

main :: IO()
main = do
  seq1 <- getLine
  seq2 <- getLine

  putStrLn $ show $ sum $ detectDiffs seq1 seq2

detectDiffs :: String -> String -> [Int]
detectDiffs [] [] = []
detectDiffs (x:xs) (y:ys)
    | x == y = 0 : detectDiffs xs ys
    | x /= y = 1 : detectDiffs xs ys  
    