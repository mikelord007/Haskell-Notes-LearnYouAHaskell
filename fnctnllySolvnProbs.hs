-- function to conver infix to postfix expression, reverese polish notatioin:



solveRPN :: ( Num a ,Read a) => String -> a
solveRPN  = head . foldl foldingfunction [] . words 
    where foldingfunction (x:y:xs) "*" = (x*y):xs
          foldingfunction (x:y:xs) "-" = (y-x):xs
          foldingfunction (x:y:xs) "+" = (x+y):xs
          foldingfunction xs numberString = read numberString:xs