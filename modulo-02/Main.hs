-- Listas
personas :: [Integer]
personas = [1, 2, 3, 4]

-- La cabeza es un elemento y la cola siempre es una lista
-- (1:[2, 3]) = (1:(2:[3])) = (1:(2:(3:[])))

-- Tuplas
tupla :: (Integer, [Integer], String)
tupla = (1, [2], "ultraviolento")

-- Jovits
type Nombre = String
type Altura = Int
type Jovit = (Nombre, Altura)
type Reputacion = Int
type Fuerza = Int

bilbo :: Jovit
bilbo = ("Bilbo", 125)

rosita :: Jovit
rosita = ("Rosita Coto", 115)

merryl :: Jovit
merryl = ("Meriadoc Dropdigamo", 131)

pippin :: Jovit
pippin = ("Peregrin Take", 131)

yenny :: Jovit
yenny = ("Yennisifez Lorne", 75)

ary :: Jovit
ary = ("Ariel Airimedez", 103)

-- nombre :: Jovit -> Nombre
-- nombre jovit = fst jovit
-- altura :: Jovit -> Altura
-- altura jovit = snd jovit

reputacion :: Jovit -> Reputacion
reputacion (nombre, altura) = length nombre * altura

diferenciaAltura :: Jovit -> Jovit -> Altura
diferenciaAltura (_, altura1) (_, altura2) =  abs (altura1 - altura2)

-- Las proximas clases vamos a ver como reducir la expresion
type Censo = [Jovit]

amanecioConElCenso :: Censo -> Jovit
amanecioConElCenso censo = head censo

seCansoDeEsperar :: Censo -> Jovit
seCansoDeEsperar censo = last censo

participacion :: Censo -> Int
participacion censo = length censo

elTopeTres :: Censo -> [Jovit]
elTopeTres censo = take 3 censo

elResto :: Censo -> [Jovit]
elResto censo = drop 3 censo

-- Data -> Defino nuevos tipos de datos
-- Ya viene con gets con nombres de los atributos
data Hobit = UnHobit {
    nombre :: Nombre,
    altura :: Altura,
    fuerza :: Fuerza,
    esDeLaComarca :: Bool
} deriving Show

vilvo :: Hobit
vilvo = UnHobit "Vilvo" 125 5 True

violeta :: Hobit
violeta = UnHobit {nombre = "Violeta", altura = 115, fuerza = 5, esDeLaComarca = False}

-- Modificar data -> Simulo un cambio de estado ya que en Haskell todo es inmutable
perderHabla :: Hobit -> Hobit
-- perderHabla hobit = UnHobit{nombre = drop 4 (nombre hobit), altura = altura hobit ...}
-- De esta forma voy a crear un nuevo Hobit pero solo cambia lo que esta dentro del {}
perderHabla hobit = hobit{nombre = drop 4 (nombre hobit)}

ininputable :: Hobit -> Hobit
ininputable hobit = UnHobit{nombre = nombre hobit ++ " sos inimputable", altura = altura hobit + 10, fuerza = fuerza hobit `div` 2, esDeLaComarca = True}