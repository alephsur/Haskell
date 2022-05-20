module Clock (addDelta, fromHourMin, toString) where

data Clock = Clock
  {
    minutesFromMidnight :: Int
  }
  deriving (Eq, Show)


fromHourMin :: Int -> Int -> Clock
fromHourMin hour min = 
  Clock totalMinutes
  where
    totalMinutes = ((hour * 60) + min) `mod` (24*60)

    

toString :: Clock -> String
toString clock = (showIntPad thours) ++ ":" ++ (showIntPad tmin)
  where
    thours = (minutesFromMidnight clock) `div` 60
    tmin = (minutesFromMidnight clock) `mod` 60

addDelta :: Int -> Int -> Clock -> Clock
addDelta h m clock = fromHourMin thours tmin
  where 
    totalMinutes = (minutesFromMidnight clock) + h * 60 + m
    thours = (totalMinutes `div` 60) `mod` 24
    tmin = totalMinutes `mod` 60


showIntPad :: Int -> String
showIntPad n 
          | length (show n) == 1 = "0" ++ (show n)
          | otherwise = show n