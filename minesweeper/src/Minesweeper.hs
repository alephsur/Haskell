{-# LANGUAGE TupleSections #-} 
{-# LANGUAGE DataKinds #-}


module Minesweeper (annotate) where

import Data.List (reverse)
import Data.Char (intToDigit)
import Data.List.Split (chunksOf)



annotate :: [String] -> [String]
annotate [] = []
annotate [[]] = [[]]
annotate board = splitedResultBoard $ countedBombsToBoard
    where 
        getCountedBombs = map (countBombs board) $ getCoords board
        countedBombsToBoard = transformBoard (concat board) getCountedBombs []
        splitedResultBoard = chunksOf $ length (head board)


transformBoard :: String -> [Int] -> String -> String
transformBoard [] _ acc = acc
transformBoard (x:xs) (y:ys) acc
    | x == '*' = transformBoard (xs) (ys) (acc ++ [x])
    | y == 0 = transformBoard (xs) (ys) (acc ++ [' '])
    | otherwise = transformBoard (xs) (ys) (acc ++ [(intToDigit y)])


getCoords :: [String] -> [(Int,Int)]
getCoords xs = [(x,y)| x <- [0..rowsLength-1], y <- [0.. columnsLength-1]]
    where 
        rowsLength = length xs
        columnsLength = length $ head xs


getNeighbours :: Int -> Int -> (Int, Int) -> [(Int, Int)]
getNeighbours l w (x,y) = filter isValidCoor neighbours
    where
        isValidCoor (i, j) = i >= 0 && j >= 0 && i < l && j < w
        neighbours = [(i,j)| i <- [x-1..x+1], j<-[y-1..y+1] ]


countBombs :: [String] -> (Int,Int) -> Int
countBombs board index= countBombsNeighbours board 0 neighbours
    where
        l = length board
        w = length $ head board
        neighbours = getNeighbours l w index


countBombsNeighbours :: [String] ->  Int -> [(Int, Int)] -> Int
countBombsNeighbours _ acc [] = acc
countBombsNeighbours board acc (x:xs) 
    | isBomb = countBombsNeighbours board (acc+1) xs
    | otherwise = countBombsNeighbours board acc xs 
    where
        isBomb = (board !! i) !! j == '*'
        i = fst x
        j = snd x

