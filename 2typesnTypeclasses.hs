import  Data.Map as Map
-- type synonyms:
-- type String = [Char]  


phoneBook :: [(String,String)]  
phoneBook =      
    [("betty","555-2938")     
    ,("bonnie","452-2928")     
    ,("patsy","493-2928")     
    ,("lucille","205-2928")     
    ,("wendy","939-8282")     
    ,("penny","853-2492")     
    ]


-- phone book is of type [(String,String)], we can give this type a synonym as:
type PhoneBookType = [(String,String)]  

-- you can even define above as:
{-
    type PhoneNumber = String  
    type Name = String  
    type PhoneBook = [(Name,PhoneNumber)]  
-}
-- this is done to give more clarity to what each data types are meant to be there for


-- type constructors, used to create other concrete types:
type AssocList k v = [(k,v)]  --this will represent any type of map, [(String,String)] or [(Int, Float)] ...


-- type constructors can also be made partial, like functions:
type IntMap = Map.Map Int       --here Map takes two parameters but only one is given


data Either a b = Left a | Right b deriving (Eq, Ord, Read, Show)  --another data type with 2 parameteres
-- we usually use the result type of Either a b, where a is some sort of type that can tell us something about the possible failure and b is the type of a successful computation. Hence, errors use the Left value constructor while results use Right.


data LockerState = Taken | Free deriving (Show, Eq)  
type Code = String  
type LockerMap = Map.Map Int (LockerState, Code)  


lockerLookup :: Int -> LockerMap -> Main.Either String Code  
lockerLookup lockerNumber map =   
    case Map.lookup lockerNumber map of   
        Nothing -> Main.Left $ "Locker number " ++ show lockerNumber ++ " doesn't exist!"  
        Just (state, code) -> if state /= Taken   
                                then Main.Right code  
                                else Main.Left $ "Locker " ++ show lockerNumber ++ " is already taken!" 


lockers :: LockerMap  
lockers = Map.fromList   
    [(100,(Taken,"ZD39I"))  
    ,(101,(Free,"JAH3I"))  
    ,(103,(Free,"IQSA9"))  
    ,(105,(Free,"QOTSA"))  
    ,(109,(Taken,"893JJ"))  
    ,(110,(Taken,"99292"))  
    ]  




-- RECURSIVE DATA STRUCTURES:

data List a = Empty | Cons a (List a) deriving (Show, Read, Eq, Ord)  -- Cons value constructor takes in a field of the same data type.

-- data List a = Empty | Cons { listHead :: a, listTail :: List a} deriving (Show, Read, Eq, Ord)  // same as above, but with record syntax.




-- We could define the above Cons constructor as infix by doing:
infixr 5 :-:
data List2 a = Empty2 | a :-: (List2 a) deriving (Show, Read, Eq, Ord)  
-- where the number 5 is called 'fixity' ( its precedence )

-- A function that adds two list of type List2 ( like ++ ):-
infixr 5  .++  
(.++) :: List2 a -> List2 a -> List2 a   
Empty2 .++ ys = ys  
(x :-: xs) .++ ys = x :-: (xs .++ ys)  