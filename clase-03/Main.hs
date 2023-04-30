sumaNaTodos :: Int -> [Int] -> [Int]
sumaNaTodos _ [] = []
sumaNaTodos n (x:xs) = x + n: sumaNaTodos n xs

suma1aTodos :: [Int] -> [Int]
suma1aTodos [] = []
suma1aTodos (x:xs) = x + 1 :suma1aTodos xs

suma5aTodos :: [Int] -> [Int]
suma5aTodos [] = []
suma5aTodos (x:xs) = x + 5 :suma5aTodos xs

duplicaATodos :: [Int] -> [Int]
duplicaATodos [] = []
duplicaATodos (x:xs) = x * 2 :duplicaATodos xs

restaATodos :: [Int] -> [Int]
restaATodos [] = []
restaATodos (x:xs) = x - (div x 3) :restaATodos xs

---------------------------------

haceAlgoConTodos :: (Int -> Int) -> [Int] -> [Int]
haceAlgoConTodos funcion [] = []
haceAlgoConTodos funcion (x:xs) = funcion x :haceAlgoConTodos funcion xs

suma1 x = x + 1

duplica x = x * 2

resta x = x - (div x 3)

funcionLoca :: Int -> Int
funcionLoca x = 2 + 3 * x + 2 * x * x

empiezaConD :: String -> Bool
empiezaConD nombre = head nombre == 'D'