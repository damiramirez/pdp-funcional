# Tercera clase
Orden superior y testing.

## Orden superior
El concepto de orden superior en Haskell se refiere a la capacidad de tratar las funciones como valores y pasarlas como argumentos a otras funciones, así como devolverlas como resultados de funciones. En Haskell, las funciones de orden superior son funciones que toman una o más funciones como argumentos o devuelven una función como resultado.

La capacidad de utilizar funciones como valores permite escribir código más genérico y reutilizable. 

- Me permite aislar y reutilizar un comportamiento común.
- Partir problemas y separar responsabilidades.
- Puedo tener un código con partes incompletas, esperando rellenarlos pasando comportamiento por parámetro.
- Me concentro mas en la condición que en recorrer los datos.

### Filter
La función `filter` de Haskell es un ejemplo común de este tipo. Recibe por parámetro una función F y una lista y retorna una nueva lista que contiene aquellos elementos que al ser aplicaos como parámetros a la función F devuelven verdadero.
`filter :: (a -> Bool) -> [a] -> [a]`

### Map 
La función `map` es de orden superior en Haskell que toma una función y una lista como argumentos y devuelve una nueva lista que resulta de aplicar la función a cada elemento de la lista original.
`map :: (a -> b) -> [a] -> [b]`

### Any
La función `any` es una función de orden superior en Haskell que toma una función booleana y una lista como argumentos y devuelve True si al menos un elemento de la lista satisface la condición de la función booleana. 
`any :: Foldable t => (a -> Bool) -> t a -> Bool`

### All
La función `all` toma una función booleana y una lista como argumentos y devuelve True si la función se satisface para todos los elementos de la lista. 
`all :: Foldable t => (a -> Bool) -> t a -> Bool`