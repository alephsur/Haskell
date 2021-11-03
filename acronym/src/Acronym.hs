module Acronym (abbreviate) where

import qualified Data.Text as T
import           Data.Text (Text)
import           Data.Char (toUpper)

abbreviate :: String -> String
abbreviate xs = processArrayWords wordList ""
    where wordList = getArrayWords xs


getArrayWords :: String -> [Text]
getArrayWords xs = T.words $ removePuntuation (T.pack xs) listSymbols
    where listSymbols = ["-","_"]


removePuntuation :: Text -> [String] -> Text
removePuntuation xs [] = xs
removePuntuation xs listSymbols = removePuntuation (T.replace (T.pack symbol) (T.pack " ") xs) (tail listSymbols)
    where symbol = head listSymbols


processArrayWords :: [Text] -> String -> String
processArrayWords [] result = result
processArrayWords wordList result = processArrayWords (tail wordList) (result ++ (getLettersPerWord word))
    where word = head wordList


getLettersPerWord :: Text -> String
getLettersPerWord word = [firstLetter] ++ (filter (`elem` ['A'..'Z']) (tail wordString))
    where 
        wordString = T.unpack word
        firstLetter = toUpper $ head wordString
