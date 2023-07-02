<?php
require_once './models/Usuario.php';
require_once './models/Log.php';
require_once './middlewares/AutentificadorJWT.php';
require_once './interfaces/IApiUsable.php';

class UsuarioController extends Usuario implements IApiUsable
{
  public function CargarUno($request, $response, $args)
  {
    $parametros = $request->getParsedBody();

    $nombre = $parametros['nombre'];
    $usuario = $parametros['usuario'];
    $clave = $parametros['clave'];
    $rol = $parametros['rol'];

    // Creamos el usuario
    $usr = new Usuario();
    $usr->nombre = $nombre;
    $usr->usuario = $usuario;
    $usr->clave = $clave;
    $usr->rol = $rol;
    $usr->crearUsuario();

    $payload = json_encode(array("mensaje" => "Usuario creado con exito"));

    $response->getBody()->write($payload);
    return $response
      ->withHeader('Content-Type', 'application/json');
  }

  public function TraerUno($request, $response, $args)
  {
    // Buscamos usuario por nombre
    $usr = $args['usuario'];
    $usuario = Usuario::obtenerUsuario($usr);
    $payload = json_encode($usuario);

    $response->getBody()->write($payload);
    return $response
      ->withHeader('Content-Type', 'application/json');
  }

  public function TraerTodos($request, $response, $args)
  {
    $lista = Usuario::obtenerTodos();
    $payload = json_encode(array("listaUsuario" => $lista));

    $response->getBody()->write($payload);
    return $response
      ->withHeader('Content-Type', 'application/json');
  }

  public function TraerTodosActivos($request, $response, $args)
  {
    $lista = Usuario::obtenerTodosActivos();
    $payload = json_encode(array("listaUsuario" => $lista));

    $response->getBody()->write($payload);
    return $response
      ->withHeader('Content-Type', 'application/json');
  }

  public function ModificarUno($request, $response, $args)
  {
    $status = 404;
    $payload = json_encode(array("mensaje" => "Usuario no encontrado"));

    $parametros = $request->getParsedBody();
    $id = $parametros['id'];
    $nombre = $parametros['nombre'];
    $usuario = $parametros['usuario'];
    $clave = $parametros['clave'];
    $rol = $parametros['rol'];
    $estado = $parametros['estado'];

    $usr = Usuario::obtenerUsuarioPorId($id);
    if ($usr) {
      $usrAux = new Usuario();
      $usrAux->id = $id;
      $usrAux->nombre = $nombre;
      $usrAux->usuario = $usuario;
      $usrAux->rol = $rol;
      $usrAux->estado = $estado;
      if ($clave == ""/* || password_verify($clave, $usr->clave) || $clave == $usr->clave*/) {
        $clave = $usr->clave;
      }
      $claveHash = password_hash($clave, PASSWORD_DEFAULT);
      $usrAux->clave = $claveHash;
      Usuario::modificarUsuario($usrAux);

      $status = 200;
      $payload = json_encode(array("mensaje" => "Usuario modificado con exito"));
    }

    $response->getBody()->write($payload);
    return $response
      ->withStatus($status)
      ->withHeader('Content-Type', 'application/json');
  }

  public function BorrarUno($request, $response, $args)
  {
    $status = 404;

    $payload = json_encode(array("mensaje" => "Usuario no encontrado"));
    $id = $args['id'];
    $user = Usuario::obtenerUsuarioPorId($id);
    if ($user) {
      $status = 200;
      Usuario::borrarUsuario($id);
      $payload = json_encode(array("mensaje" => "Usuario borrado con exito"));
    }


    $response->getBody()->write($payload);
    return $response
      ->withStatus($status)
      ->withHeader('Content-Type', 'application/json');
  }

  public function Login($request, $response, $args)
  {
    $params = $request->getParsedBody();
    $userName = $params['usuario'];
    $user = Usuario::obtenerUsuario($userName);
    $status = 401;
    $usuarioId = -1;
    $info = "ok";
    if ($user) {
      if (password_verify($params['clave'], $user->clave) || $params['clave'] == $user->clave) {

        $datos = array('rol' => $user->rol, 'id' => $user->id, 'usuario' => $user->usuario);
        $token = AutentificadorJWT::CrearToken($datos);

        $payload = json_encode(array('OK' => "Usuario de rol '$user->rol' inició sesión con éxito"));
        setcookie('jwt_token', $token, time() + (86400), '/'); // Caduca en 30 días

        $usuarioId = $user->id;
        $response->getBody()->write($payload);
        $status = 200;
      } else {
        $info = "Contraseña incorrecta" . " - Usuario ingresado: " . $userName;
        $payload = json_encode($info);
        $response->getBody()->write($payload);
      }
    } else {
      $info = "Usuario inexistente" . " - " . $userName;
      $payload = json_encode($info);
      $response->getBody()->write($payload);
    }
    $response->withStatus($status);

    $log = new Log($usuarioId, "POST - /login", $status, $info);
    $log->crearLog();

    return $response->withHeader('Content-Type', 'application/json');
  }

  public function Logout($request, $response, $args)
  {
    setcookie('jwt_token', '', time() - 3600, '/'); // Caduca en el pasado para eliminar la cookie

    $payload = json_encode(array('OK' => 'Logout exitoso'));
    $response->getBody()->write($payload);

    return $response->withStatus(200)->withHeader('Content-Type', 'application/json');
  }

  public function DescargarCSV($request, $response, $args)
  {
    $lista = Usuario::obtenerTodos();
    GuardarCSV($lista, "usuarios") ? $mensaje = "Archivo guardado con éxito" : $mensaje = "No sé pudo generar el CSV";
    $payload = json_encode(array("mensaje" => $mensaje, "listaUsuarios" => $lista));

    $response->getBody()->write($payload);
    return $response
      ->withHeader('Content-Type', 'application/json');
  }
}
