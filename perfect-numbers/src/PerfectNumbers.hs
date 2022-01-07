module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

classify :: Int -> Maybe Classification
classify = getClassification


getClassification :: Int -> Maybe Classification
getClassification n 
    | n <= 0 = Nothing
    | f == n = Just Perfect
    | f > n = Just Abundant
    | f < n = Just Deficient
    | otherwise = Nothing
    where 
        f = getFactor n

getFactor :: Int -> Int
getFactor n = sum [x | x <- [1..(n-1)], n `mod` x == 0] 


