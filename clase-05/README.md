# Clase 5

Patrones de listas. Recursividad. Evaluación diferida. Listas infinitas	

## Recursividad
Una función puede llamarse a sí misma, y ese mecanismo recursivo es el que implementa una estructura de repetición en el paradigma funcional.

```Haskell
-- Con guardas
factorial n 
  | n == 0     = 1
  | n > 0      = n * factorial (n - 1)

Pattern Matching
factorial 0  =  1
factorial n  =  n * factorial (n - 1)
```

Para armar una función recursiva, lo primero que tenemos que identificar es el **caso base**, donde va a cortar la función. Luego planteamos el caso recursivo.

Fibonacci
```Haskell
fibonacci 0  = 1
fibonacci 1  = 1
fibonacci n  = fibonacci (n - 1) + fibonacci (n - 2)
```

Los dos primeros patrones representan los casos base, mientras que el patrón n encaja con la definición recursiva de la función fibonacci.

## Recursividad con listas
Repasemos la definición de una lista, que tiene una estructura recursiva:
- El caso base es la lista vacía.
- El caso recursivo es una lista de 1 ó más elementos, cuya cabeza es el primer elemento y cuya cola es una lista con los restantes.

### length
La longitud de una lista se calcula como
- Caso base: 0 si la lista es vacía.
- Caso recursivo: la longitud de la cola + 1.

```Haskell
length :: [a] -> Int
length [] = 0
length (x:xs) = 1 + length xs
```

### Sum
La lógica es similar a la longitud. Si no hay elementos, la suma es 0. Si hay, es el valor de la cabeza + la sumatoria de la cola.

```Haskell
sum :: Num a => [a] -> a
sum [] = 0
sum (x:xs) = x + sum xs
```

### Last
Last devuelve el último elemento. El algoritmo se puede pensar como:
- El último elemento de una lista de un solo elemento es su cabeza
- O el último elemento de una lista de más de un elemento es el último elemento de la cola
  
```Haskell
last :: [a] -> a
last [x] = x
last (x:xs) = last xs
```

### Take
Para tomar los primeros n elementos tenemos dos casos base
- Si ya saqué n elementos, no hay más elementos para sacar
- Si la lista se vació, no hay más elementos para sacar: ese “no hay más elementos” es la lista vacía

`take 3 [1, 4, 2, 6, 7, 10] => [1, 4, 2]`
```Haskell
take :: Int -> [a] -> [a]
take n _  | n <= 0  = []   
take _ []           = []
take n (x:xs)       = x : take (n - 1) xs
```

### Drop
Para descartar los primeros n elementos, tomamos la definición de take pero debemos invertir lo que hace cada caso
- El caso base es que ya llegué a la enésima posición, entonces devuelvo la lista que quedó.
- El caso recursivo es que estoy sacando los elementos que están antes de la posición n, entonces simplemente los descarto y sigo llamando a drop con la cola y un índice menos.

`drop 3 [1,2,3,4,5] => [4,5]`

```Haskell
drop :: Int -> [a] -> [a]
drop 0 xs     = xs   
drop n (_:xs) = drop (n - 1) xs
```

### !! => Devolver elementos de una posición
Para encontrar el elemento que está en la posición n, 
- el caso base es que busco el elemento en la posición 0, es el que está en la cabeza de esa lista.
- El caso recursivo es que para encontrar el enésimo elemento de una lista, es equivalente a encontrar el enésimo elemento (- 1) de la cola.

`"Buenos días" !! 3 => 'n'`

```Haskell
(!!) :: [a] -> Int -> a
(!!) (x:_) 0 = x
(!!) (_:xs) n = xs !! (n - 1)
```

### Elem
La función elem determina si un elemento está en una lista.
Los casos base son
- Si llegué a la lista vacía, el elemento no está.
- Si el elemento a buscar está en la cabeza lo encontré.
El caso recursivo es verificar si el elemento a buscar está en la cola.

```Haskell
elem :: Eq a => a -> [a] -> Bool
elem _ []     = False
elem e (x:xs) = e == x || elem e xs
```

### (++) o concatenación
Para concatenar dos listas, 
- Si la primera lista es vacía, la lista resultante es la segunda lista
- En cambio, si hay elementos en la primera lista, estos elementos formarán parte de la lista resultante (respetando ese orden)

`"guarda" ++ "meta" => "guardameta"`

```Haskell
concat :: [a] -> [a] -> [a]
concat []     x2 = x2
concat (x:xs) x2 = x:concat xs x2
```

### Reverse
Para dar vuelta el orden de los elementos de una lista
- El caso base es que la reversa de una lista vacía es la lista vacía
- El caso recursivo implica concatenar la inversa de la cola con el elemento que está en la cabeza, solo que el operador (:) separa cabeza y cola que no son del mismo tipo. Entonces utilizamos el pattern matching de una lista con un solo elemento: así tenemos dos listas y se pueden concatenar, de la siguiente manera

`reverse [1,2,3,4,5] => [5, 4, 3, 2, 1]`

```Haskell
reverse :: [a] -> [a]
reverse []     = [] 
reverse (x:xs) = (reverse xs) ++ [x]
```

## Evaluación diferida
Trabajamos con listas infinitas. Estas funciones no podrían terminar nunca, ya que no hay ningún punto en el que se corte la recursividad. Sin embargo, lo que sí podríamos hacer con estas funciones es usarlas en un contexto que acote la ejecución:

```Haskell
muchosDe n = n:(muchosDe n) -- Si llamo a esta función, crea una lista infinita
-- La acoto
(head . muchosDe) 5 
(sum . take 10 . muchosDe) 5 
```

## Lazy Evaluation
Haskell como otros lenguajes funcionales, trabajan con el concepto de evaluación diferida o perezosa (lazy evaluation), de manera de evaluar los argumentos a medida que los va necesitando.

- Con la evaluación diferida solo se evalúa aquello que realmente se necesita. 
- Como corolario, puedo trabajar con estructuras potencialmente infinitas (como las listas), mientras asegure que el algoritmo converge
Si una expresión puede andar, con evaluación diferida seguro que anda. Si se rompe, es porque necesité algo que se rompía. 

## Resumen
La recursividad en Haskell se relaciona con la estructura de iteración de los paradigmas imperativos pero también es cercana a la definición por inducción que conocemos de la matemática. Todo algoritmo recursivo necesita un caso base para cortar la recursividad y un caso recursivo.

Otro concepto que aprendimos es la evaluación perezosa, que permite diferir la resolución de expresiones hasta el momento en que sea necesario utilizarlas. Esto permite utilizar listas potencialmente infinitas dentro de algoritmos convergentes y evitar la evaluación de expresiones que luego no se utilicen. 

