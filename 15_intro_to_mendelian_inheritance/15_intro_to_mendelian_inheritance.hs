module Main where

import Control.Monad (liftM)
import Data.Ratio

main :: IO ()
main = do
  -- It's ugly, but this line converts a string of whitespace-separated
  -- numbers into a list of integers
  input <- liftM (map (\x -> read x :: Int)) $ liftM words getLine

  putStrLn $ show $ probPosessDom (input!!0) (input!!1) (input!!2)

{-- Consider the following probability table:

    firstMate            | A A | A A | A A | A a | A a | A a | a a | a a | a a |
    secondMate           | A A | A a | a a | A A | A a | a a | A A | A a | a a |
    probOffspringHomoDom |  1  | 1/2 |  0  | 1/2 | 1/4 |  0  |  0  |  0  |  0  |
    probOffspringHet     |  0  | 1/2 |  1  | 1/2 | 1/2 | 1/2 |  1  | 1/2 |  1  |
    probOffspringHomoRec |  0  |  0  |  0  |  0  | 1/4 | 1/2 |  0  | 1/2 |  1  |
--}

probOffspringPosessDom :: Int -> Int -> Int -> Double
probOffspringPosessDom k m n = probOffspringHomoDom + probOffspringHet
  where probOffspringHomoDom = probSecondMateHomoDom (probFirstMateHomoDom k m n) k m n
                               probSecondMateHomoDom (probFirstMateHet k m n) k m n
                               probSecondMateHomoDom (probFirstMateHomoRec k m n) k m n
                               probSecondMateHet (probFirstMateHomoDom k m n) k m n
                               probSecondMateHet (probFirstMateHet k m n) k m n
                               probSecondMateHet (probFirstMateHomoRec k m n) k m n
                               probSecondMateHomoRec (probFirstMateHomoDom k m n) k m n
                               probSecondMateHomoRec (probFirstMateHet k m n) k m n
                               probSecondMateHomoRec (probFirstMateHomoRec k m n) k m n
        probOffspringHet     = undefined
        probOffspringHomoRec = undefined

probFirstMateHomoDom :: Int -> Int -> Int -> Rational
probFirstMateHomoDom k m n = (fromIntegral k) % (fromIntegral (k + m + n))

probFirstMateHet :: Int -> Int -> Int -> Rational
probFirstMateHet k m n = (fromIntegral m) % (fromIntegral (k + m + n))

probFirstMateHomoRec :: Int -> Int -> Int -> Rational
probFirstMateHomoRec k m n = (fromIntegral n) % (fromIntegral (k + m + n))

probSecondMateHomoDom :: Rational -> Int -> Int-> Int -> Rational
probSecondMateHomoDom x k m n = undefined
