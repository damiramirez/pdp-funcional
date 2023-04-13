cantidadEmpleados :: String -> Int
cantidadEmpleados empresa
  | empresa == "Acme" = 10
  | esUltimaLetraMenorQuePrimera empresa = cantidadLetrasIntermedias empresa
  | esCapicua empresa && esCantidadLetrasPar empresa = cantidadLetrasIntermedias empresa * 2
  | esCadenaDivisiblesPor3y7 empresa = 3
  | otherwise = 0

esUltimaLetraMenorQuePrimera :: String -> Bool
esUltimaLetraMenorQuePrimera cadena = head cadena > last cadena

esCapicua :: String -> Bool
esCapicua cadena = cadena == reverse cadena

esCantidadLetrasPar :: String -> Bool
esCantidadLetrasPar cadena = even (length cadena)

esCadenaDivisiblesPor3y7 :: String -> Bool
esCadenaDivisiblesPor3y7 cadena = cadenaDivisible cadena 3 || cadenaDivisible cadena 7

cadenaDivisible :: String -> Int -> Bool
cadenaDivisible cadena div = mod (length cadena) div == 0 

cantidadLetrasIntermedias :: String -> Int
cantidadLetrasIntermedias cadena = length cadena - 2