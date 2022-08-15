module WordCount (wordCount) where

import qualified Data.MultiSet as Mset
import Data.Char (isPunctuation, isNumber, isSpace, toLower)

wordCount :: String -> [(String, Int)]
wordCount xs = Mset.toOccurList $ Mset.fromList $ wodsCleanQuotation
    where
        cleanedSymbols = cleanString xs ""
        lowerString = map toLower cleanedSymbols
        listWords = words $ lowerString
        wodsCleanQuotation = map removeQuotation listWords


cleanString :: String -> String -> String
cleanString [] str = str
cleanString (x:xs) str
    | x `elem` punctuationSymbolValid = cleanString xs (str ++ [' '])
    | otherwise = cleanString xs (str ++ [x])
    where 
        punctuationSymbolValid = ['.','-','(', ')',',',':','!','&','@','$','%','^']



removeQuotation :: String -> String
removeQuotation (x:xs)
    | x == '\'' = cleanLastQuote $ reverse xs
    | otherwise = (x:xs)

cleanLastQuote :: String -> String
cleanLastQuote (x:xs)
    | x == '\'' = reverse xs
    | otherwise = reverse (x:xs)
