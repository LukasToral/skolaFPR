main = do putStr "Hello world!"

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

leapYear :: Int -> Bool
leapYear x
    | mod x 4 == 0 && mod x 100 /= 0 = True
    | mod x 400 == 0 = True
    | otherwise = False

max2 :: Int -> Int -> Int
max2 a b
    | a > b = a
    | otherwise = b

max3 :: Int -> Int -> Int -> Int
max3 a b c
    | a > b && a > c = a
    | b > a && b > c = b
    | otherwise = c

variations :: Int -> Int -> Int
variations k n = (factorial n) `div` (factorial (n-k))

combinations :: Int -> Int -> Int
combinations k n = variations k n `div` factorial k

-- Moje verze (Zbytečně dlouhá)
numberOfSolutions :: Int -> Int -> Int -> Int
numberOfSolutions a b c 
    | ((b^2) - (4 * a * c)) > 0 = 2
    | ((b^2) - (4 * a * c)) == 0 = 1
    | otherwise = 0

-- Lepší verze
numberOfSolutionsBetter :: Int -> Int -> Int -> Int
numberOfSolutionsBetter a b c = let d = ((b^2) - (4 * a * c))
                                in if d < 0 then 0 else if d == 0 then 1 else 2



