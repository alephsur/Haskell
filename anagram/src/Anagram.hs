module Anagram (anagramsFor) where

import      Data.List   (sort)
import      Data.Either
import      Data.Char (toUpper)


anagramsFor :: String -> [String] -> [String]
anagramsFor xs xss = filter (compareWords xs) xss


compareWords :: String -> String -> Bool
compareWords word1 word2 =            
    comparison && not comparisonEquals    
    where 
        comparison = sort (map toUpper word1) == sort (map toUpper word2)
        comparisonEquals = map toUpper word1 == map toUpper word2


