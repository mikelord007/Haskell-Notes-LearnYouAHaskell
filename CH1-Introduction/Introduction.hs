import Data.List
import System.IO


doubleXY x y = doubleMe x + doubleMe y
doubleMe x = x + x  
doubleSmallNumber x = if x> 100
                        then x
                        else x*2

conanO'Brien = "it's a me, Mario!"
twenty = 20

factoriasl :: Integer -> Integer
factoriasl x = product [1..x]

lucky:: (Integral a)=> a -> String
lucky 7 = "lucky seven!"
lucky x = "not lucky lol"

factorial :: ( Integral a ) => a->a
factorial 0 = 1
factorial x = x * factorial(x-1)

head' :: [a]-> a
head' [] = error "Can't call head on an empty list, idiot"
head' (x:_) = x

length' :: (Num a) => [x]->a
length' [] = 0
length' (_:xs) = 1 + length' xs

removeNonUppercase :: [Char] -> [Char] 
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]

addMe :: Int -> Int -> Int
addMe x y = x + y