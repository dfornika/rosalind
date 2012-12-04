module Main where

import Control.Monad (liftM)
import Data.Ratio

main :: IO ()
main = do
  input <- liftM (map (\x -> read x :: Int)) $ liftM words getLine
  putStrLn $ show $ input
--  putStrLn $ show $ probPosessDom (input!!0) (input!!1) (input!!2)

probPosessDom :: Int -> Int -> Int -> Double
probPosessDom k m n = probHomoDom + probHet
  where probSelected x = (fromIntegral x) / (fromIntegral (k + m + n))
        probHomoDom = undefined
        probHet     = undefined
        probHomoRec = undefined

probFirstMateHomoDom :: Int -> Int -> Int -> Rational
probFirstMateHomoDom k m n = (fromIntegral k) % (fromIntegral (k + m + n))

probFirstMateHet :: Int -> Int -> Int -> Rational
probFirstMateHet k m n = (fromIntegral m) % (fromIntegral (k + m + n))

probFirstMateHomoRec :: Int -> Int -> Int -> Rational
probFirstMateHomoRec k m n = (fromIntegral n) % (fromIntegral (k + m + n))

probSecondMateHomoDom :: Double -> Double -> Double -> Double
probSecondMateHomoDom = undefined
