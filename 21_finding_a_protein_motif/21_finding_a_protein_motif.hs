module Main where

import Control.Monad (liftM, mapM, mapM_)
import Network.HTTP
import Text.Regex.Posix
import qualified Data.ByteString.Lazy.Char8 as B
import Bio.Core.Sequence (unSD)
import Bio.Sequence.Fasta (mkSeqs, seqdata)

main = do
  uniprotIds <- liftM lines $  getContents

  let uniprotStub = "http://www.uniprot.org/uniprot/"
  let regex = "N[^P][ST][^P]"

  fastas <- mapM (\x -> simpleHTTP
                        (getRequest $ uniprotStub ++ (getId x) ++ ".fasta")
                        >>= getResponseBody) uniprotIds

  let seqs = mkSeqs $ map B.pack $ concatMap lines fastas
  let seqString = B.unpack $ unSD $ seqdata (seqs!!0)
  let output = seqString =~ regex :: Int
  putStrLn $ show $ uniprotIds
  mapM_ putStrLn fastas
  mapM_ putStrLn (map show seqs)
  putStrLn $ show output

getId :: String -> String
getId = takeWhile (/= '_')
