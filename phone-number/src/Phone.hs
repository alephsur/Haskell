module Phone (number) where

import Data.Char (isPunctuation, isDigit, isSpace)

number :: String -> Maybe String
number xs = isValidNumber cleanNumber
    where cleanNumber = filter isDigit xs



isValidNumber :: String -> Maybe String
isValidNumber n 
    | length n < 10 = Nothing
    | length n == 11 && (n !! 0) /= '1' = Nothing
    | length n > 11 = Nothing
    | length n == 11 && ((n !! 4) == '1' || (n !! 4) == '0') = Nothing
    | length n == 11 && ((n !! 1) == '1' || (n !! 1) == '0') = Nothing
    | length n == 11 && (n !! 0) == '1' = Just (tail n)    
    | length n == 10 && ((n !! 3) == '1' || (n !! 3) == '0') = Nothing
    | length n == 10 && ((n !! 0) == '1' || (n !! 0) == '0') = Nothing
    | otherwise = Just n