module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys 
    | lxs == lys = Just $ compareNucleotideList xs ys 0
    | otherwise = Nothing
    where
        lxs = length xs
        lys = length ys


compareNucleotideList:: String -> String -> Int -> Int
compareNucleotideList [] [] acc = acc
compareNucleotideList (x:xs) (y:ys) acc =
    compareNucleotideList xs ys (acc + w)
    where 
        w = compareNucleotide x y


compareNucleotide:: Char -> Char -> Int
compareNucleotide x y
    | x /= y = 1
    | otherwise = 0


