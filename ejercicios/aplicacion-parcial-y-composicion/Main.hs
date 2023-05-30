-- Aplicación Parcial

-- Definir una función siguiente, que al invocarla con un número cualquiera me devuelve el resultado de sumar a ese número el 1. 
siguiente :: Integer -> Integer
siguiente = (1 +)

-- Definir la función mitad que al invocarla con un número cualquiera me devuelve la mitad de dicho número.
mitad :: Float -> Float
mitad = (/ 2)

-- Definir una función inversa, que invocando a la función con un número cualquiera me devuelva su inversa. 
inverso :: Float -> Float
inverso = (1 /)

-- Definir una función triple, que invocando a la función con un número cualquiera me devuelva el triple del mismo.
triple :: Integer -> Integer
triple = (3 *)

-- Definir una función esNumeroPositivo, que invocando a la función con un número cualquiera me devuelva true si el número es positivo y false en caso contrario. 
esNumeroPositivo :: Float -> Bool
esNumeroPositivo = (>= 0)

-- Composición

-- Resolver la función del ejercicio 2 de la guía anterior esMultiploDe/2, utilizando aplicación parcial y composición.
-- esMultiploDe :: Integer -> (Integer -> Bool)
-- esMultiploDe = (/ 3) == 0

-- Resolver la función del ejercicio 5 de la guía anterior esBisiesto/1, utilizando aplicación parcial y composición.

