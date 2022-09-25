module WordProblem (answer) where

import Data.Char (isPunctuation)


answer :: String -> Maybe Integer
answer problem 
  | (not . isValidOperation) listOfWords = Nothing
  | otherwise = Just $ processOperation numbers operators 0
  where
    listOfWords = words $ init problem
    numbers = processListNumbers listOfWords []
    operators = processListOperator listOfWords []

isValidOperation :: [String] -> Bool
isValidOperation [] = True
isValidOperation [x]
   | isNumber' x = True
   | otherwise = False
isValidOperation (x:y:xs)
  | isNumber' x && isNumber' y = False
  | isValidOperator x && isValidOperator y = False
  | isNumber' x && (not . isValidOperator) y = False
  | isValidOperator x && (not . isNumber') y && y /= "by" = False
  | otherwise = isValidOperation (y:xs)

processOperation :: [Integer] -> [String] -> Integer -> Integer
processOperation [] _ acc = acc
processOperation (x:y:xs) (o:os) acc = 
  processOperation xs os w
  where 
    w = applyOperator o x y
processOperation (x:xs) (o:os) acc =
  processOperation xs os w
  where 
    w = applyOperator o acc x
processOperation [x] [] acc = x


processListNumbers :: [String] -> [Integer] -> [Integer]
processListNumbers [] acc = acc
processListNumbers (x:xs) acc
  | isNumber' x = processListNumbers xs (acc ++ [(read x :: Integer)]) 
  | otherwise = processListNumbers xs acc


processListOperator :: [String] -> [String] -> [String]
processListOperator [x] acc = acc
processListOperator (x:y:xs) acc
  | x == "plus" = processListOperator (y:xs) (acc ++ [x])
  | x == "minus" = processListOperator (y:xs) (acc ++ [x])
  | x == "multiplied" = processListOperator xs (acc ++ [x])
  | x == "divided" = processListOperator xs (acc ++ [x])
  | otherwise = processListOperator (y:xs) acc


applyOperator :: String -> Integer -> Integer -> Integer
applyOperator operator a b
  | operator == "plus" = a + b
  | operator == "minus" = a - b
  | operator == "multiplied" = a * b 
  | operator == "divided" = a `div` b
  | otherwise = 0


isNumber' :: String -> Bool
isNumber' str =
    case (reads str) :: [(Double, String)] of
      [(_, "")] -> True
      _         -> False


isValidOperator :: String -> Bool
isValidOperator c
  | c == "plus" = True
  | c == "minus" = True
  | c == "multiplied" = True
  | c == "divided" = True
  | otherwise = False


cleanPunctuation :: String -> String
cleanPunctuation = filter (not . isPunctuation)
