module LuciansLusciousLasagna (elapsedTimeInMinutes, expectedMinutesInOven, preparationTimeInMinutes) where

expectedMinutesInOven = 40

preparationTimeInMinutes :: Int -> Int
preparationTimeInMinutes n = n*2

elapsedTimeInMinutes :: Int -> Int -> Int
elapsedTimeInMinutes l t =
    t + (preparationTimeInMinutes l)