module Bob (responseFor) where

import Data.Char

responseFor :: String -> String
responseFor xs
    | trimStr == ""                              = "Fine. Be that way!"
    | isQuestion xs && allInUpperCase trimStr    = "Calm down, I know what I'm doing!"
    | isQuestion trimStr                         = "Sure."
    | (allInUpperCase trimStr) == True           = "Whoa, chill out!"
    | otherwise                             = "Whatever."
    where trimStr = trim xs


allInUpperCase :: String -> Bool
allInUpperCase xs = not (False `elem` checkedChars || checkedChars == [])
    where checkedChars = map isUpper $ filter isAlpha xs

isQuestion :: String -> Bool
isQuestion xs = last xs == '?'

trim :: String -> String
trim = f . f
    where f = reverse . dropWhile isSpace