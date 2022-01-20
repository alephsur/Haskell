{-# LANGUAGE TupleSections #-}

module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map         (Map, fromList, fromListWith, union)
import Data.Either

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs = 
    if isLeft mapSequence then
        Left xs
    else
        Right $ union mapedSequence (fromList [(A,0),(C,0),(G,0),(T,0)])
    where
        mapSequence = histogram <$> (sequence $ map convert xs)
        mapedSequence = fromListWith (+) (fromRight [] mapSequence)
        histogram list =[(x, 1) | x <- list]



convert :: Char -> Either String Nucleotide
convert 'A' = Right A
convert 'C' = Right C
convert 'G' = Right G
convert 'T' = Right T
convert _ = Left "X"


