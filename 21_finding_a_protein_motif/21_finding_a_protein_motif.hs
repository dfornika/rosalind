module Main where

import Control.Monad(liftM)

main = do
  uniprotIds <- liftM lines $  getContents

  putStrLn $ show uniprotIds
