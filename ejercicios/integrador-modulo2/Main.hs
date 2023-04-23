{-# OPTIONS_GHC -Wno-missing-fields #-}
import Text.Show.Functions

-- Tipos parcial
type Materia = String
type Cantidad = Int

data Parcial = Parcial {
  materia :: Materia,
  cantidadPreguntas :: Cantidad
} deriving Show

-- Tipos alumnos
type Nombre = String
type FechaNacimiento = (Int, Int, Int)
type Legajo = Int
type MateriasCursando = [String]
type CriterioEstudio = Parcial -> Bool


data Alumno = Alumno {
  nombre :: Nombre,
  fechaNacimiento :: FechaNacimiento,
  legajo :: Legajo,
  materiaCursando :: MateriasCursando,
  criterioEstudio :: CriterioEstudio
} deriving (Show)

-- Estudia siempre
estudioso :: CriterioEstudio
estudioso _ = True

-- Estudian si el parcial tiene más de n preguntas
hijoDelRigor :: Int -> CriterioEstudio
hijoDelRigor n (Parcial _ cantidadPreguntas)= cantidadPreguntas > n

-- Estudian si la materia tiene una cantidad impar de letras. 
cabuleros :: CriterioEstudio
cabuleros (Parcial materia _) = odd (length materia)

nico = Alumno {
  fechaNacimiento = (10, 3, 1998),
  nombre = "Nico",
  materiaCursando = ["sysop", "proyecto"],
  criterioEstudio = estudioso,
  legajo = 124124
}

cambiarCriterioEstudio :: CriterioEstudio -> Alumno -> Alumno
cambiarCriterioEstudio nuevoCriterio alumno = alumno {criterioEstudio = nuevoCriterio}

estudia :: Parcial -> Alumno -> Bool
estudia parcial alumno = criterioEstudio alumno parcial