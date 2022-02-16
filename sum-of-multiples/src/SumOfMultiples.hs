module SumOfMultiples (sumOfMultiples) where

import Data.List (nub,sum, concat)

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples [] limit = 0
sumOfMultiples factors limit = 
    Data.List.sum $ nub $ concat (processListToGetMultiples factors limit)



getMultiplesForNumber :: Integer -> Integer -> [Integer]
getMultiplesForNumber 0 limit = [0]
getMultiplesForNumber number limit = takeWhile (<limit) [number*i |i <- [1..]]


processListToGetMultiples :: [Integer] -> Integer -> [[Integer]]
processListToGetMultiples factors limit = [(getMultiplesForNumber i limit) | i <- factors]
