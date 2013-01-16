module Main where

import Control.Monad (liftM, mapM, mapM_)
import Network.HTTP

main = do

  uniprotIds <- liftM lines $  getContents
  let uniprotStub = "http://www.uniprot.org/uniprot/"
  fastas <- mapM (\x -> simpleHTTP
                        (getRequest $ uniprotStub ++ (getId x) ++ ".fasta")
                        >>= getResponseBody) uniprotIds
  putStrLn $ show $ uniprotIds
  mapM_ putStrLn fastas

getId :: String -> String
getId = takeWhile (/= '_')
