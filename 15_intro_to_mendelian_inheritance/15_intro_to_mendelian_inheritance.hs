module Main where

import Control.Monad (liftM)
import Control.Monad.State

main :: IO ()
main = do
  -- It's ugly, but this line takes a string of whitespace-separated
  -- numbers from stdin and returns a list of integers
  input <- liftM ((map (\x -> read x :: Int)) . words) $ getLine

  let inputPop = Population { homoDom = (input!!0)
                            , het     = (input!!1)
                            , homoRec = (input!!2) }
  putStrLn $ show $ inputPop
  putStrLn $ show $ popIntToFloat inputPop

data Population a = Population { homoDom :: a
                               , het     :: a
                               , homoRec :: a
                               } deriving (Show)

data Individual = HomozygousDominant | Heterozygous | HomozygousRecessive

drawMate :: State (Population a) Individual
drawMate = undefined

probHasDomAllele :: Individual -> Individual -> Double
probHasDomAllele HomozygousDominant _                    = 1.0
probHasDomAllele _ HomozygousDominant                    = 1.0
probHasDomAllele Heterozygous Heterozygous               = 0.75
probHasDomAllele Heterozygous HomozygousRecessive        = 0.5
probHasDomAllele HomozygousRecessive Heterozygous        = 0.5
probHasDomAllele HomozygousRecessive HomozygousRecessive = 0.0

popIntToFloat :: Population Int -> Population Double
popIntToFloat x = Population { homoDom = (fromIntegral $ homoDom x) / totalPop
                             , het     = (fromIntegral $ het x) / totalPop
                             , homoRec = (fromIntegral $ homoRec x) / totalPop }
                  where totalPop = fromIntegral $ (homoDom x) + (het x) + (homoRec x)
