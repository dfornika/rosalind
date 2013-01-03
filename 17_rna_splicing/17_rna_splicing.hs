module Main where

import Control.Monad(liftM)
import qualified Data.Text as T

main = do
  (genomicSeq:introns) <- liftM (T.pack . lines) $ getContents

  putStrLn genomicSeq
  mapM_ putStrLn introns
