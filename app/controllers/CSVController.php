<?php
require_once './models/Mesa.php';
require_once './models/Usuario.php';
require_once './models/Pedido.php';
require_once './models/Producto.php';
require_once './models/Archivos.php';

class CsvController
{
    public function CargaForzada($request, $response, $args)
    {
        $payload = "Hubo un error al leer el archivo CSV";
        $filtro = $args['filtro'];
        $lista = LeerCSV();
        $retornoCarga = 0;
        $cantidadElementosLista = 0;

        if (isset($lista)) {
            $cantidadElementosLista = count($lista);
            $payload = "No se pudo cargar ningun dato de tipo $filtro puede ser que el archivo no sea el correcto o que los datos ya existan en la base de datos";
            $filtro = strtolower($filtro);
            switch ($filtro) {
                case "usuarios":
                    $retornoCarga = Usuario::CargaForzada($lista);
                    break;

                case "pedidos":
                    $retornoCarga = Pedido::CargaForzada($lista);
                    break;

                    // case "productos":
                    //     $retornoCarga = Producto::CargaForzada($lista);
                    //     break;

                    // case "mesas":
                    //     $retornoCarga = Mesa::CargaForzada($lista);
                    //     break;

                default:
                    $payload = false;
                    break;
            }

            if ($payload != false) {
                if ($retornoCarga > 0) {
                    $payload = "Se cargaron datos de $filtro  Se cargaron con exito $retornoCarga de $cantidadElementosLista $filtro";
                } else {
                    $payload = "No se pudo cargar ningún un dato de $filtro";
                }
            }
        }

        $response->getBody()->write($payload);
        return $response
            ->withHeader('Content-Type', 'application/json');
    }
}
