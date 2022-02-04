{-# LANGUAGE TupleSections #-}

module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map         (Map, fromList, fromListWith, union)
import Data.Either

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs = 
    histogram <$> (traverse convert xs)


histogram :: [Nucleotide] -> Map Nucleotide Int
histogram list = fromListWith (+) $ [(x, 1) | x <- list]

convert :: Char -> Either String Nucleotide
convert 'A' = Right A
convert 'C' = Right C
convert 'G' = Right G
convert 'T' = Right T
convert _ = Left "X"


