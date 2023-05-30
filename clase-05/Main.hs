factorial :: Int -> Int
factorial 0  =  1
factorial n  =  n * factorial (n - 1)

fibonacci :: Int -> Int
fibonacci 0  = 1
fibonacci 1  = 1
fibonacci n  = fibonacci (n - 1) + fibonacci (n - 2)

esPrimo :: Int -> Bool
esPrimo 1 = False
esPrimo 2 = True
esPrimo n = noHayDivisores 2 (n - 1) n

noHayDivisores :: Int -> Int -> Int -> Bool
noHayDivisores minimo maximo n 
    | minimo `esDivisorDe` n = False
    | minimo == maximo       = True
    | otherwise              = noHayDivisores (minimo + 1) maximo n

esDivisorDe :: Int -> Int -> Bool
esDivisorDe unNumero otroNumero = mod otroNumero unNumero == 0
