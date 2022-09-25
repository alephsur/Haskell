module SecretHandshake (handshake) where

import Numeric (showIntAtBase)
import Data.Char (intToDigit)
import Data.Bits (testBit)

handshake :: Int -> [String]
handshake n = generateHandShake' n [] 5


generateHandShake' :: Int -> [String] -> Int -> [String]
generateHandShake' n result 0 = result
generateHandShake' n result steps
    | testBit n 0 && steps == 5 = generateHandShake' n  (result ++ ["wink"]) (steps -1)
    | testBit n 1 && steps == 4 = generateHandShake' n (result ++ ["double blink"]) (steps -1)
    | testBit n 2 && steps == 3 = generateHandShake' n (result ++ ["close your eyes"]) (steps -1)
    | testBit n 3 && steps == 2 = generateHandShake' n (result ++ ["jump"]) (steps -1)
    | testBit n 4 && steps == 1 = generateHandShake' n (reverse result) (steps -1)
    | otherwise = generateHandShake' n result (steps - 1)

    
    
