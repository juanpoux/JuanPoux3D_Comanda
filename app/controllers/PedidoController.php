<?php
require_once './models/Pedido.php';
require_once './models/Producto.php';
require_once './models/Usuario.php';
require_once './models/Mesa.php';
require_once './models/Archivos.php';
require_once './interfaces/IApiUsable.php';

class PedidoController extends Pedido implements IApiUsable
{
  public function CrearUno($request, $response, $args)
  {
    $parametros = $request->getParsedBody();

    $cookies = $request->getCookieParams();
    $idUsuario = Usuario::getLoggedUsrID($cookies);

    $codigoMesa = $parametros['codigoMesa'];
    $mesa = Mesa::obtenerMesaPorCodigo($codigoMesa);
    $payload = json_encode(array("mensaje" => "No hay mesas con el código solicitado."));

    if ($mesa) {
      $pedido = new Pedido();
      $pedido->idUsuario = $idUsuario;
      $pedido->codigo = Pedido::generarCodigoAlfanumerico();
      $pedido->codigoMesa = $codigoMesa;
      $pedido->estado = "En preparacion";
      $pedido->inicio = date('Y-m-d H:i:s');

      $pedido->crearPedido();

      $payload = json_encode(array("mensaje" => "Pedido con el codigo $pedido->codigo creado con exito. "));
    }


    $response->getBody()->write($payload);
    return $response
      ->withHeader('Content-Type', 'application/json');
  }

  public function CargarUno($request, $response, $args)
  {
    $parametros = $request->getParsedBody();

    $idProducto = $parametros['idProducto'];
    $cantidad = $parametros['cantidad'];
    $codigoPedido = $args['codigoPedido'];
    $payload = json_encode(array("mensaje" => "el producto ya se encuentra cargado al pedido"));

    $pedido = Pedido::obtenerPedidoPorCodigo($codigoPedido);
    $prod = Producto::obtenerProducto($idProducto);
    $pedProd = Pedido::obtenerPedidoProductoPorCodigoYProdId($codigoPedido, $idProducto);
    if (!$pedProd) {
      $payload = json_encode(array("mensaje" => "No hay pedidos con el código o no existe el producto"));

      if ($pedido && $prod) {
        Pedido::cargarPedido($codigoPedido, $idProducto, $cantidad);
        $payload = json_encode(array("mensaje" => "Pedido cargado con exito. "));
      }
    }

    $response->getBody()->write($payload);
    return $response
      ->withHeader('Content-Type', 'application/json');
  }

  public function TraerUno($request, $response, $args)
  {
    $codigo = $args['pedido'];
    $pedido = Pedido::obtenerPedido($codigo);
    $payload = json_encode($pedido);

    $response->getBody()->write($payload);
    return $response->withHeader('Content-Type', 'application/json');
  }

  public function TraerTodos($request, $response, $args)
  {
    $lista = Pedido::obtenerTodos();
    $payload = json_encode(array("listaPedidos" => $lista));

    $response->getBody()->write($payload);
    return $response
      ->withHeader('Content-Type', 'application/json');
  }

  public function TraerPedidosListos($request, $response, $args)
  {
    $lista = Pedido::obtenerTodosPorEstado("listo para servir");
    $payload = json_encode(array("listaPedidos" => $lista));

    $response->getBody()->write($payload);
    return $response
      ->withHeader('Content-Type', 'application/json');
  }

  public function TraerTodosPorCodigo($request, $response, $args)
  {
    $codigo = $args['pedido'];
    $lista = Pedido::obtenerPedidoPorCodigo($codigo);
    $payload = json_encode(array("listaPedidos" => $lista));

    $response->getBody()->write($payload);
    return $response
      ->withHeader('Content-Type', 'application/json');
  }

  public function ModificarUno($request, $response, $args)
  {
    $parametros = $request->getParsedBody();
    return $response
      ->withHeader('Content-Type', 'application/json');
  }

  public function BorrarUno($request, $response, $args)
  {
    $parametros = $request->getParsedBody();

    $mesaId = $parametros['mesaId'];

    $payload = json_encode(array("mensaje" => "Mesa borrada con exito"));

    $response->getBody()->write($payload);
    return $response
      ->withHeader('Content-Type', 'application/json');
  }

  public function SubirFoto($request, $response, $args)
  {
    $codigoPedido = $args['codigoPedido'];

    Archivos::subirArchivo("./FotosMesas/", $codigoPedido);

    $payload = json_encode(array("mensaje" => "Foto cargada con con éxito. "));

    $response->getBody()->write($payload);
    return $response
      ->withHeader('Content-Type', 'application/json');
  }

  public function TraerTodosProductosPedidos($request, $response, $args)
  {
    $filtro = $args['filtro'];

    $cookies = $request->getCookieParams();
    $idUsuario = Usuario::getLoggedUsrID($cookies);
    $usr = Usuario::obtenerUsuarioPorId($idUsuario);
    $productos = Producto::obtenerProductosPorRol($usr->rol);

    $ids = [];
    foreach ($productos as $producto) {
      $ids[] = $producto->id;
    }

    $cadenaIds = implode(',', $ids);
    $pedidos = Pedido::obtenerPedidosProductosPorProd($cadenaIds);
    $pedidosFiltrados = Pedido::aplicarFiltros($pedidos, $filtro);

    $payload = json_encode(array("listaPedidos" => $pedidosFiltrados));

    $response->getBody()->write($payload);
    return $response
      ->withHeader('Content-Type', 'application/json');
  }

  public function CambiarEstadoProd($request, $response, $args)
  {
    $parametros = $request->getParsedBody();
    $estado = $parametros['estado'];
    $idProducto = $parametros['idProducto'];
    $codigoPedido = $parametros['codigoPedido'];
    $tiempoPrep = $parametros["tiempoPrep"];
    $pedido = Pedido::obtenerPedidoProductoPorCodigoYProdId($codigoPedido, $idProducto);

    $prod = Producto::obtenerProducto($idProducto);
    $cookies = $request->getCookieParams();
    $idUsuario = Usuario::getLoggedUsrID($cookies);
    $usr = Usuario::obtenerUsuarioPorId($idUsuario);

    $payload = json_encode(array("OK" => "El rol del usuario ($usr->rol) no coincide con el del producto ($prod->rol)"));
    if ($prod->rol == $usr->rol) {

      $payload = json_encode(array("OK" => "No se encuentra el pedido solicitado"));
      if ($pedido && $prod) {
        $payload = json_encode(array("OK" => "No se realizó el cambio porque el pedido ya se encuentra en el estado $estado"));

        if ($pedido["estado"] != $estado) {
          if ($tiempoPrep > 0) {
            Pedido::actualizarEstadoYFinalPedidoProducto($codigoPedido, $idProducto, $estado, $tiempoPrep);
          } else {
            echo 1;
            Pedido::actualizarEstadoPedidoProducto($codigoPedido, $idProducto, $estado);
            $ped = Pedido::obtenerPedidoProductoPorCodigoYEstado($codigoPedido, "en preparacion");
            if (!$ped) {
              Pedido::actualizarEstadoPedido($codigoPedido, "listo para servir");
            }
          }
          $payload = json_encode(array("OK" => "Estado actualizado"));
        }
      }
    }

    $response->getBody()->write($payload);
    return $response
      ->withHeader('Content-Type', 'application/json');
  }

  public function TraerDemora($request, $response, $args)
  {
    $codigoMesa = $args['codigoMesa'];
    $codigoPedido = $args['codigoPedido'];

    $payload = json_encode(array("mensaje" => "No se encuentra pedido con el código solicitado"));
    $mesa = Mesa::obtenerMesaPorCodigo($codigoMesa);
    $pedido = Pedido::obtenerPedidoPorCodigo($codigoPedido);
    if ($pedido && $mesa) {
      $pedidos = Pedido::obtenerPedidosConDemoraPorCodigoPedido($codigoPedido);
      $payload = json_encode(array("listaPedidos" => $pedidos));
    }

    $response->getBody()->write($payload);
    return $response
      ->withHeader('Content-Type', 'application/json');
  }

  public function TraerPedidosConDemora($request, $response, $args)
  {
    $pedidos = Pedido::obtenerPedidosConDemora();

    $payload = json_encode(array("listaPedidos" => $pedidos));

    $response->getBody()->write($payload);
    return $response
      ->withHeader('Content-Type', 'application/json');
  }

  public function DescargarCSV($request, $response, $args)
  {
    $lista = Pedido::obtenerTodos();
    GuardarCSV($lista, "pedidos") ? $mensaje = "Archivo guardado con éxito" : $mensaje = "No sé pudo generar el CSV";
    $payload = json_encode(array("mensaje" => $mensaje, "listaPedidos" => $lista));

    $response->getBody()->write($payload);
    return $response
      ->withHeader('Content-Type', 'application/json');
  }

  public function ServirUnPedido($request, $response, $args)
  {
    $parametros = $request->getParsedBody();
    $codigoPedido = $parametros['codigoPedido'];

    $listaProductosPedidos = Pedido::obtenerPedidoProductoPorCodigo($codigoPedido);
    if (!Pedido::verificarProductosListos($listaProductosPedidos)) {
      $payload = json_encode("En el pedido hay productos que todavía no están listos");
    } else {
      $pedido = Pedido::obtenerPedido($codigoPedido);
      $codigoMesa = $pedido->codigoMesa;
      $mesa = Mesa::obtenerMesaPorCodigo($codigoMesa);
      $mesa->estado = "con cliente comiendo";
      Mesa::modificarMesa($mesa);
      Pedido::actualizarEstadoPedidoProductoTodos($codigoPedido, "entregado");
      Pedido::actualizarEstadoPedido($codigoPedido, "entregado");
      $payload = json_encode("Pedido entregado");
    }

    $response->getBody()->write($payload);
    return $response
      ->withHeader('Content-Type', 'application/json');
  }

  public function CerrarMesaYPedido($request, $response, $args)
  {
    $parametros = $request->getParsedBody();
    $codigoMesa = $parametros['codigoMesa'];
    $payload = json_encode("La mesa ya se encuentra cerrada");

    $mesa = Mesa::obtenerMesaPorCodigo($codigoMesa);
    $estado = "cerrada";
    if ($mesa->estado != $estado) {
      $mesa->estado = $estado;
      Mesa::modificarMesa($mesa);

      $pedido = Pedido::obtenerPedidoActivoPorCodigoMesa($codigoMesa);
      $final = date('Y-m-d H:i:s');
      $pedido->final = $final;
      $pedido->estado = "finalizado";
      Pedido::modificarPedido($pedido);
      $payload = json_encode("Mesa cerrada exitosamente");
    }

    $response->getBody()->write($payload);
    return $response
      ->withHeader('Content-Type', 'application/json');
  }
}
