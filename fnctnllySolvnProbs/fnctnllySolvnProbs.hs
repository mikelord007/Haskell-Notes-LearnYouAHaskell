-- function to evaluate postfix expression ( reverese polish notatioin ):



solveRPN :: ( Num a ,Read a) => String -> a
solveRPN  = head . foldl foldingfunction [] . words 
    where foldingfunction (x:y:xs) "*" = (x*y):xs
          foldingfunction (x:y:xs) "-" = (y-x):xs
          foldingfunction (x:y:xs) "+" = (x+y):xs
          foldingfunction xs numberString = read numberString:xs

-- this takes a string of postfix expression, like "3 3 34 + -" and prints the result


-- Function to calculate the shortest path between two cities ( heathrow and london) consisting of two main roads linking them and a bunch of cross roads. Each section has it's own cost and the objective is two find the path with the shortest cost between them.


data Section = Section { getA:: Int,getB:: Int, getC:: Int}
type RoadSystem = [Section]

