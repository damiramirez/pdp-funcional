import Distribution.PackageDescription.Parsec (parseGenericPackageDescriptionMaybe)

type Nombre = String
type Poder = Int
type Horas = Int
type Fortaleza = Int
type Presion = Int
type Objeto = String


data Golpe = UnGolpe {
  nombre :: Nombre,
  horasEntrenamiento :: Horas
} deriving (Show)

kame :: Golpe
kame = UnGolpe{nombre = "KameHameHa", horasEntrenamiento = 200}

gomu :: Golpe
gomu = UnGolpe{nombre = "gomu gomu elephant gatling", horasEntrenamiento = 180}

golpesConsecutivos :: Golpe
golpesConsecutivos = UnGolpe{nombre = "golpes normales consecutivos", horasEntrenamiento = 240}

poderGolpe :: Golpe -> Poder
poderGolpe golpe = 15 * horasEntrenamiento golpe

fortalezaObjeto :: Objeto -> Fortaleza
fortalezaObjeto objeto = 2 * length objeto

presionGolpe :: Golpe -> Objeto -> Presion
presionGolpe golpe objeto = poderGolpe golpe `div` fortalezaObjeto objeto

esObjetivoDificil :: Objeto -> Bool
esObjetivoDificil objeto = presionGolpe gomu objeto < 100

esObjetivoAccesible :: Objeto -> Bool
esObjetivoAccesible objeto = presionGolpe golpesConsecutivos (focalizarObjeto objeto) > 200 && presionGolpe golpesConsecutivos (focalizarObjeto objeto) < 400

focalizarObjeto :: Objeto -> Nombre
focalizarObjeto objeto = take 7 objeto


-- data Heroe = UnHeroe {
--   nombre :: Nombre,
--   horasEntrenamiento :: Horas
-- } deriving (Show)

-- data Golpe = UnGolpe {
--   nombreGolpe :: Nombre,
--   horasNecesarias :: Horas
-- } deriving (Show)

-- Tipos de golpes
-- gomu :: Golpe
-- gomu = UnGolpe{nombreGolpe = "gomu gomu elephant gatling", horasNecesarias = 180}

-- gomuHeroe :: Heroe
-- gomuHeroe = UnHeroe{nombre= "gomu gomu elephant gatling", horasEntrenamiento = 180}

-- golpesConsecutivos :: Golpe
-- golpesConsecutivos = UnGolpe{nombreGolpe = "golpes normales consecutivos", horasNecesarias = 240}

-- golpesHereo :: Heroe
-- golpesHereo = UnHeroe{nombre = "golpes normales consecutivos", horasEntrenamiento = 240}

-- -- Heroe para testear
-- damian :: Heroe
-- damian = UnHeroe{nombre = "Damian", horasEntrenamiento = 200}

-- presionGolpe :: Heroe -> Objeto -> Presion
-- presionGolpe heroe objeto = poderGolpe heroe `div` fortalezaObjeto objeto

-- poderGolpe :: Heroe -> Poder
-- poderGolpe heroe = 15 * horasEntrenamiento heroe

-- fortalezaObjeto :: Objeto -> Fortaleza
-- fortalezaObjeto objeto = 2 * length objeto