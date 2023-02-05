module TwelveDays (recite) where

import qualified Data.Text as T
import           Data.Text (Text)

recite :: Int -> Int -> [Text]
recite start stop = getLiric start stop []

getLiric :: Int -> Int -> [Text] -> [Text]
getLiric start stop liric
    | start <= stop = getLiric nextNumber stop (liric ++ [completeWords])
    | otherwise = liric
    where 
        firstWords = T.pack "On the "
        lastWords = T.pack " day of Christmas my true love gave to me: "
        giftWords = getGiftSentence start
        ordinal = getOrdinal start
        nextNumber = start + 1
        completeWords = T.append firstWords $ T.append ordinal $ T.append lastWords giftWords



getGiftSentence :: Int -> Text
getGiftSentence number 
    | number == 1 = T.pack "a Partridge in a Pear Tree."
    | number == 2 = T.pack "two Turtle Doves, and a Partridge in a Pear Tree."
    | number == 3 = T.pack "three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    | number == 4 = T.pack "four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    | number == 5 = T.pack "five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    | number == 6 = T.pack "six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    | number == 7 = T.pack "seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    | number == 8 = T.pack "eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    | number == 9 = T.pack "nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    | number == 10 = T.pack "ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    | number == 11 = T.pack "eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    | otherwise = T.pack "twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."


getOrdinal :: Int -> Text
getOrdinal number
    | number == 1 = T.pack "first"
    | number == 2 = T.pack "second"
    | number == 3 = T.pack "third"
    | number == 4 = T.pack "fourth"
    | number == 5 = T.pack "fifth"
    | number == 6 = T.pack "sixth"
    | number == 7 = T.pack "seventh"
    | number == 8 = T.pack "eighth"
    | number == 9 = T.pack "ninth"
    | number == 10 = T.pack "tenth"
    | number == 11 = T.pack "eleventh"
    | otherwise = T.pack "twelfth"
