module SecretHandshake (handshake) where

import Numeric (showIntAtBase)
import Data.Char (intToDigit)

handshake :: Int -> [String]
handshake n = generateHandShake bnumber 1 []
    where bnumber = reverse $ showNumberInBase2 n


showNumberInBase2 :: Int -> String
showNumberInBase2 n = showIntAtBase 2 intToDigit n ""


generateHandShake :: String -> Integer -> [String] -> [String]
generateHandShake [] _ acc = acc
generateHandShake (x:xs) p acc
    | x == '1' && p == 1 = generateHandShake xs (p+1) (acc ++ ["wink"])
    | x == '1' && p == 2 = generateHandShake xs (p+1) (acc ++ ["double blink"])
    | x == '1' && p == 3 = generateHandShake xs (p+1) (acc ++ ["close your eyes"])
    | x == '1' && p == 4 = generateHandShake xs (p+1) (acc ++ ["jump"])
    | x == '1' && p == 5 = generateHandShake xs (p+1) (reverse acc)
    | otherwise = generateHandShake xs (p+1) acc

