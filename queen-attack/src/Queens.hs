module Queens (boardString, canAttack) where

import Data.Maybe

whiteBoard = ["________"
            ,"________"
            ,"________"
            ,"________"
            ,"________"
            ,"________"
            ,"________"
            ,"________"]


boardString :: Maybe (Int, Int) -> Maybe (Int, Int) -> String
boardString white black = unlines $ reformatBoard blackQueenAdded [] 0
    where 
        whiteQueenAdded = addQueen 'W' wQueenCord whiteBoard [] 0
        blackQueenAdded = addQueen 'B' bQueenCord whiteQueenAdded [] 0
        wQueenCord = getQueenPos white
        bQueenCord = getQueenPos black


canAttack :: (Int, Int) -> (Int, Int) -> Bool
canAttack queenA queenB
    | fst queenA == fst queenB = True
    | snd queenA == snd queenB = True
    | sumCoorQA == sumCoorQB = True
    | difCoorQA == difCoorQB = True
    | otherwise = False
    where
        sumCoorQA = (fst queenA) + (snd queenA) 
        sumCoorQB = (fst queenB) + (snd queenB) 
        difCoorQA = (fst queenA) - (snd queenA) 
        difCoorQB = (fst queenB) - (snd queenB) 

getQueenPos :: Maybe (Int,Int) -> (Int, Int)
getQueenPos (Just a) = a
getQueenPos Nothing = (-1,-1)
    

addQueen :: Char -> (Int, Int) -> [String] -> [String] -> Int -> [String]
addQueen _ _ _ newBoard 8 = newBoard
addQueen queenType queenCord (x:xs)  newBoard counter
    | ((fst queenCord)) == counter = addQueen queenType queenCord xs (newBoard ++ [row]) (counter + 1)
    | otherwise = addQueen queenType queenCord xs (newBoard ++ [x]) (counter + 1)
    where 
        row = getRow queenType (snd queenCord) x 0 ""


getRow :: Char -> Int -> String -> Int -> String -> String
getRow _ _ _ 8 newRow = newRow
getRow queen position (x:xs) counter newRow
    | (position) == counter = getRow queen position xs (counter +1) (newRow ++ [queen])
    | otherwise = getRow queen position xs (counter +1) (newRow ++ [x])


reformatBoard :: [String] -> [String] -> Int -> [String]
reformatBoard _ newBoard 8 = newBoard
reformatBoard (x:xs) newBoard counter = 
    reformatBoard xs (newBoard ++ [formatedRow]) (counter +1)
    where 
        formatedRow = (reformatRow x "")

reformatRow :: String -> String -> String
reformatRow [] formatedRow = formatedRow
reformatRow [x] formatedRow = reformatRow [] (formatedRow ++ [x])
reformatRow (x:xs) formatedRow = reformatRow xs (formatedRow ++ [x] ++ " ")
    





    