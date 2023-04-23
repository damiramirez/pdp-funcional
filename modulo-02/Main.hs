-- g . f -> Primero se aplica f y dsp g
-- imagen f == dominio g

cuadruple :: Integer -> Integer
-- cuadruple numero = (doble . doble) numero
-- cuadruple = (doble . doble)
-- Esto se debe a la simplificacion `eta-conversion`
cuadruple = doble . doble

doble :: Integer -> Integer
doble numero = numero * 2

-- Ej: longitud de nombre es par

nombrePar :: String -> Bool
-- nombrePar nombre = even (length nombre)
-- nombrePar nombre = (even . length) nombre
-- nombrePar = (even . length)
nombrePar = even . length
-- imagen length = Integer -> dominio even = Integer -> Cumple

-- Ej: persona mayor de edad
-- type Persona = (String, Integer)
type Persona = (String, Integer, String)
damian :: Persona
damian = ("Damian", 24, "Medrano 951 CABA")

-- snd me devuelve el segundo valor de la tupla
edad :: Persona -> Integer
-- edad = snd
-- Esta fundion utiliza pattern matching y me devuelve la edad de la tupla de 3 elementos
edad (_, e, _) = e

mayorEdad :: Integer -> Bool
mayorEdad edad = edad >= 18

esMayorEdad :: Persona -> Bool
esMayorEdad = mayorEdad . edad

-- Composicion de mas de dos funciones
-- Ej: saber si una persona no es mayor de edad
esMenorEdad = not . mayorEdad . edad

-- Aplicacion parcial
siguiente :: Integer -> Integer
-- siguiente numero = numero + 1
-- Pero también podemos aprovechar la suma, que está definida como:
-- (+) :: Numero -> Numero -> Numero
-- Entonces la expresión (1 +) define una nueva función:
-- (1 +) :: Numero -> Numero
siguiente = (1 +)

-- Composicion + aplicacion parcial
-- Ej: compienza con p

-- comienzaConP :: String -> Bool
-- comienzaConP nombre = head nombre == 'p'

esP :: Char -> Bool
esP = ('p' == )
-- No hace falta que la escriba, puedo usar (('p' ==) . head) "palabras"

-- Ej: costo estacionamineto
costoEstacionamiento :: Integer -> Integer
-- costoEstacionamiento horas = ((* 50) . max 2) horas
costoEstacionamiento = (* 50) . max 2