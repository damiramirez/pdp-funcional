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

## Testing

El Unit Testing (prueba unitaria) es una técnica de pruebas de software que se utiliza para probar unidades individuales de código, como funciones, métodos o clases. El objetivo del Unit Testing es asegurarse de que cada unidad de código funciona correctamente de manera aislada y que produce los resultados esperados.

En Haskell se usa la biblioteca `HUnit` que proporciona una serie de funciones y herramientas para escribir pruebas unitarias. Vamos a importar las funciones de `import Test.Hspec`. 

- `hspec :: Spec -> IO ()` => Es la función principal a la que llamamos para correr toda una pila de tests.
- `describe :: String -> SpecWith a -> SpecWith a` => Sirve para agrupar tests bajo un mismo nombre al correrlos para una mejor organización.
- `it :: Example a => String -> a -> SpecWith (Arg a)` => Es la función que usamos para crear cada test; espera el nombre del test y el test en sí, y nos devuelve el output que veremos por pantalla.
- `shouldBe :: (Show a, Eq a) => a -> a -> Expectation` => El assert básico de igualdad.

```Haskell
runTests = hspec $ do
  describe "Tests con números:" $ do
     it "1 + 1 es 2" $ do
       1 + 1 `shouldBe` 2
```

### Buenas prácticas
1. Evitar comparar tipos de datos Booleanos. Para evitar eso podemos usar `shouldSatisfy :: Show a => a -> (a -> Bool) -> Assertion` que espera un a y una condición que tenga que cumplir. Así podemos reescribir nuestro test:

2. Cuando queremos verificar que nuestro programa falle, podemos usar `evaluate` y `shouldThrow anyException`. Tenemos que importar las funciones con `import Control.Exception`