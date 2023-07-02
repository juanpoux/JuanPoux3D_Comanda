<?php

use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Server\RequestHandlerInterface as RequestHandler;
use Slim\Psr7\Response;

require_once "./models/Log.php";

class MWLogOperaciones
{
    public function __invoke(Request $request, RequestHandler $handler): Response
    {
        $response = $handler->handle($request);

        $path = $request->getUri()->getPath();
        $method = $request->getMethod();
        $statusCode = $response->getStatusCode();
        $idUsuario = -1;
        $info = "ok";

        try {
            $cookies = $request->getCookieParams();
            if (isset($cookies['jwt_token'])) {
                $idUsuario = Usuario::getLoggedUsrID($cookies);
            }
        } catch (Exception $ex) {
            $info = "Error: " . $ex->getMessage();
        } finally {
            $accion = $method . " - " .  $path;

            $log = new Log($idUsuario, $accion, $statusCode, $info);
            $log->crearLog();
        }
        return $response;
    }
}
