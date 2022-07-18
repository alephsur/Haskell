module Luhn (isValid) where

import Data.Char
import Data.List    (reverse)


isValid :: String -> Bool
isValid n
    | length cleanStr == 1 = False
    | (luhn numberList) `mod` 10 == 0 = True
    | otherwise = False
    where 
        cleanStr = reverse $ filter isAlphaNum n
        numberList = map digitToInt cleanStr
        luhn (x:y:ys) = x + (if y<5 then y*2 else (y*2)-9) + luhn ys
        luhn [x] = x
        luhn [] = 0
