# Segunda clase
Temas: Modelar información. Funciones. Expresiones. Tipos básicos. Pattern matching.

## Variable de tipo
Funciones con tipado dinámico, pueden recibir cualquier tipo de parámetro.

```Haskell
  -- a y b pueden ser distintos tipos
  quedateConElPrimero :: a -> b -> a
  quedateConElPrimero uno otro = uno

```

## TypeClass
Es una interfaz, que define un conjunto de operaciones que pueden ser utilizadas con diferentes tipos de datos. Algunos Type que vamos a usar:
- `Eq`: para la igualdad y desigualdad.
- `Ord`: para la comparación de orden.
- `Show`: para la conversión de un valor a una cadena.

## Pattern Matching
**Ver video**

## TypeAlias
Es un nombre alternativo o alias que se le da a un tipo de datos existente. Se utiliza para darle a un tipo de datos un nombre más significativo y fácil de entender en el contexto de una aplicación en particular.
`type Edad = Number`

## Listas
Serie de elementos del mismo tipo. Existen listas vacías. Para generar una lista:

```Haskell
  [1, 2, 3]
  ["Hola", "Mundo"]
```

Los strings son literales especiales que se encierran entre comillas dobles:
`"Hola"` ==> lista de caracteres ≣ `['H', 'o', 'l', 'a']`

También puedo generar listas especificando cotas inferior y superior:

```Haskell
  [1..10]
  [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

  -- También podemos definir una serie numérica de enteros 
  -- a partir del primer número, el siguiente y la cota superior:
  [1, 3..10]
  [1, 3, 5, 7, 9]
```

Funciona que vamos a usar con las listas:

```Haskell 
  -- head devuelve la cabeza de una lista - recibe lista cualquier tipo y devuelve
  -- la cabeza que es del mismo tipo que el resto de elementos
  head [1, 7, 9] => 1

  -- init me devuelve todos los elementos menos el ultimo
  init [1, 7, 9] => [1, 7]

  -- tail devuelve la cola de una lista
  tail [1, 7, 9] => [7, 9]

  -- last me devuelve el ultimo valor de la lista
  last [1, 7, 9] => 9

  -- length devuelve la longitud de la lista
  length [2..4] => 3 ([2, 3, 4])

  -- sum suma los elementos de una lista
  sum [4, 9, 1] => 14
  
  -- ++ concatena dos listas
  [3..5] ++ [4, 6] => [3, 4, 5, 4, 6]

  -- take toma los primeros n elementos de la lista
  take 3 [4..11] => [4, 5, 6]

  -- drop devuelve la lista sin los primeros n elementos
  drop 2 "CIENCIA" => "ENCIA"
  
  -- !! devuelve el elemento que esta en la posición n
  [1..10] !! 3 => 4

  -- reverse devuelve una lista con los elementos en orden inverso
  reverse "Damian" => "naimaD"
```

## Tupla
Tipo de dato compuesto que agrupa información relacionada y que me sirve para modelar entidades. La tupla va entre paréntesis y separada por comas -> `("Damian", 24)`.

```Haskell
  type Persona = (String, Integer)
  esMayorEdad :: Persona -> Bool
  ...
```
Hay definidas funciones para tuplas de dos elementos
```Haskell
  -- fst devuelve el primer elemento de la tupla
  fst ("Laura", True) => "Laura"
  -- snd devuelve el segundo elemeto de la tupla
  snd ("Laura", (30, 6)) => (30,6)
```

Si la tupla tiene mas de dos elementos, puedo usar *Pattern Matching* -> (name, edad, _)

## Tipos propios - Data
Se pueden definir nuevos tipos de datos que se agregan a los ya existentes en el lenguaje, mediante la expresión `data`.

```Haskell
  -- UnaPersona es el constructor del tipo de dato Persona
  data Persona = UnaPersona {
      nombre :: String,
      edad :: Int,
      domicilio :: String,
      telefono :: String,
      fechaNacimiento :: (Int, Int, Int),
      buenaPersona :: Bool,
      plata :: Float
  }

  -- Para declarar Persona. No hace falta que este ordenado.

  juan = Persona {
    nombre = "Juan",
    edad = 29,
    domicilio = "Ayacucho 554",
    telefono = "45232598",
    fechaNacimiento = (17,7,1988),
    buenaPersona = True,
    plata = 30.0
  } deriving Show
```

Haskell nos da funciones gets para acceder al valor del atributo. El nombre es igual al nombre del atributo. `nombre juan => "Juan"`. Debido a esto, no puedo tener distintos `data` con mismos atributos.