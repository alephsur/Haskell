module Phone (number) where

import Data.Char (isPunctuation, isNumber, isSpace)

number :: String -> Maybe String
number xs = case cleanNumber xs "" of
                Nothing -> Nothing
                Just n -> isValidNumber n


cleanNumber :: String -> String -> Maybe String
cleanNumber [] str = Just str
cleanNumber (x:xs) str
    | isNumber x = cleanNumber xs (str ++ [x])
    | x `elem` punctuationSymbolValid = cleanNumber xs str
    | isSpace x = cleanNumber xs str
    | otherwise = Nothing

punctuationSymbolValid = ['.','-','(', ')','+']


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