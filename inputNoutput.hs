import Data.Char 
-- To print Hello World to command line, run this file as: ghc --make inputNoutput.hs and type ./inputNoutput.exe

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
        then return ()  
        else do  
            putStrLn $ reverseWords line  
            revstring
  
reverseWords :: String -> String  
reverseWords = unwords . map reverse . words  