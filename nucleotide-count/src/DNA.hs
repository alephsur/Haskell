module DNA (nucleotideCounts, updateMap, Nucleotide(..)) where

import Data.Map (Map, fromList, update)

data Nucleotide = A | C | G | T | X deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs = 
    if X `elem` nucleotidesConverted then
        Left xs
    else
        Right (countOnMap nucleotidesConverted mapReturn)
    where
        nucleotidesConverted = map convert xs
        mapReturn = fromList [(A,0),(C,0),(G,0),(T,0)]    

convert :: Char -> Nucleotide
convert 'A' = A
convert 'C' = C
convert 'G' = G
convert 'T' = T
convert _ = X


countOnMap :: [Nucleotide] -> (Map Nucleotide Int) -> (Map Nucleotide Int)
countOnMap [] mapa = mapa
countOnMap (x:xs) mapa = countOnMap xs (updateMap mapa x)

updateMap :: (Map Nucleotide Int) -> Nucleotide ->  (Map Nucleotide Int)
updateMap mapa nucleotide =
    let f x = Just (x + 1)
    in update f nucleotide mapa



