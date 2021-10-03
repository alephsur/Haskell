module Pangram (isPangram) where

import Data.Char ( toLower)
import Data.List (sort)

isPangram :: String -> Bool
isPangram text = (Prelude.length $ unique $ filterLetter $ getLowerString $ sort text) == 26


filterLetter :: [Char] -> [Char]
filterLetter xs = 
    Prelude.filter (\letter -> letter `elem` ['a'..'z']) xs


unique :: [Char] -> [Char]
unique [] = []
unique (x:xs) = x:unique (Prelude.filter ((/=) x) xs)


getLowerString::[Char] -> [Char]
getLowerString text = 
    map toLower text