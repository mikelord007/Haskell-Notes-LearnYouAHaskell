maximum' :: (Ord a) => [a] -> a
maximum' [] = error "cant find max of empty dumbass"
maximum' [x] = x
maximum' (x:xs)
    | x > maxTail = x
    | otherwise = maxTail
    where maxTail = maximum' xs

-- quick sort
quickSort :: (Ord a) => [a] -> [a]
quickSort [] = []
quickSort (x:xs) = smallSort ++ [x] ++ bigSort
        where smallSort = quickSort [a| a<-xs, a<=x]
              bigSort = quickSort [a| a<-xs, a>x]