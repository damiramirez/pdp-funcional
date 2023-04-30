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