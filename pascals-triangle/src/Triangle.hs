module Triangle (rows) where

rows :: Int -> [[Integer]]
rows x = generateRows x


generateRows :: Int -> [[Integer]]
generateRows n
    | n == 0 = []
    | n == 1 = [[1]]
    | n == 2 = [[1],[1,1]]
    | otherwise = (generateRows 1) ++ partialTriangle
    where 
        partialTriangle = take (n-1) $ iterate (generateTriangle' 3) [1,1]


generateTriangle' :: Int -> [Integer] -> [Integer]
generateTriangle' rowNumber previousRow = 
    generateNextRow' previousRow 0 []


generateNextRow' :: [Integer] -> Int -> [Integer] -> [Integer]
generateNextRow' previousRow position nextRow
    | position == 0 = generateNextRow' previousRow (position +1) (nextRow ++ [1])
    | position == (rowNumber -1) = generateNextRow' previousRow (position +1) (nextRow ++ [1])
    | position == rowNumber = nextRow
    | otherwise = generateNextRow' previousRow (position +1) (nextRow ++ [nextNumber])
    where 
        nextNumber = (previousRow !! position) + (previousRow !! (position -1))
        rowNumber = (length previousRow) + 1 