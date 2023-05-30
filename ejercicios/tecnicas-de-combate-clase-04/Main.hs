type HorasEntrenamiento = Int
type Poder = Int
type Objetivo = String
type Fortaleza = Int
type Presion = Int

poderGolpe :: HorasEntrenamiento -> Poder
poderGolpe = (* 15)

fortalezaObjetivo :: Objetivo -> Fortaleza
fortalezaObjetivo = (* 2) . length

presionGolpe :: HorasEntrenamiento -> Objetivo -> Poder
presionGolpe horasEntrenamiento objetivo = poderGolpe horasEntrenamiento `div` fortalezaObjetivo objetivo

gomuGomuElephantGatling :: Objetivo -> Presion
gomuGomuElephantGatling = presionGolpe 180

golpesNormalesConsecutivos :: Objetivo -> Presion
golpesNormalesConsecutivos = presionGolpe 240

esDificil :: Objetivo -> Bool
esDificil = (< 100) . gomuGomuElephantGatling

esAccesible :: Objetivo -> Bool
esAccesible = between 200 400 . golpesNormalesConsecutivos . focalizar

between :: Int -> Int -> Int -> Bool
between menor mayor nro = nro > menor && nro < mayor

focalizar :: Objetivo -> Objetivo
focalizar = take 7

-- type Nombre = String
-- type Poder = Int
-- type Horas = Int
-- type Fortaleza = Int
-- type Presion = Int
-- type Objeto = String

-- data Golpe = UnGolpe {
--   nombre :: Nombre,
--   horasEntrenamiento :: Horas
-- } deriving (Show)

-- kame :: Golpe
-- kame = UnGolpe{nombre = "KameHameHa", horasEntrenamiento = 200}

-- gomu :: Golpe
-- gomu = UnGolpe{nombre = "gomu gomu elephant gatling", horasEntrenamiento = 180}

-- golpesConsecutivos :: Golpe
-- golpesConsecutivos = UnGolpe{nombre = "golpes normales consecutivos", horasEntrenamiento = 240}

-- poderGolpe :: Golpe -> Poder
-- poderGolpe golpe = 15 * horasEntrenamiento golpe

-- fortalezaObjeto :: Objeto -> Fortaleza
-- fortalezaObjeto objeto = 2 * length objeto

-- presionGolpe :: Golpe -> Objeto -> Presion
-- presionGolpe golpe objeto = poderGolpe golpe `div` fortalezaObjeto objeto

-- esObjetivoDificil :: Objeto -> Bool
-- esObjetivoDificil objeto = presionGolpe gomu objeto < 100

-- esObjetivoAccesible :: Objeto -> Bool
-- esObjetivoAccesible objeto = presionGolpe golpesConsecutivos (focalizarObjeto objeto) > 200 && presionGolpe golpesConsecutivos (focalizarObjeto objeto) < 400

-- focalizarObjeto :: Objeto -> Nombre
-- focalizarObjeto = take 7
