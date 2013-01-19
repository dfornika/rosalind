module Main where

import Control.Monad (liftM, mapM, mapM_)
import Data.List (intercalate)
import Data.List.Split (splitOn)
import Network.HTTP
import Text.Regex.Posix
import qualified Data.ByteString.Lazy.Char8 as B
import Bio.Core.Sequence (unSD, unSL)
import Bio.Sequence.Fasta (mkSeqs, seqdata, seqid, Sequence)

main = do
  uniprotIds <- liftM lines $  getContents

  let uniprotStub = "http://www.uniprot.org/uniprot/"
  let regex = "N[^P][ST][^P]"

  fastas <- mapM (\x -> simpleHTTP
                        (getRequest $ uniprotStub ++ (getId x) ++ ".fasta")
                        >>= getResponseBody) uniprotIds

  let seqs = mkSeqs $ map B.pack $ concatMap lines fastas

  let motifResult = map (findMotif regex) seqs

  mapM_ putStrLn $ map formatResult motifResult

getId :: String -> String
getId = takeWhile (/= '_')

findMotif :: String -> Sequence -> (String, [(MatchOffset, MatchLength)])
findMotif regex seq = (label, matches)
  where label = B.unpack $ unSL $ seqid seq
        matches = getAllMatches ((B.unpack $ unSD $ seqdata seq) =~ regex) :: [(MatchOffset, MatchLength)]

formatResult :: (String, [(Int, Int)]) -> String
formatResult (_, []) = ""
formatResult (id, matches) = (splitOn "|" id)!!1 ++ "\n" ++ unwords (map (show . (+ 1) . fst) matches)
