module Luhn (isValid) where

import Data.Char
import Data.List.Split (chunksOf)
import Data.List    (reverse)


isValid :: String -> Bool
isValid n
    | length cleanStr == 1 = False
    | totalSum `mod` 10 == 0 = True
    | otherwise = False
    where 
        cleanStr = filter isAlphaNum n
        str = reverse cleanStr        
        listDobleNumber = getListOfNumber str 1 ""
        totalSum = sumDigitsString listDobleNumber



getListOfNumber :: String -> Int -> String -> String
getListOfNumber [] _ acc = acc
getListOfNumber (x:xs) i acc
    | even i = if n*2 > 9 then getListOfNumber xs (i+1) (acc ++ nIndexEvenGT9:[]) else  getListOfNumber xs (i+1) (acc ++ nIndexEvenLT9:[])
    | otherwise = getListOfNumber xs (i+1) (acc ++ x:[])
    where 
        n = digitToInt x
        nIndexEvenGT9 = intToDigit ((n*2)-9)
        nIndexEvenLT9 = intToDigit (n*2)

sumDigitsString :: String -> Int
sumDigitsString str = foldl (\acc x -> acc + (digitToInt x)) 0 str

