# Primer clase funcional

Aprender conceptos funcional y hacerlo de manera correcta

El paradigma surge de funciones matemáticas -> f(x) = x + 2
Para ser una función, tiene que:
- Unicidad
- Existencia

En algoritmos, una función con mismos parámetros no tiene la misma salida, por lo tanto no cumple con los requisitos de función -> Unicidad. Ademas, no siempre devuelve algo, por lo tanto no cumplen con existencia.

## Expresividad

Que el código sea fácil de entender, ya sea tipando, con buenos nombres de variables, etc.

## Declarativo
**FALTA INFO**

## Haskell

No existen las variables.

Función en Haskell: `f x = x + 2` 
Sintaxis:
- nombre de la función
- parámetros
- definición de la función

Para invocarla: `f 2` -> nombre de la función y parámetros -> me devuelve 4.
Haskell puede inferir los tipos de datos de la función, parámetros y return.
Para declarar la función con sus tipos de datos -> `doble :: Number -> Number` -> Buena practica.

Si quiero una función con varios parámetros -> `suma :: Number -> Number -> Number` -> El ultimo valor va a ser el tipo de mi return.

### Tipado

- Boolean -> True, False -> not, (&&), (||), ...
- Number -> 1, 2, 3, ... -> +, -, *, mod, even, ...
- String -> "PdP", "Hola", ... -> length, ++, head, reverse, ...
- Function (t1 -> t2) -> not, even, head, >, +, ... -> aplicación, composición, ...

| Funciones son valores! Las operaciones matemáticas son funciones también.

### Condicional

En Haskell se usan pipe para armar ifs y elses -> |
```
elMasLargo nombre1 nombre2
    | length nombre1 > length nombre2 = nombre1
    | length nombre2 == length nombre1 = nombre1 ++ nombre2
    | otherwise = nombre2
```
Sintaxis -> Lo que esta después del pipe, es el condicional y si se cumple me devuelve lo que esta después del '='. Puedo seguir usando pipes como `else if`. Si quiero un `else`, tengo que usar `otherwise = ...`
Es parecido a un `switch`.

### Proyecto

Clonar el repo de `proyecto-base` y usar `/src/Library.hs`
