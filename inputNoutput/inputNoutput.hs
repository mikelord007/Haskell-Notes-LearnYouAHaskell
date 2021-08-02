import Data.Char 
import Control.Monad
-- To print Hello World to command line, run this file as: ghc --make inputNoutput.hs and type ./inputNoutput.exe

main :: IO ()
main = putStrLn "Hello World!"


--putStrLn takes a string and returns an I/O action that has a result type of () (i.e. the empty tuple, also know as unit). An I/O action is something that, when performed, will carry out an action with a side-effect

-- An I/O action will be performed when we give it a name of main and then run our program.


getname = do  
    putStrLn "Hello, what's your name?"  
    name <- getLine   -- name <- getLine performs the I/O action getLine and then bind its result value to name
    putStrLn ("Hey " ++ name ++ ", you rock!")  
-- do will perform every action below it step by step, as in an imperative language


-- Every I/O action that gets performed has a result encapsulated within it. That's why our previous example program could also have been written like this:
{-
    main = do  
        foo <- putStrLn "Hello, what's your name?"  //foo would just have a value of ()
        name <- getLine  
        putStrLn ("Hey " ++ name ++ ", you rock!")  //in a do block, the last action cannot be bound to a name like the first two were.
-}


-- To use 'let' inside IO action like in list comprehensions. call this in ghci:
uselet :: IO ()
uselet = do  
    putStrLn "What's your first name?"  
    firstName <- getLine  
    putStrLn "What's your last name?"  
    lastName <- getLine  
    let bigFirstName = map toUpper firstName  
        bigLastName = map toUpper lastName  
    putStrLn $ "hey " ++ bigFirstName ++ " " ++ bigLastName ++ ", how are you?"  


-- getting an input and reversing string:
revstring = do   
    line <- getLine  
    if null line  
        then return ()  --the return in Haskell is really nothing like the return in most other languages! it makes an I/O action out of a pure value. return "hello" is of type :: IO string. We use it in places where there must be an IO acion but isn't actually useful.
        else do  
            putStrLn $ reverseWords line  
            revstring
  
reverseWords :: String -> String  
reverseWords = unwords . map reverse . words  


returnMechanics = do
    a <- return "hell"  --This is just for demostration. Use let a ="hell" for practical purposes.
    b <- return "yeah!"  
    putStrLn $ a ++ " " ++ b  


getC = do     
    c <- getChar  
    if c /= ' '  
        then do  
            putChar c  
            getC  
        else do
            putChar '\n'
            return ()  


shoWhen = do  
    c <- getChar  
    when (c /= ' ') $ do  
        putChar c  
        shoWhen
 
  
mapColor = do   
    colors <- forM [1,2,3,4] (\a -> do  
        putStrLn $ "Which color do you associate with the number " ++ show a ++ "?"  
        getLine  
        )
    print colors
    putStrLn "The colors that you associate with 1, 2, 3 and 4 are: "  
    mapM putStrLn colors  