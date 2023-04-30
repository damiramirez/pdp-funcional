type Edad = Int
type Nombre = String
type Felicidonios = Int
type Suenios = [String]

data Persona = Persona {
  edad :: Edad,
  nombre :: Nombre,
  felicidonios :: Felicidonios,
  suenios :: Suenios
} deriving Show

coeficienteSatisfaccion :: Persona -> Int
coeficienteSatisfaccion persona
  | felicidonios persona > 100 = felicidonios persona * edad persona
  | felicidonios persona <= 100 && felicidonios persona > 50 = cantidadSuenio persona * felicidonios persona
  | otherwise = 40

cantidadSuenio :: Persona -> Int
cantidadSuenio persona = length (suenios persona)

nombreLargo :: Persona -> Bool
nombreLargo persona = longitudNombre persona > 10

longitudNombre :: Persona -> Int
longitudNombre persona = length (nombre persona)

personaSuertuda :: Persona -> Bool
personaSuertuda persona = even (coeficienteSatisfaccion persona * 3)

nombreLindo :: Persona -> Bool
nombreLindo persona = primeraLetraNombre persona == 'L'

primeraLetraNombre :: Persona -> Char
primeraLetraNombre persona = head (nombre persona)

-- Ver cumplir suenio
cumplirSuenios :: Persona -> Persona
cumplirSuenios persona = quedarSinSuenios (ganarFelicidoniosPorCumplirSuenios persona)

ganarFelicidoniosPorCumplirSuenios :: Persona -> Persona
ganarFelicidoniosPorCumplirSuenios persona = ganarFelicidonios(felicidoniosAlCumplirSuenio persona) persona

felicidoniosAlCumplirSuenio :: Persona -> Felicidonios
felicidoniosAlCumplirSuenio persona = coeficienteSatisfaccion persona + cantidadSuenio persona

ganarFelicidonios :: Felicidonios -> Persona -> Persona
ganarFelicidonios felicidoniosGanados persona = persona{felicidonios = felicidonios persona + felicidoniosGanados}

quedarSinSuenios :: Persona -> Persona
quedarSinSuenios persona = persona{suenios = []}

tirarMoneda :: Persona -> Persona
tirarMoneda persona
  | personaSuertuda persona = cumplirSuenios persona
  | otherwise = persona