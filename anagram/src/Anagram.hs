module Anagram (anagramsFor) where

import      Data.List   (sort)
import      Data.Either
import      Data.Char (toUpper)


anagramsFor :: String -> [String] -> [String]
anagramsFor xs xss = processListOfWords xs xss []


processListOfWords :: String -> [String] -> [String] -> [String]
processListOfWords _ [] result = result
processListOfWords xs (x:xss) result
    | isRight $ compareWords xs x = processListOfWords xs xss (result ++ [x])
    | otherwise = processListOfWords xs xss result


compareWords :: String -> String -> Either String String
compareWords word1 word2 =            
    if comparison == True && comparisonEquals == False then        
        Right word2
    else 
        Left word2
    where 
        comparison = (sort (map toUpper word1)) == (sort (map toUpper word2))
        comparisonEquals = (map toUpper word1) == map toUpper word2


