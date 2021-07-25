import Data.List
import System.IO

-- times4 x = x *4

-- multBy4 :: [Int] -> [Int]
-- multBy4 [] = []
-- multBy4 (x:xs) = times4 x : multBy4 xs

lucky7 :: (Integral a ) => a -> String
lucky7 7 = "lucky 7 yay"
lucky7 _ = "nope, sucks to be you"

xlst = [(1,3), (4,3), (2,4), (5,3), (5,6), (3,1)]

head' :: [a] -> a  
head' (x:_) = x
head' [] = error "Can't call head on an empty list, dummy!"

capital :: String -> String  
capital "" = "Empty string, whoops!"  
capital full@(s:sx) = "The first letter of " ++ full ++ " is" ++ [s]

bmiTell :: ( RealFloat a ) => a -> a -> String
bmiTell weight height
    | weight/height <= 18.23 = "you're underweight"
    | weight/height <= 33.3 = "you're okay"
    | otherwise = "you're a fatty"


yourCGPA :: ( RealFloat a) => a -> a -> String
yourCGPA gradePts credits
    | cgpa < min = "its very low man"
    | cgpa < enough = "it would suffice"
    | cgpa < excellent = "it's good man!"
    | otherwise = "fuck, you're doing great!"
    where cgpa = gradePts/credits
          min = 3.3
          enough = 6.3
          excellent = 8.8


calcBMI's :: ( RealFloat a ) => [(a,a)] -> [a]
calcBMI's xs = [ bmi w h | (w,h)<-xs]
        where bmi w h = w/h^2


cylinder :: (RealFloat a) => a -> a -> a
cylinder r h = let sideArea = 2 * pi * r * h; topArea = pi * r^2 in sideArea + 2* topArea

calcBmisforFAT :: (RealFloat a) => [(a, a)] -> [a]  
calcBmisforFAT xs = [ bmi | (a,b) <- xs, let bmi = a/b^2, bmi >= 24.0]