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

-- -- Reduccion -> Fold -> Foldl y Foldr
-- type Calorias = Float

-- data Hombre = UnHombre String Float deriving Show
-- data Comida = UnaComida Calorias deriving Show

-- rosquilla1 :: Comida
-- rosquilla1 = UnaComida 300
-- rosquilla2 :: Comida
-- rosquilla2 = UnaComida 200
-- rosquilla3 :: Comida
-- rosquilla3 = UnaComida 150

-- homero :: Hombre
-- homero = UnHombre "Homero Simpson" 120

-- comer 