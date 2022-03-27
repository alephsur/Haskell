module Triangle (rows) where

rows :: Int -> [[Integer]]
rows x = generateRows x


generateRows :: Int -> [[Integer]]
generateRows n
    | n == 0 = []
    | n == 1 = [[1]]
    | n == 2 = [[1],[1,1]]
    | otherwise = generateTriangle [1,1] 3 n (generateRows 2)


generateTriangle :: [Integer] -> Int -> Int -> [[Integer]] -> [[Integer]]
generateTriangle previousRow rowNumber limit triangle
    | rowNumber > limit = triangle
    | otherwise = generateTriangle nextRow (rowNumber+1) limit (triangle ++ [nextRow])
    where
        nextRow = generateNextRow previousRow rowNumber 0 []


generateNextRow :: [Integer] -> Int -> Int -> [Integer] -> [Integer]
generateNextRow previousRow rowNumber position nextRow
    | position == 0 = generateNextRow previousRow rowNumber (position +1) (nextRow ++ [1])
    | position == (rowNumber -1) = generateNextRow previousRow rowNumber (position +1) (nextRow ++ [1])
    | position == rowNumber = nextRow
    | otherwise = generateNextRow previousRow rowNumber (position +1) (nextRow ++ [nextNumber])
    where 
        nextNumber = (previousRow !! position) + (previousRow !! (position -1))


