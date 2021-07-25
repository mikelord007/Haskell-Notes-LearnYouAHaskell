-- data Shape = Circle Float Float Float | Rectangle Float Float Float Float deriving ( Show )

data Point = Point Float Float deriving (Show)
data Shape = Circle Point Float | Rectangle Point Point deriving (Show)

surface :: Shape -> Float  
surface ( Circle _  r ) = pi * r^2  
surface ( Rectangle (Point x1 y1) (Point x2 y2) ) = ( abs $ x2 - x1 ) * ( abs $ y1 - y2 )  

-- value constructors are fns: map (Circle 10 20) [4,5,6,6]  


nudge :: Shape -> Float -> Float -> Shape  
nudge (Circle (Point x y) r) a b = Circle (Point (x+a) (y+b)) r  
nudge (Rectangle (Point x1 y1) (Point x2 y2)) a b = Rectangle (Point (x1+a) (y1+b)) (Point (x2+a) (y2+b))  


baseCircle :: Float -> Shape  
baseCircle r = Circle (Point 0 0) r  
  
baseRect :: Float -> Float -> Shape  
baseRect width height = Rectangle (Point 0 0) (Point width height)  


-- to export types :-
{-  module Shapes   
    ( Point(..)  
    , Shape(..)  
    , surface  
    , nudge  
    , baseCircle  
    , baseRect  
    ) where  
-}

-- Shape(..), we exported all the value constructors for Shape, so that means that whoever imports our module can make shapes by using the Rectangle and Circle value constructors. It's the same as writing Shape (Rectangle, Circle).


data Person = Person { firstName :: String  
                     , lastName :: String  
                     , age :: Int  
                     , height :: Float  
                     , phoneNumber :: String  
                     , flavor :: String  
                     } deriving (Show,Eq)   


-- data Maybe a = Nothing | Just a  // Maybe is a type constructor, types can be Maybe Char, Maybe String, Maybe Int ,etc. in case of Nothing, it's type is Maybe a, it is polymorphic


-- Car datatype can be defined as:
data Car = Car { company :: String  
               , model :: String  
               , year :: Int  
               } deriving (Show)

tellCar :: Car -> String  
tellCar (Car {company = c, model = m, year = y}) = "This " ++ c ++ " " ++ m ++ " was made in " ++ show y

-- or as:
{- 
data Car a b c = Car { company :: a  
                       , model :: b  
                       , year :: c   
                       } deriving (Show)
-}

{-
tellCar :: (Show a) => Car String String a -> String  
tellCar (Car {company = c, model = m, year = y}) = "This " ++ c ++ " " ++ m ++ " was made in " ++ show y  
-}


data Vector a = Vector {
                    x :: a,
                    y :: a,
                    z :: a
                }deriving(Show)

addV :: (Num a) => Vector a -> Vector a -> Vector a
addV p q = Vector (x p + x q) (y p + y q)  (z p + z q)
-- can also be written as Vector x1 y1 z1 `addV` Vector x2 y2 z2 = Vector (x1+x2) (y1+y2) (z1+z2)  


-- scalar and vector multiplication of 2 vectors:
vectMult :: (Num t) => Vector t -> t -> Vector t  
(Vector i j k) `vectMult` m = Vector (i*m) (j*m) (k*m)  
  
scalarMult :: (Num t) => Vector t -> Vector t -> t  
(Vector i j k) `scalarMult` (Vector l m n) = i*l + j*m + k*n  


-- deriving from multiple typeclasses:
data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday   
           deriving (Eq, Ord, Show, Read, Bounded, Enum)