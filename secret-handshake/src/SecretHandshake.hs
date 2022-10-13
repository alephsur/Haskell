module SecretHandshake (handshake) where

import Numeric (showIntAtBase)
import Data.Char (intToDigit)
import Data.Bits (testBit)

handshake :: Int -> [String]
handshake n = reverseHandShake n list
  where
    list = map snd . filter (testBit n . fst) $ zip [0..] moves
    
moves = ["wink", "double blink", "close your eyes", "jump"]

reverseHandShake :: Int -> [String] -> [String]
reverseHandShake n list
    | testBit n 4 = reverse list
    | otherwise = list