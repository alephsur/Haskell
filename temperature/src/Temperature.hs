module Temperature (tempToC, tempToF) where

{- Implement the function `tempToC` to convert
`  Fahrenheit to Celsius                    -}

tempToC :: Integer -> Float
tempToC temp = (tempF - 32) / 1.8
    where tempF = fromIntegral temp :: Float


{- Implement the function `tempToF` to convert
`  Celsius to Fahrenheit                    -}

tempToF :: Float -> Integer
tempToF temp = tempI
    where tempI = ceiling $ (temp * 1.8) + 32