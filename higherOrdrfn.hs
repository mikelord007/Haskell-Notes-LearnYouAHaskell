compareWithHundred :: (Num a, Ord a) => a -> Ordering  
compareWithHundred = compare 100


divideByTen :: (Floating a) => a -> a  
divideByTen = (/10)


applyTwice :: (a -> a) -> a -> a  
applyTwice f x = f (f x)


flip' :: (a -> b -> c) -> (b -> a -> c)  
flip' f = g  
    where g x y = f y x

--  ------------------------
-- filter
-- map
-- takewhile

quicksort :: (Ord a) => [a] -> [a]    
quicksort [] = []    
quicksort (x:xs) =     
    let smallerSorted = quicksort (filter (<=x) xs)  
        biggerSorted = quicksort (filter (>x) xs)   
    in  smallerSorted ++ [x] ++ biggerSorted


largUndr100000 = head (filter p [100000,99999..])
    where p x = mod x 3829 == 0


listOfFuns = map (*) [0..]


sumOfOddsquares = sum (takeWhile (<10000) (filter odd (map (^2) [1..])))

-- ---------------------------


numLong = filter (\x ->  x > 15) (map (+3) [1..100])


addTuples = map (\(a,b)-> a+b) [(33,2),(98,47)]


sum' :: (Num a ) => [a] -> a
sum' xs = foldl (\acc x -> acc+x ) 0 xs


sqrtSums :: Int  
sqrtSums = length (takeWhile (<1000) (scanl1 (+) (map sqrt [1..]))) + 1


($) :: (a -> b) -> a -> b  
f $ x = f x


(.) :: (b -> c) -> (a -> b) -> a -> c  
f . g = \x -> f (g x)


negativeOfAll = map (negate . abs) [5,-3,-6,7,-3,2,-19,24]

weirdfn = replicate 100 . product . map (*3) . zipWith max [1,2,3,4,5] $ [4,5,6,7,8]

fn = ceiling . negate . tan . cos . max 50  