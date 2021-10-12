module Pangram (isPangram) where

import Data.Char ( toLower)
import Data.List (sort, nub)

isPangram :: String -> Bool
isPangram text = (length $ nub $ filterLetter $ getLowerString $ sort text) == 26


filterLetter :: [Char] -> [Char]
filterLetter xs = 
    filter (\letter -> letter `elem` ['a'..'z']) xs


getLowerString::[Char] -> [Char]
getLowerString text = 
    map toLower text