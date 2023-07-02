<?php
require_once './models/Usuario.php';
require_once './models/Log.php';
require_once './models/Encuesta.php';
require_once './models/Mesa.php';
require_once './models/Pedido.php';
require_once './middlewares/AutentificadorJWT.php';
require_once './interfaces/IApiUsable.php';

class EncuestaController extends Encuesta implements IApiUsable
{
    public function CargarUno($request, $response, $args)
    {
        $parametros = $request->getParsedBody();
        $status = 401;

        $codigoMesa = $parametros['codigoMesa'];
        $codigoPedido = $parametros['codigoPedido'];
        $notaMesa = $parametros['notaMesa'];
        $notaRestaurante = $parametros['notaRestaurante'];
        $notaCocinero = $parametros['notaCocinero'];
        $notaMozo = $parametros['notaMozo'];
        $comentario = $parametros['comentario'];
        $payload = json_encode(array("mensaje" => "Pedido ya calificado"));

        $pedido = Pedido::obtenerPedidoPorCodigo($codigoPedido);
        $mesa = Mesa::obtenerMesaPorCodigo($codigoMesa);

        $encuesta = Encuesta::obtenerEncuestaPorCodigoMesaYPedido($codigoMesa, $codigoPedido);
        if (!$encuesta) {
            $payload = json_encode(array("mensaje" => "Mesa o pedido inexistente"));

            if ($pedido && $mesa) {
                $encuesta = new Encuesta();

                $encuesta->codigoMesa = $codigoMesa;
                $encuesta->codigoPedido = $codigoPedido;
                $encuesta->notaMesa = $notaMesa;
                $encuesta->notaRestaurante = $notaRestaurante;
                $encuesta->notaCocinero = $notaCocinero;
                $encuesta->notaMozo = $notaMozo;
                $encuesta->comentario = $comentario;

                $encuesta->crearEncuesta();

                $status = 200;
                $payload = json_encode(array("OK" => "Creación de encuesta exitosa"));
            }
        }

        $response->getBody()->write($payload);

        return $response->withStatus($status)
            ->withHeader('Content-Type', 'application/json');
    }


    public function TraerUno($request, $response, $args)
    {
        // $enc = $args['encuesta'];
        // $payload = json_encode(array("encuesta"));
        // $response->getBody()->write($payload);
        // return $response
        //     ->withHeader('Content-Type', 'application/json');
    }

    public function TraerTodos($request, $response, $args)
    {
        $lista = Encuesta::obtenerTodos();
        $payload = json_encode(array("listaEncuesta" => $lista));

        $response->getBody()->write($payload);
        return $response
            ->withHeader('Content-Type', 'application/json');
    }

    public function TraerMejores($request, $response, $args)
    {
        $lista = Encuesta::obtenerMejores();
        $payload = json_encode(array("listaEncuesta" => $lista));
        $response->getBody()->write($payload);

        return $response
            ->withHeader('Content-Type', 'application/json');
    }

    public function ModificarUno($request, $response, $args)
    {
        // $status = 404;
        // $payload = json_encode(array("mensaje" => "No encontrado"));

        // $response->getBody()->write($payload);
        // return $response
        //     ->withStatus($status)
        //     ->withHeader('Content-Type', 'application/json');
    }

    public function BorrarUno($request, $response, $args)
    {
        // $status = 404;
        // $payload = json_encode(array("mensaje" => "No encontrado"));

        // $response->getBody()->write($payload);
        // return $response
        //     ->withStatus($status)
        //     ->withHeader('Content-Type', 'application/json');
    }
}
