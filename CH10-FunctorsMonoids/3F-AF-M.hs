-- The newtype keyword ius used when we want to just take one type and wrap it in something to present it as another type. In the actual libraries, ZipList a is defined like this:

{-
    newtype ZipList a = ZipList { getZipList :: [a] }  
-}

-- which is basically a list, so that we could make another instance of it as applicative functor but with differnt behaviour as lists.

-- newtype is faster. If you use the data keyword to wrap a type, there's some overhead to all that wrapping and unwrapping when your program is running. But if you use newtype, Haskell knows that you're just using it to wrap an existing type into a new type



-- making tuples a member of associative functor:

newtype Pair b a = Pair { getPair :: (a,b) }  

instance Functor (Pair c) where  
    fmap f (Pair (x,y)) = Pair (f x, y)  --this will apply the function to first member of Pair, which is just a tuple.