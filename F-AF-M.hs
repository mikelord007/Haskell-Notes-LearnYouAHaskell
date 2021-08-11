import Data.Char  
import Data.List  


-- Functors are things that can be mapped over, like lists, Maybes, trees, and such. In Haskell, they're described by the typeclass Functor, which has only one typeclass method, namely fmap, which has a type of fmap :: (a -> b) -> f a -> f b.


-- THE FUNCTOR TYPECLASS:

-- it's defined in std library as:
{-
class Functor f where  
    fmap :: (a -> b) -> f a -> f b  

instance Functor [] where  
    fmap = map 

instance Functor Maybe where  
    fmap f (Just x) = Just (f x)  
    fmap f Nothing = Nothing  

instance Functor Tree where  
    fmap f EmptyTree = EmptyTree  
    fmap f (Node x leftsub rightsub) = Node (f x) (fmap f leftsub) (fmap f rightsub)  

instance Functor (Either a) where  
    fmap f (Right x) = Right (f x)  
    fmap f (Left x) = Left x  
-}


-- IO is an instance of Functor typeclass as:
{-
    instance Functor IO where  
    fmap f action = do  
        result <- action  
        return (f result)  
-}



-- function to reverse a IO string:
main = do line <- fmap reverse getLine  
          putStrLn $ "You said " ++ line ++ " backwards!"  
          putStrLn $ "Yes, you really said " ++ line ++ " backwards!" 


main2 = do 
        line <- fmap (intersperse '-' . reverse . map toUpper) getLine  
        putStrLn line  


-- another common functor is: (->) r. //could also be written as r->
-- it's instance is:
{-
    instance Functor ((->) r) where  
    fmap f g = (\x -> f (g x))  
-}


-- FUNCTOR LAWS
-- There are two laws that all instances of Functor should abide by. They aren't enforced by Haskell automatically, so you have to test them out yourself.


-- The first functor law states that if we map the id function over a functor, the functor that we get back should be the same as the original functor. can be written as ---- fmap id = id


-- The second law says that composing two functions and then mapping the resulting function over a functor should be the same as first mapping one function over the functor and then mapping the other one. Formally written, that means that ---- fmap (f . g) = fmap f . fmap g.