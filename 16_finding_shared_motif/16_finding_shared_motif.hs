module Main where

import Control.Monad (liftM)
import Data.List (isInfixOf)

main :: IO()
main = do
  seqs <- liftM lines $ getContents

  putStrLn $ subTwo (seqs!!0) (seqs!!1)

subTwo :: String -> String -> String
subTwo (x:xs) y = if (x:xs) == y
                   then y
                   else if xs `isInfixOf` y
                        then xs
                        else subTwo xs y
