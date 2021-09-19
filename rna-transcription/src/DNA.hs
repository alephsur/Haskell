module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA xs = mapM convertChar xs



convertChar :: Char -> Either Char Char
convertChar 'G' = Right 'C'
convertChar 'C' = Right 'G'
convertChar 'T' = Right 'A'
convertChar 'A' = Right 'U'
convertChar x = Left x