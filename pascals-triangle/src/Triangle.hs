module Triangle (rows) where

rows :: Int -> [[Integer]]
rows x = take x $ iterate generateNextRow [1]


generateNextRow :: [Integer] -> [Integer]
generateNextRow row = zipWith (+) zipRow1 zipRow2
    where
        zipRow1 = [0] ++ row
        zipRow2 = row ++ [0]