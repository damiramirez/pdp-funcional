module Library where
-- import PdePreludat
type Number = Int

pesoPino :: Number -> Number
pesoPino altura 
    | altura <= 300 = 3 * altura
    | altura > 300 = 2 * altura
    -- otherwhise?

esPesoUtil :: Number -> Bool
esPesoUtil peso = peso >= 400 && peso <= 1000

sirvePino :: Number -> Bool
sirvePino altura = pesoPino altura >= 400 && pesoPino altura <= 1000

costoTransporte :: Number -> Number
costoTransporte altura 
    | pesoPino altura < 500 && sirvePino altura = 5000
    | pesoPino altura >= 500 && pesoPino altura < 800 && sirvePino altura = 10 * pesoPino altura
    | pesoPino altura >= 800 && sirvePino altura = (10 * pesoPino altura) + altura
    | otherwise = 0 -- Iria una excepcion