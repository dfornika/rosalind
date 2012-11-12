module Main where

import Control.Monad
import Data.Map (fromListWith, elems)
import Data.List (intersperse)

main :: IO()
main = do
  seq <- getLine
  let baseMap = fromListWith (+) [(c, (read "1" :: Int)) | c <- seq]
  let output = elems baseMap
  putStrLn $ (show $ output!!0) ++ " " ++ (show $ output!!1) ++ " " ++ (show $ output!!2) ++ " " ++ (show $ output!!3) 