module Pangram (isPangram) where

isPangram :: String -> Bool
isPangram text = (Prelude.length $ unique $ filterLetter $ getLowerString $ sortList text) == 26


sortList :: [Char] -> [Char]
sortList [] = []
sortList (x:xs) = 
    let small = sortList [a | a <- xs, a <= x]
        big = sortList [a | a <- xs, a > x]
    in small ++ [x] ++ big


filterLetter :: [Char] -> [Char]
filterLetter xs = 
    Prelude.filter (\letter -> letter `elem` ['a'..'z']) xs


unique :: [Char] -> [Char]
unique [] = []
unique (x:xs) = x:unique (Prelude.filter ((/=) x) xs)


getLowerString::[Char] -> [Char]
getLowerString text = 
    map toLower text

toLower :: Char -> Char
toLower c =
    case c of        
        'A' -> 'a'
        'B' -> 'b'
        'C' -> 'c'
        'D' -> 'd'
        'E' -> 'e'
        'F' -> 'f'
        'G' -> 'g'
        'H' -> 'h'
        'I' -> 'i'
        'J' -> 'j'
        'K' -> 'k'
        'L' -> 'l'
        'M' -> 'm'
        'N' -> 'n'
        'O' -> 'o'
        'P' -> 'p'
        'Q' -> 'q'
        'R' -> 'r'
        'S' -> 's'
        'T' -> 't'
        'U' -> 'u'
        'V' -> 'v'
        'W' -> 'w'
        'X' -> 'x'
        'Y' -> 'y'
        'Z' -> 'z'
        _ -> c


