module Acronym (abbreviate) where

import           Data.Char (toUpper, isLetter)
import           Data.List (partition)

abbreviate :: String -> String
abbreviate xs = concat $ map (getCapitalLetters) $ words cleanString
    where cleanString = map onlyLetter xs

onlyLetter :: Char -> Char
onlyLetter c
    | isLetter c = c
    | '\'' == c = c
    | otherwise = ' '

getCapitalLetters :: String -> String
getCapitalLetters word
    | length capitalLetters > 0 && word /= capitalLetters = capitalLetters
    | otherwise = [toUpper $ (head word)]
    where
        capitalLetters = fst $ partition (`elem` ['A'..'Z']) word
