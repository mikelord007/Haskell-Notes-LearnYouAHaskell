import Data.Char  
import Data.List  


-- Functors are things that can be mapped over, like lists, Maybes, trees, and such. In Haskell, they're described by the typeclass Functor, which has only one typeclass method, namely fmap, which has a type of fmap :: (a -> b) -> f a -> f b.


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