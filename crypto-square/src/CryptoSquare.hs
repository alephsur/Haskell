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
    let (chunk,restStr) = splitAt matrixLen str
    in getMatrix restStr matrixLen (acc ++ [paddingRigth chunk matrixLen])


paddingRigth :: String -> Int -> String
paddingRigth str x 
    | l <- length str, l < x = str ++ replicate (x - l) ' '
    | otherwise = str