module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n = calculate n 0
  where calculate 0 0 = Nothing
        calculate 1 acc = Just acc
        calculate n acc 
            | even n =  calculate (div n 2) (acc+1)
            | odd n = calculate (3*n+1) (acc+1)
            | otherwise = Nothing

