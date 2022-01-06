module CryptoSquare (encode) where

import Data.Char
import Data.List    (intercalate, transpose)


encode :: String -> String
encode xs = unwords . transpose $ matrix
    where 
        str = filter isAlphaNum . map toLower $ xs
        matrixLen = ceiling . sqrt .fromIntegral $ length str
        matrix = getMatrix str matrixLen []

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