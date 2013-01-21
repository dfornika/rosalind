module Main where

import Control.Monad (liftM, mapM, mapM_)
import Data.List (intercalate)
import Data.List.Split (splitOn)
import Network.HTTP
import Text.Regex
import Text.Regex.PCRE
import qualified Data.ByteString.Lazy.Char8 as B
import Bio.Core.Sequence (unSD, unSL)
import Bio.Sequence.Fasta (mkSeqs, seqdata, seqid, Sequence)

main = do
  accessIDs <- liftM lines $  getContents

  let uniprotStub = "http://www.uniprot.org/uniprot/"
  let regex = "N(?=[^P][ST][^P])"

  fastas <- mapM (\x -> simpleHTTP
                        (getRequest $ uniprotStub ++ (getID x) ++ ".fasta")
                        >>= getResponseBody) accessIDs

  let seqs = mkSeqs $ map B.pack $ concatMap lines fastas

  let motifResult = map (findMotif regex) seqs

  mapM_ putStr $ map formatResult (zip accessIDs motifResult)

getID :: String -> String
getID = takeWhile (/= '_')

findMotif :: String -> Sequence -> [(MatchOffset, MatchLength)]
findMotif regex seq = getAllMatches ((B.unpack $ unSD $ seqdata seq) =~ regex) :: [(MatchOffset, MatchLength)]

formatResult :: (String, [(Int, Int)]) -> String
formatResult (_, []) = ""
formatResult (id, matches) = id ++ "\n" ++ unwords (map (show . (+ 1) . fst) matches) ++ "\n"
