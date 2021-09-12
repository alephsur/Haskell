module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune
    deriving(Eq)
            

ageOn :: Planet -> Float -> Float
ageOn planet seconds = 
    (seconds / 31557600) / (planetAge planet)
    


planetAge:: Planet -> Float
planetAge Mercury = 0.2408467
planetAge Venus = 0.61519726
planetAge Earth = 1
planetAge Mars = 1.8808158
planetAge Jupiter = 11.862615
planetAge Saturn = 29.447498
planetAge Uranus = 84.016846
planetAge Neptune = 164.79132