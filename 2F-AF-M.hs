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