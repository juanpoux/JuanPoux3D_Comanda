<?php

class Pedido
{
    public $id;
    public $idUsuario;
    public $codigoMesa;
    public $codigo;
    public $estado;
    public $inicio;
    public $final;


    public static function generarCodigoAlfanumerico()
    {
        $caracteres = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $longitud = 5;
        $codigo = '';

        for ($i = 0; $i < $longitud; $i++) {
            $codigo .= $caracteres[rand(0, strlen($caracteres) - 1)];
        }

        return $codigo;
    }

    public function crearPedido()
    {
        $objAccesoDatos = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDatos->prepararConsulta("INSERT INTO pedidos (idUsuario, codigo, codigoMesa, estado, inicio, final) VALUES (:idUsuario, :codigo, :codigoMesa, :estado, :inicio, :final)");
        $consulta->bindValue(':idUsuario', $this->idUsuario, PDO::PARAM_INT);
        $consulta->bindValue(':codigo', $this->codigo, PDO::PARAM_STR);
        $consulta->bindValue(':codigoMesa', $this->codigoMesa, PDO::PARAM_STR);
        $consulta->bindValue(':estado', $this->estado, PDO::PARAM_STR);
        $consulta->bindValue(':inicio', $this->inicio, PDO::PARAM_INT);
        $consulta->bindValue(':final', $this->final, PDO::PARAM_STR);
        $consulta->execute();

        return $objAccesoDatos->obtenerUltimoId();
    }

    public static function obtenerTodos()
    {
        $objAccesoDatos = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDatos->prepararConsulta("SELECT id, idUsuario, codigo, codigoMesa, estado, inicio, final FROM pedidos");
        $consulta->execute();

        return $consulta->fetchAll(PDO::FETCH_CLASS, 'Pedido');
    }

    public static function obtenerTodosPorEstado($estado)
    {
        $objAccesoDatos = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDatos->prepararConsulta("SELECT id, idUsuario, codigo, codigoMesa, estado, inicio, final FROM pedidos WHERE estado = :estado");
        $consulta->bindValue(':estado', $estado, PDO::PARAM_STR);
        $consulta->execute();

        return $consulta->fetchAll(PDO::FETCH_CLASS, 'Pedido');
    }

    public static function obtenerPedido($codigo)
    {
        $objAccesoDatos = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDatos->prepararConsulta("SELECT id, idUsuario, codigo, codigoMesa, estado, inicio, final FROM pedidos WHERE codigo = :codigo");
        $consulta->bindValue(':codigo', $codigo, PDO::PARAM_STR);
        $consulta->execute();

        return $consulta->fetchObject('Pedido');
    }

    public static function obtenerPedidoPorId($id)
    {
        $objAccesoDatos = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDatos->prepararConsulta("SELECT id, idUsuario, codigo, codigoMesa, estado, inicio, final FROM pedidos WHERE id = :id");
        $consulta->bindValue(':id', $id, PDO::PARAM_INT);
        $consulta->execute();

        return $consulta->fetchObject('Pedido');
    }

    public static function obtenerPedidoPorCodigo($codigo)
    {
        $objAccesoDatos = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDatos->prepararConsulta("SELECT id, idUsuario, codigo, codigoMesa, estado, inicio, final FROM pedidos WHERE codigo = :codigo");
        $consulta->bindValue(':codigo', $codigo, PDO::PARAM_STR);
        $consulta->execute();

        return $consulta->fetchAll(PDO::FETCH_CLASS, 'Pedido');
    }

    public static function obtenerPedidoActivoPorCodigoMesa($codigoMesa)
    {
        $estadoTerminado = "finalizado";
        $objAccesoDatos = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDatos->prepararConsulta("SELECT id, idUsuario, codigo, codigoMesa, estado, inicio, final FROM pedidos WHERE codigoMesa = :codigoMesa AND estado NOT LIKE :estadoTerminado");
        $consulta->bindValue(':codigoMesa', $codigoMesa, PDO::PARAM_STR);
        $consulta->bindValue(':estadoTerminado', $estadoTerminado, PDO::PARAM_STR);
        $consulta->execute();

        return $consulta->fetchObject('Pedido');
    }

    public static function obtenerPedidoProductoPorCodigoYProdId($codigo, $idProducto)
    {
        $objAccesoDatos = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDatos->prepararConsulta("SELECT codigoPedido, idProducto, estado FROM pedidoproducto WHERE codigoPedido = :codigo AND idProducto = :idProducto");
        $consulta->bindValue(':codigo', $codigo, PDO::PARAM_STR);
        $consulta->bindValue(':idProducto', $idProducto, PDO::PARAM_INT);
        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_ASSOC);
    }

    public static function obtenerPedidoProductoPorCodigo($codigo)
    {
        $objAccesoDatos = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDatos->prepararConsulta("SELECT codigoPedido, idProducto, cantidad, estado FROM pedidoproducto WHERE codigoPedido = :codigoPedido");
        $consulta->bindValue(':codigoPedido', $codigo, PDO::PARAM_STR);
        $consulta->execute();

        return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function obtenerPedidoProductoConFechasPorCodigo($codigo, $idProducto)
    {
        $objAccesoDatos = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDatos->prepararConsulta("SELECT * FROM pedidoproducto WHERE codigoPedido = :codigo AND idProducto = :idProducto");
        $consulta->bindValue(':codigo', $codigo, PDO::PARAM_STR);
        $consulta->bindValue(':idProducto', $idProducto, PDO::PARAM_INT);
        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_ASSOC);
    }

    public static function obtenerPedidosProductosPorProd($cadenaIds)
    {
        $objAccesoDatos = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDatos->prepararConsulta("SELECT codigoPedido, idProducto, estado FROM pedidoproducto WHERE idProducto IN ($cadenaIds)");
        $consulta->execute();
        return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function cargarPedido($codigoPedido, $idProducto, $cantidad)
    {
        $pedido = Pedido::ObtenerPedido($codigoPedido);
        $producto = Producto::ObtenerProducto($idProducto);
        if ($pedido != false && $producto != false) {
            $objetoAccesoDato = AccesoDatos::obtenerInstancia();
            $consulta = $objetoAccesoDato->prepararConsulta("INSERT into pedidoproducto (codigoPedido, idProducto, cantidad, inicio, final, estado)values(:codigoPedido, :idProducto, :cantidad, NULL, NULL, :estado)");
            $consulta->bindValue(':codigoPedido', $codigoPedido, PDO::PARAM_STR);
            $consulta->bindValue(':idProducto', $idProducto, PDO::PARAM_INT);
            $consulta->bindValue(':cantidad', $cantidad, PDO::PARAM_INT);
            $consulta->bindValue(':estado', "pendiente", PDO::PARAM_STR);
            $consulta->execute();
        }
    }

    public static function modificarPedido($pedido)
    {
        $objAccesoDatos = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDatos->prepararConsulta("UPDATE pedidos SET idUsuario = :idUsuario, codigo = :codigo, codigoMesa = :codigoMesa, estado = :estado, inicio = :inicio, final = :final WHERE id = :id");
        $consulta->bindValue(':idUsuario', $pedido->idUsuario, PDO::PARAM_INT);
        $consulta->bindValue(':codigo', $pedido->codigo, PDO::PARAM_STR);
        $consulta->bindValue(':codigoMesa', $pedido->codigoMesa, PDO::PARAM_STR);
        $consulta->bindValue(':estado', $pedido->estado, PDO::PARAM_STR);
        $consulta->bindValue(':inicio', $pedido->inicio, PDO::PARAM_INT);
        $consulta->bindValue(':final', $pedido->final, PDO::PARAM_STR);
        $consulta->bindValue(':id', $pedido->id, PDO::PARAM_INT);
        $consulta->execute();
    }

    public static function aplicarFiltros($pedidos, $filtro)
    {
        if ($filtro == "pendiente") {
            $pedidos = array_filter($pedidos, function ($ped) {
                return $ped['estado'] == "pendiente";
            });
        }

        return $pedidos;
    }

    public static function actualizarEstadoYFinalPedidoProducto($codigoPedido, $idProducto, $estado, $tiempoPrep)
    {
        $inicio = date('Y-m-d H:i:s');

        $sumaMinutos = ' +' . $tiempoPrep . ' minutes';
        $final = date('Y-m-d H:i:s', strtotime($inicio . $sumaMinutos));

        $objAccesoDatos = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDatos->prepararConsulta("UPDATE pedidoproducto SET estado = :estado, inicio = :inicio, final = :final WHERE codigoPedido = :codigoPedido AND idProducto = :idProducto");
        $consulta->bindValue(':codigoPedido', $codigoPedido, PDO::PARAM_STR);
        $consulta->bindValue(':idProducto', $idProducto, PDO::PARAM_INT);
        $consulta->bindValue(':estado', $estado, PDO::PARAM_STR);
        $consulta->bindValue(':inicio', $inicio, PDO::PARAM_STR);
        $consulta->bindValue(':final', $final, PDO::PARAM_STR);
        $consulta->execute();
        return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function actualizarEstadoPedidoProducto($codigoPedido, $idProducto, $estado)
    {
        $objAccesoDatos = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDatos->prepararConsulta("UPDATE pedidoproducto SET estado = :estado WHERE codigoPedido = :codigoPedido AND idProducto = :idProducto");
        $consulta->bindValue(':codigoPedido', $codigoPedido, PDO::PARAM_STR);
        $consulta->bindValue(':idProducto', $idProducto, PDO::PARAM_INT);
        $consulta->bindValue(':estado', $estado, PDO::PARAM_STR);
        $consulta->execute();
        return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function actualizarEstadoPedidoProductoTodos($codigoPedido, $estado)
    {
        $objAccesoDatos = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDatos->prepararConsulta("UPDATE pedidoproducto SET estado = :estado WHERE codigoPedido = :codigoPedido AND idProducto = :idProducto");
        $consulta->bindValue(':codigoPedido', $codigoPedido, PDO::PARAM_STR);
        $consulta->bindValue(':estado', $estado, PDO::PARAM_STR);
        $consulta->execute();
        return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function actualizarEstadoPedido($codigoPedido, $estado)
    {
        $objAccesoDatos = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDatos->prepararConsulta("UPDATE pedidos SET estado = :estado WHERE codigoPedido = :codigoPedido");
        $consulta->bindValue(':codigoPedido', $codigoPedido, PDO::PARAM_STR);
        $consulta->bindValue(':estado', $estado, PDO::PARAM_STR);
        $consulta->execute();
        return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function obtenerDemoraPedidoProducto($pedido)
    {
        $fechaInicio = $pedido["inicio"];
        $fechaFinal = $pedido["final"];

        $datetime1 = new DateTime($fechaInicio);
        $datetime2 = new DateTime($fechaFinal);

        $interval = $datetime1->diff($datetime2);
        $minutos = $interval->format('%i');

        return $minutos;
    }

    public static function obtenerPedidosConDemora()
    {
        $objAccesoDatos = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDatos->prepararConsulta("SELECT codigoPedido, idProducto, estado, TIMESTAMPDIFF(MINUTE, inicio, final) AS demoraMinutos FROM pedidoproducto WHERE estado LIKE 'en preparacion'");
        $consulta->execute();

        return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function CargaForzada($pedidos)
    {
        $contador = 0;

        foreach ($pedidos as $pedido) {
            if (!Pedido::obtenerPedidoPorId($pedido->id)) {
                $pedidoAux = new pedido();
                $pedidoAux->id = $pedido->id;
                $pedidoAux->idUsuario = $pedido->idUsuario;
                $pedidoAux->codigo = $pedido->codigo;
                $pedidoAux->estado = $pedido->estado;
                $pedidoAux->inicio = $pedido->inicio;
                $pedidoAux->final = $pedido->final;

                $pedidoAux->crearPedido();
                $contador++;
            }
        }

        return $contador;
    }

    public static function verificarProductosListos($listaProductosPedidos)
    {
        $retorno = true;
        foreach ($listaProductosPedidos as $producto) {
            if ($producto['estado'] != 'listo para servir') {
                $retorno = false;
                break;
            }
        }
        return $retorno;
    }
}
