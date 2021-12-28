module CryptoSquare (encode) where

import Data.Char
import Data.List    (intercalate, transpose)

encode :: String -> String
encode xs = intercalate " " $ transpose matrix
    where 
        str = removePuntuactionAndUpper xs
        matrixLen = fst (calculateSquareSize str)
        matrix = getMatrix str matrixLen []


removePuntuactionAndUpper :: String -> String
removePuntuactionAndUpper str = [toLower x | x <- str, not (x `elem` ".,;:' %!@")] 

calculateSquareSize :: String -> (Int, Int)
calculateSquareSize str =
    let strLen = length str
        sqrtLen = round $ sqrt $ (fromIntegral strLen)/1
        isRectangle = sqrtLen^2 < strLen  
    in if isRectangle then (sqrtLen +1, sqrtLen) else (sqrtLen, sqrtLen)


getMatrix :: String -> Int -> [String] -> [String]
getMatrix [] _ acc = acc
getMatrix str matrixLen acc =
    let strSplited = splitAt matrixLen str
        restStr = snd strSplited
        chunk = fst strSplited
    in getMatrix restStr matrixLen (acc ++ [paddingRigth chunk matrixLen])


paddingRigth :: String -> Int -> String
paddingRigth str x 
    | length str < x = str ++ replicate (x - length str) ' '
    | otherwise = str