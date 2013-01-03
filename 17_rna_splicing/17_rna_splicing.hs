module Main where

import Control.Monad(liftM)
import qualified Data.Text as T

main = do
  (genomicSeq:introns) <- liftM (T.lines . T.pack) $ getContents
  let splices = map (flip T.breakOn genomicSeq) introns
  let donors  = map fst splices
  let acceptors = zipWith T.stripPrefix (introns) (map snd splices)
  mapM_ putStrLn $ (map show acceptors)
