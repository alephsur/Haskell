module SumOfMultiples (sumOfMultiples) where

import Data.List (nub,sum)

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples [] limit = 0
sumOfMultiples factors limit = 
    Data.List.sum $ nub $ processListToGetMultiples factors limit []


processListToGetMultiples :: [Integer] -> Integer -> [Integer] -> [Integer]
processListToGetMultiples [] limit acc = acc
processListToGetMultiples factors limit acc = 
    processListToGetMultiples (tail factors) limit (acc ++ (getMultiplesForNumber (head factors) 0 limit [] ))



getMultiplesForNumber :: Integer -> Integer -> Integer -> [Integer] -> [Integer]
getMultiplesForNumber 0 multiplier limit  acc = [0]
getMultiplesForNumber number multiplier limit  acc =
    if (number * multiplier) < limit then
        getMultiplesForNumber number (multiplier+1) limit acc ++ [(number * multiplier)]
    else
        acc
    

