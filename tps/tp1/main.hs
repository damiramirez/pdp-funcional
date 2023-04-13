cantidadEmpleados :: String -> Int
cantidadEmpleados empresa
  | empresa == "Acme" = 10
  | ultimaLetraMenorQuePrimera empresa = length empresa - 2
  | esCapicua empresa && cantidadLetrasPar empresa = (length empresa - 2) * 2
  | letrasDivisiblesPor3y7 empresa = 3
  | otherwise = 0

ultimaLetraMenorQuePrimera :: String -> Bool
ultimaLetraMenorQuePrimera cadena = head cadena > last cadena

esCapicua :: String -> Bool
esCapicua cadena = cadena == reverse cadena

cantidadLetrasPar :: String -> Bool
cantidadLetrasPar cadena = even (length cadena)

letrasDivisiblesPor3y7 :: String -> Bool
letrasDivisiblesPor3y7 cadena = letrasDivisibles cadena 3 || letrasDivisibles cadena 7

letrasDivisibles :: String -> Int -> Bool
letrasDivisibles cadena div = mod (length cadena) div == 0 
