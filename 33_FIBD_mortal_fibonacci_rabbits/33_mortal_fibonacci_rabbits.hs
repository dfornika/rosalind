module Main where

import Control.Monad (liftM)
import Control.Monad.State
import Data.List (genericTake)

data Rabbits = Rabbits { mature   :: Integer
                       , immature :: Integer
                       , newborns :: Integer
                       }

main :: IO()
main = do
  [n,k] <- liftM (map (\x -> read x :: Integer)) $ liftM words getLine
  putStrLn $ show $ rabbitPairs n k

initialState :: Rabbits
initialState = Rabbits { mature   = 0
                       , immature = 1
                       , newborns = 0
                       }

rabbitPairs :: Integer -> Integer -> Integer
rabbitPairs 1 _ = 1
rabbitPairs 2 _ = 1
rabbitPairs n k = total $ last $ genericTake n $ iterate (tick k) initialState

becomeMature :: Rabbits -> Rabbits
becomeMature r = Rabbits { mature   = (mature r + immature r)
                         , immature = 0
                         , newborns = newborns r
                         }

breed :: Integer -> Rabbits -> Rabbits
breed k r = Rabbits { mature   = mature r
                    , immature = immature r
                    , newborns = new
                    }
  where new = mature r * k

clearNewborns :: Rabbits -> Rabbits
clearNewborns r = Rabbits { mature = mature r
                          , immature = immature r + newborns r
                          , newborns = 0
                          }

total :: Rabbits -> Integer
total r = mature r + immature r

tick :: Integer -> Rabbits -> Rabbits
tick k r = clearNewborns $ becomeMature $ breed k r
