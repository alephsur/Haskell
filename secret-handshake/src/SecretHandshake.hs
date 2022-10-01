module SecretHandshake (handshake) where

import Numeric (showIntAtBase)
import Data.Char (intToDigit)
import Data.Bits (testBit)

handshake :: Int -> [String]
handshake n = reverseHandShake n list
    where list = foldl (generateHandShake' n) [] moves

moves :: [(Int, String)]
moves = zip [0..] ["wink", "double blink", "close your eyes", "jump"]

    
generateHandShake' :: Int -> [String] -> (Int,String) -> [String]
generateHandShake' n acc x 
    | testBit n (fst x) && (fst x) == 0 = acc ++ [value]
    | testBit n (fst x) && (fst x) == 1 = acc ++ [value]
    | testBit n (fst x) && (fst x) == 2 = acc ++ [value]
    | testBit n (fst x) && (fst x) == 3 = acc ++ [value]
    | otherwise = acc
    where 
        value = snd x

reverseHandShake :: Int -> [String] -> [String]
reverseHandShake n list
    | testBit n 4 = reverse list
    | otherwise = list