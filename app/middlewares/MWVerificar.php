<?php

use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Server\RequestHandlerInterface as RequestHandler;
use Slim\Psr7\Response as ResponseMW;

require_once './middlewares/AutentificadorJWT.php';

class MWVerificar
{
    private $rol;

    public function __construct($rol)
    {
        $this->rol = $rol;
    }

    public function __invoke(Request $request, RequestHandler $handler)
    {
        $response = new ResponseMW();
        try {
            $token = '';
            $cookies = $request->getCookieParams();

            if (isset($cookies['jwt_token'])) {
                $token = $cookies['jwt_token'];
            }

            if (empty($token)) {
                throw new Exception("Acceso denegado, se requiere un token de autenticación");
            }

            AutentificadorJWT::VerificarToken($token);
            $datosToken = AutentificadorJWT::ObtenerData($token);

            if ($datosToken->rol == $this->rol || $datosToken->rol == "socio" || $this->rol == "todos") {
                $response = $handler->handle($request);
                $response = $response->withStatus(200);
            } else {
                throw new Exception("Acceso denegado");
            }
        } catch (Exception $e) {
            $response = $response->withStatus(401);
            $response->getBody()->write($e->getMessage());
        }

        return $response->withHeader('Content-Type', 'application/json');
    }
}
