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

-- Composicion
f :: (t1 -> t2) -> (t3 -> t1) -> t3 -> t2
f algo otraCosa noSeQueOtroNombreInventar = algo (otraCosa noSeQueOtroNombreInventar)

cantidadLetrasPar :: Foldable t => t a -> Bool
cantidadLetrasPar palabra = (even . length) palabra

-- Hace el doble del triple del doble del numero
multi :: Integer -> Integer
multi numero = (doble . triple .(*2)) numero