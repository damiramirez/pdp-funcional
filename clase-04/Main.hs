doble :: Integer -> Integer
doble numero = 2 * numero

triple :: Integer -> Integer
triple numero = 3 * numero

promedio :: Integer -> Integer -> Integer
promedio numero1 numero2 = (numero1 + numero2) `div` 2

cuentaLoca :: Integer -> Integer -> Integer -> Integer
cuentaLoca numero1 numero2 numero3 = numero1 + numero2 * numero1 - numero3

-- Puedo usar aplicacion parcial y no hace falta tener todas estas funciones
-- promedioConDos :: Integer -> Integer
-- promedioConDos numero = promedio 2 numero

-- promedioCon2 :: Integer -> Integer
-- promedioCon2 numero = promedio 2 numero

-- promedioCon3 :: Integer -> Integer
-- promedioCon3 numero = promedio 3 numero

-- promedioCon256 :: Integer -> Integer
-- promedioCon256 numero = promedio 256 numero

elMejor :: Ord a => (t -> a) -> t -> t -> t
elMejor criterio elemento1 elemento2
  | criterio elemento1 > criterio elemento2 = elemento1
  | otherwise = elemento2

losNumerosGrandes numeros = filter ( 5 < ) numeros

-- Composicion - Funcion que aplica algo a otra cosa con el parametro no se que otro nombre inventar
-- Algo(OtraCosa(noSeQueOtroNombreInventar))
f :: (t1 -> t2) -> (t3 -> t1) -> t3 -> t2
f algo otraCosa noSeQueOtroNombreInventar = algo (otraCosa noSeQueOtroNombreInventar)

cantidadLetrasPar :: Foldable t => t a -> Bool
cantidadLetrasPar palabra = (even . length) palabra

-- Hace el doble del triple del doble del numero
multi :: Integer -> Integer
multi numero = (doble . triple .(*2)) numero

  -- g . f -> Primero se aplica f y dsp g
-- imagen f == dominio g

cuadruple :: Integer -> Integer
-- cuadruple numero = (doble . doble) numero
-- cuadruple = (doble . doble)
-- Esto se debe a la simplificacion `eta-conversion`
cuadruple = doble . doble

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
