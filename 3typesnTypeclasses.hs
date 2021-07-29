--  TYPECLASS DEFINITIONS AND CUSTOM DERIVING FROM THEM:

-- The Eq typeclass is defined as:
{-
    class Eq a where  
    (==) :: a -> a -> Bool  
    (/=) :: a -> a -> Bool  
    x == y = not (x /= y)  
    x /= y = not (x == y)  
-}
-- do :info Eq in GHCI to see more details 


-- To make a custom data type an instance of a Typeclass:
data TrafficLight  = Red | Yellow | Green

instance Eq TrafficLight where
    Red == Red = True
    Green == Green = True
    Yellow == Yellow  = True
    _ == _ = False
-- While making a type instance of a typeclass, it should fulfil the minimal complete definition
instance Show TrafficLight where
    show Red = "Red Light"
    show Green = "Green Light"
    show Yellow = "Yellow Light"


-- To make typeclasses subclass of another class:
-- class (Eq a) => Num a where      //here the Type a should be a part of Eq a to be a part of Num


-- only concrete types can be made instances of classes:
-- instance (Eq m) => Eq (Maybe m) where  
--     Just x == Just y = x == y  
--     Nothing == Nothing = True  
--     _ == _ = False  


-- A Yes-no Typeclass

class YesNo a where
    yesno :: a -> Bool

instance YesNo Int where
    yesno 0 = False
    yesno _ = True

instance YesNo  [a] where
    yesno [] = False
    yesno _ = True

instance YesNo Bool where
    yesno  = id

instance YesNo (Maybe a) where
    yesno (Just _) = True
    yesno Nothing = False

instance YesNo Char where
    yesno 'a' = False
    yesno _ = True