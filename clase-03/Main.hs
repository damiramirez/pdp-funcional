-- Cliente
type Nombre = String
type Deuda = Float
type Factura = Float
type Facturas = [Factura]

data Cliente = UnCliente {
  nombre :: Nombre,
  deuda :: Deuda,
  facturas :: Facturas
} deriving (Show)

clientes = [
  UnCliente "Biassuto" 6000 [4000, 5000],
  UnCliente "Colombatti" 15000 [30000],
  UnCliente "Marabotto" 200 [500000, 140000]
 ]

