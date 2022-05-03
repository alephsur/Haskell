module Anagram (anagramsFor) where

import      Data.List   (sort)
import      Data.Either
import      Data.Char (toUpper)


anagramsFor :: String -> [String] -> [String]
anagramsFor xs xss = processListOfWords xs xss []


processListOfWords :: String -> [String] -> [String] -> [String]
processListOfWords _ [] result = reverse result
processListOfWords xs (x:xss) result
    | compareWords xs x = processListOfWords xs xss (x : result)
    | otherwise = processListOfWords xs xss result


compareWords :: String -> String -> Bool
compareWords word1 word2 =            
    comparison && not comparisonEquals    
    where 
        comparison = sort (map toUpper word1) == sort (map toUpper word2)
        comparisonEquals = map toUpper word1 == map toUpper word2


