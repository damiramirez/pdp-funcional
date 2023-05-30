type Pizza = String
type Porciones = Int
type Pedido = (Pizza, Porciones)
type PizzaEntera = Int

esDeMuzza :: Pedido -> Bool
esDeMuzza = (== "muzza") . fst

lasDeMuzzaEnPedido :: [Pedido] -> [Pedido]
lasDeMuzzaEnPedido = filter esDeMuzza

porciones :: [Pedido] -> Porciones
porciones = sum . map snd
-- porciones pedido = sum (map snd pedido)

cantidadPizzas :: Porciones -> PizzaEntera
cantidadPizzas = ceiling.(/8)

cuantasMuzzas :: [Pedido] -> PizzaEntera
cuantasMuzzas = cantidadPizzas . porciones . lasDeMuzzaEnPedido