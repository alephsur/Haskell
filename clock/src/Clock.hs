module Clock (addDelta, fromHourMin, toString) where

data Clock = Clock
  {
    hour :: Int,
    minutes :: Int  
  }
  deriving Eq

fromHourMin :: Int -> Int -> Clock
fromHourMin hour min = 
  Clock hourCalculated minutesCalculate
  where
    hourMinutesNegativeRollOver = min `div` 60
    minutesCalculate = min `mod` 60
    hourCalculated = (hour + hourMinutesNegativeRollOver) `mod` 24
    

toString :: Clock -> String
toString clock = (showIntPad (hour clock)) ++ ":" ++ (showIntPad (minutes clock))

addDelta :: Int -> Int -> Clock -> Clock
addDelta h m clock = fromHourMin addedHours addedMinutes
  where 
    addedHours = ((hour clock) + h)
    addedMinutes = ((minutes clock) + m)


showIntPad :: Int -> String
showIntPad n 
          | length (show n) == 1 = "0" ++ (show n)
          | otherwise = show n