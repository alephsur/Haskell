module Prime (nth) where

nth :: Int -> Maybe Integer
nth n
    | n > 0 = Just $ last $ take n primeNumbers
    |otherwise = Nothing


primeNumbers :: [Integer]
primeNumbers = sieve[2..]

sieve :: [Integer] -> [Integer]
sieve (p:xs) = p : sieve[x | x <- xs, x `mod` p /= 0]