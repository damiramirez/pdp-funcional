-- https://docs.google.com/document/u/1/d/e/2PACX-1vSKmakjzIOjbynjlhDTbYrmTJSGf6QCrpfXOKn9O6XGmM_e5iT9yfUS-e4jRX_yLaXyCtIz9L8difZ2/pub

type Antiguedad = Int
type Clan = String
type Grado = Int
type Equipo = [Hechicero]

data Hechicero = UnHechicero {
  antiguedad :: Antiguedad,
  clan :: Clan,
  grado :: Grado
} deriving (Show)

nobara :: Hechicero
nobara = UnHechicero{ antiguedad = 1, clan = "Kugisaki", grado = 3 }

satoru :: Hechicero
satoru = UnHechicero{ antiguedad = 15, clan = "Gojo", grado = 0 }

maki :: Hechicero
maki = UnHechicero{ antiguedad = 3, clan = "Zenin", grado = 4 }

yuji :: Hechicero
yuji = UnHechicero{ antiguedad = 0, clan = "Itadori", grado = 1 }

-- Punto 2
tieneExperiencia :: Hechicero -> Bool
tieneExperiencia hechicero = antiguedad hechicero > 1

-- Punto 3
grupo :: Equipo
grupo = [nobara, yuji, satoru, maki]

grupo2 :: Equipo
grupo2 = [nobara, maki]

grupo3 :: Equipo
grupo3 = [nobara, maki, yuji]

grupo4 :: Equipo
grupo4 = [satoru, satoru]

equipoPreparado :: Equipo -> Bool
equipoPreparado hechiceros = tamanioEquipo hechiceros > 3

tamanioEquipo :: Equipo -> Int
tamanioEquipo hechiceros = length hechiceros

-- Punto 4
subirGrado :: Hechicero -> Hechicero
subirGrado hechicero
    | gradoEspecial hechicero = hechicero
    | otherwise = hechicero{ grado = grado hechicero - 1}

gradoEspecial :: Hechicero -> Bool
gradoEspecial hechicero = grado hechicero == 0

-- Punto 5
clanesPrestigiosos :: [String]
clanesPrestigiosos = ["Zenin", "Gojo", "Kamo"]

esPrestigioso :: Hechicero -> Bool
esPrestigioso hechiero = clan hechiero `elem` clanesPrestigiosos

-- Punto 6
gruposInvencibles :: Equipo -> Bool
gruposInvencibles grupo = any gradoEspecial grupo

-- Punto 7
grupoFavorito :: Equipo -> Bool
grupoFavorito grupo = all gradoEspecial grupo

-- Punto 8
type Expertos = [Hechicero]
sonExpertos :: Equipo -> Expertos
sonExpertos equipo = filter tieneExperiencia equipo

-- Punto 9
hacerFrente :: Equipo -> Bool
hacerFrente grupo = gruposInvencibles grupo || equipoPreparado grupo

powerUp :: Equipo -> Equipo
powerUp grupo = map subirGrado grupo

-- Punto 10
elMasApto :: Ord a => (Hechicero -> a) -> Hechicero -> Hechicero -> Hechicero
elMasApto nivel hechicero1 hechicero2 
    | nivel hechicero1 > nivel hechicero2 = hechicero1
    | otherwise = hechicero2 

nivelTryhard :: Hechicero -> Int
nivelTryhard hechicero = 1 `div` (grado hechicero + 1)

nivelBurocratico :: Hechicero -> Int
nivelBurocratico hechicero = length (clan hechicero)

nivelIntimidante :: Hechicero -> Char
nivelIntimidante hechicero = maximum (clan hechicero)

nivelSigilo :: Hechicero -> Int
nivelSigilo hechicero = antiguedad hechicero * 6