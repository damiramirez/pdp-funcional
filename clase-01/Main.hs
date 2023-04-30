import Distribution.Simple.Utils (xargs)
-- GHCI -> Comandos
-- :l archivo.hs -> cargo funciones 
-- :t -> me devuelve el tipo de dato

-- nombreFuncion :: Tipo de parametro -> Tipo de retorno
aproboAlumno :: Int -> Bool
-- Para escribir dentro del cuerpo de la funcion, debo primero poner el nombre de la funcion
aproboAlumno nota = nota >= 6

pesosADolares :: Float -> Float
pesosADolares pesos = pesos / 206.50

millasAKilometros :: Float -> Float
millasAKilometros millas = millas * 1.609344

-- Puedo no declarar la funcion, el motor infiere tipo de parametros
-- doble :: Int -> Int
doble x = 2 * x

-- Funcion con varios parametros
suma :: Int -> Int -> Int
suma x y = x + y

-- Puedo definir funciones por partes - tipo con condicionales (?)
-- Respetar formato
-- otherwhise siempre al final - si no cumple ninguna condicion, sale por ahi
max x y | x > y     = x
        | otherwise = y

puedoAvanzar :: String -> Bool
-- Comparando con el == -> Bool - remplaza al if ?
puedoAvanzar color = color == "verde" 

esLargo :: String -> Bool
esLargo name = length name > 10

primeroDos :: [Int] -> [Int]
primeroDos numeros = take 2 numeros

algunoEsLargo :: String -> String -> Bool
algunoEsLargo nombre1 nombre2 = esLargo nombre1 || esLargo nombre2