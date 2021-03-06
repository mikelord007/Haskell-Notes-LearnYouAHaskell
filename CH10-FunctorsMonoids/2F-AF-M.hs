-- APPLICATIVE FUNCTORS
-- Applicative typeclass lies in the Control.Applicative module and it defines two methods, pure and <*>

-- it is defined as:
{-
    class (Functor f) => Applicative f where  
    pure :: a -> f a  
    (<*>) :: f (a -> b) -> f a -> f b  
-}


-- Applicative instance implementation for Maybe is given as:

{-  instance Applicative Maybe where  
        pure = Just  
        Nothing <*> _ = Nothing  
        (Just f) <*> something = fmap f something  
-}

--  Use pure if you're dealing with Maybe values in an applicative context (i.e. using them with <*>), otherwise stick to Just.
--  Applicative functors and the applicative style of doing pure f <*> x <*> y <*> ... allow us to take a function that expects parameters that aren't necessarily wrapped in functors and use that function to operate on several values that are in functor contexts. The function can take as many parameters as we want, because it's always partially applied step by step between occurences of <*>.

-- we can use above instance methods as:
-- ghci> pure (+) <*> Just 3 <*> Just 5  
-- Just 8  




-- The <$> operator:
-- (<$>) :: (Functor f) => (a -> b) -> f a -> f b  
-- f <$> x = fmap f x            // the 'f' here in function body and in the function declaration represent different things!



-- [] is an instance of applicative functor defined as:
{-
    instance Applicative [] where  
    pure x = [x]  
    fs <*> xs = [f x | f <- fs, x <- xs]  //We apply every possible function from the left list to every possible value from the right list. The resulting list has every possible combination of applying a function from the left list to a value in the right one.
-}


-- IO is an instance of applicative functor defined as:
{-
    instance Applicative IO where  
    pure = return  
    a <*> b = do  
        f <- a  
        x <- b  
        return (f x) 
-}

-- It would take an I/O action that yields a function as its result and another I/O action and create a new I/O action from those two that, when performed, first performs the first one to get the function and then performs the second one to get the value and then it would yield that function applied to the value as its result.

main = do  
    a <- (++) <$> getLine <*> getLine  
    putStrLn $ "The two lines concatenated turn out to be: " ++ a  


-- ((->) r ) is an instance of applicative functor defined as:

{-
    instance Applicative ((->) r) where  
    pure x = (\_ -> x)  
    f <*> g = \x -> f x (g x)
-}

-- the above <*> function has two param: f, which is a function that takes two params and g, which is a function that takes one param. so f<*>g returns a function which takes one param ( lets say x ) and returns f x ( g x). 