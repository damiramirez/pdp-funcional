# Segunda clase

## TypeClasses

## TypeAlias

## Pattern Matching

## Tupla
Tipo de dato compuesto que agrupa información relacionada y que me sirve para modelar entidades. La tupla va entre paréntesis y separada por comas -> `("Damian", 24)`.

```Haskell
type Persona = (String, Integer)
esMayorEdad :: Persona -> Bool
...
```

Puedo modelar asi mi función para que acepte distintos tipos de datos, voy a poder hacer la composición de funciones mientras cumpla con la condición de imagen y dominio.