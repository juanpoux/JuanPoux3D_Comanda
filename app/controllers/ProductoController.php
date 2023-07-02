<?php
require_once './models/Producto.php';
require_once './interfaces/IApiUsable.php';

class ProductoController extends Producto implements IApiUsable
{
  public function CargarUno($request, $response, $args)
  {
    $parametros = $request->getParsedBody();

    $nombre = $parametros['nombre'];
    $tipo = $parametros['tipo'];
    $precio = $parametros['precio'];
    $rol = $parametros['rol'];

    // Creamos el Producto
    $prod = new Producto();
    $prod->nombre = $nombre;
    $prod->tipo = $tipo;
    $prod->precio = $precio;
    $prod->rol = $rol;
    $prod->crearProducto();

    $payload = json_encode(array("mensaje" => "Producto creado con exito"));

    $response->getBody()->write($payload);
    return $response
      ->withHeader('Content-Type', 'application/json');
  }

  public function TraerUno($request, $response, $args)
  {
    // Buscamos producto por id
    $prod = $args['producto'];
    $producto = Producto::obtenerProducto($prod);
    $payload = json_encode($producto);

    $response->getBody()->write($payload);
    return $response->withHeader('Content-Type', 'application/json');
  }

  public function TraerTodos($request, $response, $args)
  {
    $lista = Producto::obtenerTodos();
    $payload = json_encode(array("listaProductos" => $lista));

    $response->getBody()->write($payload);
    return $response
      ->withHeader('Content-Type', 'application/json');
  }

  public function ModificarUno($request, $response, $args)
  {
    $parametros = $request->getParsedBody();
    var_dump($parametros);

    $payload = json_encode(array("mensaje" => "Producto modificado con exito"));

    $response->getBody()->write($payload);
    return $response
      ->withHeader('Content-Type', 'application/json');
  }

  public function BorrarUno($request, $response, $args)
  {
    $parametros = $request->getParsedBody();

    $productoId = $parametros['productoId'];
    Producto::borrarProducto($productoId);

    $payload = json_encode(array("mensaje" => "Producto borrado con exito"));

    $response->getBody()->write($payload);
    return $response
      ->withHeader('Content-Type', 'application/json');
  }

  public function DescargarCSV($request, $response, $args)
  {
    $lista = Producto::obtenerTodos();
    GuardarCSV($lista, "productos") ? $mensaje = "Archivo guardado con éxito" : $mensaje = "No sé pudo generar el CSV";
    $payload = json_encode(array("mensaje" => $mensaje, "listaProductos" => $lista));

    $response->getBody()->write($payload);
    return $response
      ->withHeader('Content-Type', 'application/json');
  }
}
