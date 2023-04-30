# Tercera clase
Orden superior y testing.

## Orden superior
En el paradigma funcional Tanto en matemática como en informática, se definen las funciones de orden superior como funciones que reciben funciones por parámetro siendo capaz de ejecutarla internamente o bien devuelven una función como resultado.

- Me permite aislar y reutilizar un comportamiento común.
- Partir problemas y separar responsabilidades.
- Puedo tener un código con partes incompletas, esperando rellenarlos pasando comportamiento por parámetro.

### Filter
La función `filter` de Haskell es un ejemplo común de este tipo. Recibe por parámetro una función F y una lista y retorna una nueva lista que contiene aquellos elementos que al ser aplicaos como parámetros a la función F devuelven verdadero.
`filter :: (a -> Bool) -> [a] -> [a]`

