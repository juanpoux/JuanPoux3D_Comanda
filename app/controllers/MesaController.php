<?php
require_once './models/Mesa.php';
require_once './interfaces/IApiUsable.php';

class MesaController extends Mesa implements IApiUsable
{
  public function CargarUno($request, $response, $args)
  {
    $parametros = $request->getParsedBody();

    $codigo = $parametros['codigo'];

    // Creamos La mesa
    $mesa = new Mesa();
    $mesa->estado = "Con cliente esperando el pedido";
    $mesa->codigo = $codigo;
    $mesa->fechaCreacion = date('Y-m-d H:i:s');
    $mesa->crearMesa();

    $payload = json_encode(array("mensaje" => "Mesa creada con exito"));

    $response->getBody()->write($payload);
    return $response
      ->withHeader('Content-Type', 'application/json');
  }

  public function TraerUno($request, $response, $args)
  {
    // Buscamos producto por id
    $id = $args['mesa'];
    $mesa = Mesa::obtenerMesa($id);
    $payload = json_encode($mesa);

    $response->getBody()->write($payload);
    return $response->withHeader('Content-Type', 'application/json');
  }

  public function TraerTodos($request, $response, $args)
  {
    $lista = Mesa::obtenerTodos();
    $payload = json_encode(array("listaMesas" => $lista));

    $response->getBody()->write($payload);
    return $response
      ->withHeader('Content-Type', 'application/json');
  }

  public function ModificarUno($request, $response, $args)
  {
    $parametros = $request->getParsedBody();
    $codigoMesa = $parametros['codigoMesa'];
    $estado = $parametros['estado'];

    $payload = json_encode("la mesa ya se encuentra con el estado solicitado");

    $mesa = Mesa::obtenerMesaPorCodigo($codigoMesa);
    if ($mesa->estado != $estado) {
      $payload = json_encode("Estado de la mesa cambiado exitosamente. Ahora se encuentra $estado");
      $mesa->estado = $estado;
      Mesa::modificarMesa($mesa);
    }

    $response->getBody()->write($payload);
    return $response
      ->withHeader('Content-Type', 'application/json');
  }

  public function BorrarUno($request, $response, $args)
  {
    $parametros = $request->getParsedBody();

    $mesaId = $parametros['mesaId'];
    Mesa::borrarMesa($mesaId);

    $payload = json_encode(array("mensaje" => "Mesa borrada con exito"));

    $response->getBody()->write($payload);
    return $response
      ->withHeader('Content-Type', 'application/json');
  }
}
