-- Definir la función esMultiploDeTres/1, que devuelve True si un número es múltiplo de 3, p.ej: 
esMultiploDeTres :: Integer -> Bool
esMultiploDeTres numero = numero `mod` 3 == 0

-- Definir la función esMultiploDe/2, que devuelve True si el segundo es múltiplo del primero
esMultiploDe :: Integer -> Integer -> Bool
esMultiploDe numero1 numero2 = numero2 `mod` numero1 == 0

-- Definir la función cubo/1, devuelve el cubo de un número.
cubo :: Integer -> Integer
cubo numero = numero ^ 3

-- Definir la función area/2, devuelve el área de un rectángulo a partir de su base y su altura.
area :: Integer -> Integer -> Integer
area base altura = base * altura

-- Definir la función esBisiesto/1, indica si un año es bisiesto. (Un año es bisiesto si es divisible por 400 o es divisible por 4 
-- pero no es divisible por 100) Nota: Resolverlo reutilizando la función esMultiploDe/2
esBisiesto :: Integer -> Bool
esBisiesto anio = esMultiploDe 400 anio || (esMultiploDe 4 anio && not (esMultiploDe 100 anio))

-- Definir la función celsiusToFahr/1, pasa una temperatura en grados Celsius a grados Fahrenheit.
celsiusToFahr :: Float -> Float
celsiusToFahr celsius = (celsius * 9/5) + 32


-- Definir la función fahrToCelsius/1, la inversa de la anterior.
fahrToCelsius :: Float -> Float
fahrToCelsius fahrenheit = (fahrenheit - 32) * 5/9

-- Definir la función haceFrioF/1, indica si una temperatura expresada en grados Fahrenheit es fría. Decimos que hace frío si la temperatura es menor a 8 grados Celsius. 
haceFrio :: Float -> Bool
haceFrio temperatura = fahrToCelsius temperatura < 8

-- Definir la función mcm/2 que devuelva el mínimo común múltiplo entre dos números, de acuerdo a esta fórmula. 
-- m.c.m.(a, b) = {a * b} / {m.c.d.(a, b)} 
-- Nota: Se puede utilizar gcd.
mcm :: Integer -> Integer -> Integer
mcm numero1 numero2  = numero1 * numero2 `div` gcd numero1 numero2

-- Dispersión
-- Trabajamos con tres números que imaginamos como el nivel del río Paraná a la altura de Corrientes medido en tres días consecutivos; cada medición es un entero que representa una cantidad de cm. 
-- P.ej. medí los días 1, 2 y 3, las mediciones son: 322 cm, 283 cm, y 294 cm. 
-- A partir de estos tres números, podemos obtener algunas conclusiones. 
-- Definir estas funciones:
-- a. 
  -- dispersion, que toma los tres valores y devuelve la diferencia entre el más alto y el más bajo. 
  -- Ayuda: extender max y min a tres argumentos, usando las versiones de dos elementos. 
  -- De esa forma se puede definir dispersión sin escribir ninguna guarda (las guardas están en max y min, que estamos usando). 

dispersion :: Integer -> Integer -> Integer -> Integer
dispersion altura1 altura2 altura3 = maxTres altura1 altura2 altura3 - minTres altura1 altura2 altura3

maxTres :: Integer -> Integer -> Integer -> Integer
maxTres numero1 numero2 numero3 = max numero1 (max numero2 numero3)

minTres :: Integer -> Integer -> Integer -> Integer
minTres numero1 numero2 numero3 = min numero1 (min numero2 numero3)

-- b.
  -- diasParejos, diasLocos y diasNormales reciben los valores de los tres días. 
  -- Se dice que son días parejos si la dispersión es chica, que son días locos si la dispersión es grande, y que son días normales si no son ni parejos ni locos. 
  -- Una dispersión se considera chica si es de menos de 30 cm, y grande si es de más de un metro. 
  -- Nota: Definir diasNormales a partir de las otras dos, no volver a hacer las cuentas. 

diasParejos :: Integer -> Integer -> Integer -> Bool
diasParejos altura1 altura2 altura3 = dispersion altura1 altura2 altura3 < 30

diasLocos :: Integer -> Integer -> Integer -> Bool
diasLocos altura1 altura2 altura3 = dispersion altura1 altura2 altura3 > 100

diasNormales :: Integer -> Integer -> Integer -> Bool
diasNormales altura1 altura2 altura3 = not (diasParejos altura1 altura2 altura3) && not (diasLocos altura1 altura2 altura3)

-- Este ejercicio alguna vez se planteó como un Desafío Café con Leche: Implementar la función esCuadradoPerfecto/1, 
-- sin hacer operaciones con punto flotante. Ayuda: les va a venir bien una función auxiliar, tal vez de dos parámetros. 
-- Pensar que el primer cuadrado perfecto es 0, para llegar al 2do (1) sumo 1, para llegar al 3ro (4) sumo 3, para llegar 
-- al siguiente (9) sumo 5, después sumo 7, 9, 11 etc.. También algo de recursividad van a tener que usar. 

-- Uso 0 y 1 ya que es la condicion inicial -> primer cuadrado perfecto = 0 - incremento = 1 -> le sumo 2, siempre impar
esCuadradoPerfecto :: Integer -> Bool
esCuadradoPerfecto numero = esCuadradoPerfectoCalculo numero 0 1

-- Funcion se ejecuta recursivamente hasta que el numero == sumaImpar o sumaImpar sea mayor al numero -> no es cuadrado perfecto
esCuadradoPerfectoCalculo :: Integer -> Integer -> Integer -> Bool
esCuadradoPerfectoCalculo numero sumaImpar incrementoImpar
    | numero == sumaImpar = True
    | sumaImpar > numero = False
    | otherwise = esCuadradoPerfectoCalculo numero (sumaImpar + incrementoImpar) (incrementoImpar + 2)

-- ej:
      -- 9 0 1
      -- 9 1 3
      -- 9 4 5
      -- 9 9 7

