module Robot
    ( Bearing(East,North,South,West)
    , bearing
    , coordinates
    , mkRobot
    , move
    ) where

data Bearing = North
             | East
             | South
             | West
             deriving (Eq, Show)

data Robot = Robot { direction :: Bearing
                    ,coord :: (Integer ,Integer)
                    } deriving (Eq, Show)
   

bearing :: Robot -> Bearing
bearing robot = direction robot

coordinates :: Robot -> (Integer, Integer)
coordinates robot = coord robot

mkRobot :: Bearing -> (Integer, Integer) -> Robot
mkRobot direction coordinates = Robot direction coordinates

move :: Robot -> String -> Robot
move robot [] = robot
move robot (x:xs)
    | x == 'A' = move  (mkRobot (bearing robot) getNewCoord) xs
    | otherwise = move (mkRobot getNewBearing (coord robot)) xs
    where
        newRobot = mkRobot getNewBearing getNewCoord
        getNewCoord = generateNewCoordinate (direction robot) (coord robot) 
        getNewBearing = generateNewBearing (direction robot) x

generateNewBearing :: Bearing -> Char -> Bearing
generateNewBearing bearing 'R' = turnRight bearing
generateNewBearing bearing 'L' = turnLeft bearing
generateNewBearing bearing 'A' = bearing


turnRight :: Bearing -> Bearing
turnRight bearing 
    | bearing == North = East
    | bearing == East = South
    | bearing == South = West
    | otherwise = North


turnLeft :: Bearing -> Bearing
turnLeft bearing 
    | bearing == North = West
    | bearing == East = North
    | bearing == South = East
    | otherwise = South

generateNewCoordinate :: Bearing -> (Integer, Integer) -> (Integer, Integer)
generateNewCoordinate bearing (x,y)
        | bearing == North = (x, y + 1)
        | bearing == South = (x , y -1)
        | bearing == East = (x +1, y)
        | otherwise = (x-1, y)
