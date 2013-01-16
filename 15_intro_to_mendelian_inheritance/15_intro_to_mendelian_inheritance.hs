module Main where

import Control.Monad (liftM)
import Data.Ratio

main :: IO ()
main = do
  -- It's ugly, but this line takes a string of whitespace-separated
  -- numbers from stdin and returns a list of integers
  input <- liftM ((map (\x -> read x :: Int)) . words) $ getLine
  putStrLn $ show $ fromRational $
    probSecondMateHomoDom (probFirstMateHomoDom (input!!0) (input!!1) (input!!2)) (input!!0) (input!!1) (input!!2)
--  putStrLn $ show $ fromRational $
--    probOffspringPosessDom (input!!0) (input!!1) (input!!2)

--------------------------------------------------------------------------------
{-- Consider the following probability table:

    firstMate            | A A | A A | A A | A a | A a | A a | a a | a a | a a |
    secondMate           | A A | A a | a a | A A | A a | a a | A A | A a | a a |
    probOffspringHomoDom |  1  | 1/2 |  0  | 1/2 | 1/4 |  0  |  0  |  0  |  0  |
    probOffspringHet     |  0  | 1/2 |  1  | 1/2 | 1/2 | 1/2 |  1  | 1/2 |  0  |
    probOffspringHomoRec |  0  |  0  |  0  |  0  | 1/4 | 1/2 |  0  | 1/2 |  1  |


probOffspringPosessDom :: Int -> Int -> Int -> Rational
probOffspringPosessDom k m n = probOffspringHomoDom + probOffspringHet
  where probOffspringHomoDom = (probSecondMateHomoDom (probFirstMateHomoDom k m n) k m n) * (1%1) +
                               (probSecondMateHomoDom (probFirstMateHet k m n) k m n)     * (1%2) +
                               (probSecondMateHomoDom (probFirstMateHomoRec k m n) k m n) * (0%1) +
                               (probSecondMateHet (probFirstMateHomoDom k m n) k m n)     * (1%2) +
                               (probSecondMateHet (probFirstMateHet k m n) k m n)         * (1%4) +
                               (probSecondMateHet (probFirstMateHomoRec k m n) k m n)     * (0%1) +
                               (probSecondMateHomoRec (probFirstMateHomoDom k m n) k m n) * (0%1) +
                               (probSecondMateHomoRec (probFirstMateHet k m n) k m n)     * (0%1) +
                               (probSecondMateHomoRec (probFirstMateHomoRec k m n) k m n) * (0%1)
        probOffspringHet     = (probSecondMateHomoDom (probFirstMateHomoDom k m n) k m n) * (0%1) +
                               (probSecondMateHomoDom (probFirstMateHet k m n) k m n)     * (1%2) +
                               (probSecondMateHomoDom (probFirstMateHomoRec k m n) k m n) * (1%1) +
                               (probSecondMateHet (probFirstMateHomoDom k m n) k m n)     * (1%2) +
                               (probSecondMateHet (probFirstMateHet k m n) k m n)         * (1%2) +
                               (probSecondMateHet (probFirstMateHomoRec k m n) k m n)     * (1%2) +
                               (probSecondMateHomoRec (probFirstMateHomoDom k m n) k m n) * (1%1) +
                               (probSecondMateHomoRec (probFirstMateHet k m n) k m n)     * (1%2) +
                               (probSecondMateHomoRec (probFirstMateHomoRec k m n) k m n) * (0%1)
        probOffspringHomoRec = undefined
--}

probFirstMateHomoDom :: Int -> Int -> Int -> Rational
probFirstMateHomoDom k m n = (toInteger k) % (toInteger $ k + m + n)

probFirstMateHet :: Int -> Int -> Int -> Rational
probFirstMateHet k m n = (toInteger m) % (toInteger $ k + m + n)

probFirstMateHomoRec :: Int -> Int -> Int -> Rational
probFirstMateHomoRec k m n = (toInteger n) % (toInteger $ k + m + n)

probSecondMateHomoDom :: Rational -> Int -> Int-> Int -> Rational
probSecondMateHomoDom x k m n = (x * (k - 1) + (1 - x) * k) % (k + m + n - 1)
{--
probSecondMateHet :: Rational -> Int -> Int-> Int -> Rational
probSecondMateHet x k m n = (x * (m - 1) + (1 - x) * m) % (k + m + n - 1)

probSecondMateHomoRec :: Rational -> Int -> Int-> Int -> Rational
probSecondMateHomoRec x k m n = (x * (n - 1) + (1 - x) * n) % (k + m + n - 1)
--}
