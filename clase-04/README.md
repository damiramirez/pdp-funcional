# Clase 4
Composición. Aplicación parcial. Expresiones lambda.	

## Composición

Matemáticamente, podemos aplicar dos funciones `g(f(x)) = (g o f) x`. Como restricción, la imagen de f tiene que coincidir con el dominio de g.

El mismo concepto se da en Haskell, donde la notación es `g (f x)`. Nótese que primero aplicamos f y luego g, pero a la hora de escribirlo en Haskell, lo hacemos al revés: `g . f`.

Vamos a usar el operador `(.)` para ser explícitos que estamos generando una nueva función, no aplicando sucesivamente las funciones existentes.

En el caso que quiera hacer una composición de mas de dos funciones, tengo que revisar que las imágenes de cada función coincidan con el dominio de la función siguiente.

```Haskell
cuadruple numero = (doble . doble) numero
doble :: Numero -> Numero
-- Puedo usar doble ya que su imagen coincide con el dominio.

-- Como en matemática, podemos simplificar tachando numero y los paréntesis:
cuadruple = doble . doble
```

## Aplicación parcial
La aplicación parcial es una técnica en Haskell que consiste en aplicar una función a menos argumentos de los que requiere originalmente. La aplicación parcial es posible en Haskell debido a su capacidad para manejar funciones como valores de primera clase. Entonces al usar esta técnica, generamos una nueva función.
`map (promedio 2) [1,2,3,4]`