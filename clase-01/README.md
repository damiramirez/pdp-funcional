# Primer clase funcional

Aprender conceptos funcional y hacerlo de manera correcta

El paradigma surge de funciones matemáticas -> f(x) = x + 2
Para ser una función, tiene que que cumplir:
- Unicidad
- Existencia

En algoritmos, una función con mismos parámetros no tiene la misma salida, por lo tanto no cumple con los requisitos de función -> Unicidad. Ademas, no siempre devuelve algo, por lo tanto no cumplen con existencia.

## Abstracción
Una abstracción es una forma de interpretar y conceptualizar lo que resulta más importante de una entidad compleja, sin tener que tener en cuenta todos sus detalles. Me permite quedarme con lo esencial descartando lo que (para mí, en ese momento) es accesorio. Se trata de tomar un problema o situación compleja y dividirla en componentes más pequeños y manejables.


## Declaratividad

La declaratividad es una característica de algunas herramientas que permiten o fuerzan la separación entre el conocimiento del dominio de un programa y la manipulación de dicho conocimiento. 

Es un estilo de programación en el que se describe el resultado deseado de una tarea, en lugar de describir los pasos detallados para lograr ese resultado. En lugar de decirle al programa exactamente qué hacer en cada paso, se le dice qué resultado esperar y el programa determina internamente cómo alcanzar ese resultado. 

Un programa declarativo separa claramente los siguientes elementos:

- El objetivo
- El conocimiento
- El motor que manipula el conocimiento para lograr el objetivo deseado

El paradigma funcional tiene una naturaleza declarativa.

## Expresividad

La expresividad puede definirse informalmente con la heurística “el nivel de lindez del código”. En otras palabras, escribir un código expresivo es poner atención a las cuestiones que hacen que este código fuente sea más fácil de entender por una persona. Que el código sea fácil de entender, ya sea declarando los tipos de datos, con buenos nombres de variables, etc.

## Declaratividad vs expresividad

Decimos que un algoritmo es mas declarativo si se enfoca en describir el resultado deseado del código. La idea de declaratividad debería ser más objetiva que la idea de expresividad.

Decimos que una solución A es más expresiva que una solución B si la solución A se entiende más rápido/es más fácil de leer que la solución B. Claramente la idea de expresividad puede verse de forma subjetiva.

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

En la consola si uso: `:t` me devuelve el tipo de una expresión o función -> `Integer a => a -> a`. Quiere decir que los valores que sean `a` van a ser tomados como `Integer`

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
