module Main where

import System.Environment (getArgs)
import Control.Monad (liftM)

main :: IO()
main = do
  inFile <- liftM head getArgs
  seqs <- liftM words $ readFile inFile

  putStrLn $ show $ seqs
