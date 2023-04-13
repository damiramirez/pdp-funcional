# Primer clase funcional

Aprender conceptos funcional y hacerlo de manera correcta

El paradigma surge de funciones matematicas -> f(x) = x + 2
Para ser una funcion, tiene que:
- Unicidad
- Existencia

En algoritmos, una funcion con mismos parametros no tiene la misma salida, por lo tanto no cumple con los requisitos de funcion -> Unicidad. Ademas, no siempre devuelve algo, por lo tanto no cumplen con existencia.

## Expresividad

Que el codigo sea facil de entender, ya sea tipando, con buenos nombres de variables, etc.

## Declarativo
**FALTA INFO**

## Haskell

No existen las variables.

Funcion en Haskell: `f x = x + 2` 
Sintaxis:
- nombre de la funcion
- parametros
- definicion de la funcion

Para invocarla: `f 2` -> nombre de la funcion y parametro -> me devuelve 4.
Haskell puede inferir los tipos de datos de la funcion, parametro y return.
Para declarar la funcion con sus tipos de datos -> `doble :: Number -> Number` -> Buena practica.

Si quiero una funcion con varios parametros -> `suma :: Number -> Number -> Number` -> El ultimo valor va a ser el tipo de mi return.

### Tipado

- Boolean -> True, False -> not, (&&), (||), ...
- Number -> 1, 2, 3, ... -> +, -, *, mod, even, ...
- String -> "PdP", "Hola", ... -> length, ++, head, reverse, ...
- Function (t1 -> t2) -> not, even, head, >, +, ... -> aplicacion, composicion, ...

| Funciones son valores! Las operaciones matemticas son funciones tambien.

### Condicional

En Haskell se usan pipe para armar ifs y elses -> |
```
elMasLargo nombre1 nombre2
    | length nombre1 > length nombre2 = nombre1
    | length nombre2 == length nombre1 = nombre1 ++ nombre2
    | otherwise = nombre2
```
Sintaxis -> Lo que esta despues del pipe, es el condicional y si se cumple me devuelve lo que esta despues del '='. Puedo seguir usando pipes como `else if`. Si quiero un `else`, tengo que usar `otherwise = ...`
Es parecido a un `switch`.

### Proyecto

Clonar el repo de `proyecto-base` y usar `/src/Library.hs`
