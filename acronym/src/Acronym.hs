module Acronym (abbreviate) where

import qualified Data.Text as T
import           Data.Text (Text)
import           Data.Char (toUpper, isAlpha, isSpace)

abbreviate :: String -> String
abbreviate xs = processString (removePuntuaction xs "") ' ' ""


processString :: String -> Char -> String -> String
processString [] previous result = result
processString [a] previous result = result
processString (a:xs) previous result
    | previous `elem` ['A'..'Z'] = processString xs a result
    | a `elem` ['A'..'Z'] = processString xs a (result ++ [a])
    | a == ' ' && isAlpha (head xs) = processString (tail xs) a (result ++ [toUpper $ head xs]) 
    | (head xs) `elem` ['A'..'Z'] = processString (tail xs) (head xs) (result ++ [head xs])
    | (head xs) `elem` ['A'..'Z'] = processString (tail xs) (head xs) (result ++ [toUpper $ head xs])
    | otherwise = processString xs (head xs) result



removePuntuaction :: String -> String -> String
removePuntuaction [] result = result
removePuntuaction (x:xs) result
    | isAlpha x == True = removePuntuaction xs (result ++ [x])
    | isSpace x == True = removePuntuaction xs (result ++ [x])
    | (x == '\'') == True = removePuntuaction xs result
    | otherwise = removePuntuaction xs (result ++ " ")
