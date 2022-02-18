module SumOfMultiples (sumOfMultiples) where

import Data.List (nub,sum, concat)

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples [] limit = 0
sumOfMultiples factors limit = Data.List.sum . nub . concatMap (getMultiplesForNumber limit) $ factors


getMultiplesForNumber :: Integer -> Integer -> [Integer]
getMultiplesForNumber limit 0  = [0]
getMultiplesForNumber limit number = takeWhile (<limit) [number*i |i <- [1..]]
