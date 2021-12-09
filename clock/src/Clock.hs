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
    hourModulated = (if hour < 0 then 24 + (hour `mod` 24) else hour `mod` 24)
    hourMinutesNegativeRollOver = (if min < 0 || min >= 60 then min `div` 60 else 0)
    minutesCalculate = min `mod` 60
    hourCalculated = (hourModulated + hourMinutesNegativeRollOver) `mod` 24
    

toString :: Clock -> String
toString clock = (showIntPad (hour clock)) ++ ":" ++ (showIntPad (minutes clock))

addDelta :: Int -> Int -> Clock -> Clock
addDelta hour min clock = fromHourMin addedHours addedMinutes
  where 
    addedHours = ((Clock.hour clock) + hour)
    addedMinutes = ((Clock.minutes clock) + min)


showIntPad :: Int -> String
showIntPad n 
          | length (show n) == 1 = "0" ++ (show n)
          | otherwise = show n