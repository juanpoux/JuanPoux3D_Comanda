<?php
error_reporting(-1);
ini_set('display_errors', 1);

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Server\RequestHandlerInterface;
use Slim\Factory\AppFactory;
use Slim\Routing\RouteCollectorProxy;
use Slim\Routing\RouteContext;

require __DIR__ . '/../vendor/autoload.php';

require_once './db/AccesoDatos.php';
require_once './middlewares/AutentificadorJWT.php';
require_once './middlewares/MWVerificar.php';
require_once './middlewares/MWLog.php';

require_once './controllers/UsuarioController.php';
require_once './controllers/ProductoController.php';
require_once './controllers/MesaController.php';
require_once './controllers/PedidoController.php';
require_once './controllers/CSVController.php';
require_once './controllers/PDFController.php';
require_once './controllers/EncuestaController.php';


date_default_timezone_set('America/Argentina/Buenos_Aires');

// Load ENV
$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->safeLoad();

// Instantiate App
$app = AppFactory::create();

// Add error middleware
$app->addErrorMiddleware(true, true, true);

// Add parse body
$app->addBodyParsingMiddleware();

// Routing Middlewere
$app->addRoutingMiddleware();


// Routes

// Login
$app->group('/login', function (RouteCollectorProxy $group) {
  $group->post('[/]', \UsuarioController::class . ':Login');
});

// Usuarios
$app->group('/usuarios', function (RouteCollectorProxy $group) {
  $group->get('/descargarCSV', \UsuarioController::class . ':DescargarCSV')->add(new MWVerificar("todos"));

  $group->get('/activos', \UsuarioController::class . ':TraerTodosActivos')->add(new MWVerificar("todos"));
  $group->get('[/]', \UsuarioController::class . ':TraerTodos')->add(new MWVerificar("todos"));
  $group->get('/{usuario}', \UsuarioController::class . ':TraerUno')->add(new MWVerificar("todos"));
  $group->post('[/]', \UsuarioController::class . ':CargarUno')->add(new MWVerificar("todos"));
  $group->put('[/]', \UsuarioController::class . ':ModificarUno')->add(new MWVerificar("socio"));
  $group->delete('/{id}', \UsuarioController::class . ':BorrarUno')->add(new MWVerificar("socio"));
})->add(new MWLogOperaciones());

// Productos
$app->group('/productos', function (RouteCollectorProxy $group) {
  $group->get('/descargarCSV', \ProductoController::class . ':DescargarCSV')->add(new MWVerificar("todos"));

  $group->get('[/]', \ProductoController::class . ':TraerTodos')->add(new MWVerificar("todos"));
  $group->get('/{producto}', \ProductoController::class . ':TraerUno')->add(new MWVerificar("todos"));
  $group->post('[/]', \ProductoController::class . ':CargarUno')->add(new MWVerificar("todos"));
})->add(new MWLogOperaciones());

// Mesas
$app->group('/mesas', function (RouteCollectorProxy $group) {
  $group->get('/listarMesas', \MesaController::class . ':TraerTodos')->add(new MWVerificar("socio"));
  $group->get('/masUsada', \MesaController::class . ':TraerMasUsada')->add(new MWVerificar("socio"));

  $group->get('[/]', \MesaController::class . ':TraerTodos')->add(new MWVerificar("todos"));
  $group->get('/{mesa}', \MesaController::class . ':TraerUno')->add(new MWVerificar("mozo"));
  $group->post('[/]', \MesaController::class . ':CargarUno')->add(new MWVerificar("todos"));

  $group->put('/cambiarEstado', \MesaController::class . ':ModificarUno')->add(new MWVerificar("mozo"));
  $group->put('/cerrarMesa', \PedidoController::class . ':CerrarMesaYPedido')->add(new MWVerificar("socio"));
})->add(new MWLogOperaciones());

// Pedidos
$app->group('/pedidos', function (RouteCollectorProxy $group) {
  $group->get('/pedidosConDemora', \PedidoController::class . ':TraerPedidosConDemora')->add(new MWVerificar("socio"));
  $group->get('/traerPedidosListos', \PedidoController::class . ':TraerPedidosListos')->add(new MWVerificar("mozo"));
  $group->get('/descargarCSV', \PedidoController::class . ':DescargarCSV')->add(new MWVerificar("todos"));

  $group->get('[/]', \PedidoController::class . ':TraerTodos')->add(new MWVerificar("todos"));
  $group->get('/{pedido}', \PedidoController::class . ':TraerUno')->add(new MWVerificar("todos"));
  $group->post('[/]', \PedidoController::class . ':CrearUno')->add(new MWVerificar("mozo"));
  $group->post('/cargarPedido/{codigoPedido}', \PedidoController::class . ':CargarUno')->add(new MWVerificar("mozo"));
  $group->post('/subirFoto/{codigoPedido}', \PedidoController::class . ':SubirFoto')->add(new MWVerificar("mozo"));


  $group->get('/traerProductosPedidos/{filtro}', \PedidoController::class . ':TraerTodosProductosPedidos')->add(new MWVerificar("todos"));
  $group->put('/cambiarEstadoProducto', \PedidoController::class . ':CambiarEstadoProd')->add(new MWVerificar("todos"));
  $group->put('/servirPedido', \PedidoController::class . ':ServirUnPedido')->add(new MWVerificar("mozo"));
})->add(new MWLogOperaciones());

// clientes
$app->group('/clientes', function (RouteCollectorProxy $group) {
  $group->get('/mostrarDemora/{codigoPedido}/{codigoMesa}', \PedidoController::class . ':TraerDemora')->add(new MWVerificar("todos"));
  $group->post('/darOpinion', \EncuestaController::class . ':CargarUno')->add(new MWVerificar("todos"));
})->add(new MWLogOperaciones());

// calificaciones
$app->group('/calificaciones', function (RouteCollectorProxy $group) {
  $group->get('/mejores', \EncuestaController::class . ':TraerMejores')->add(new MWVerificar("socio"));
})->add(new MWLogOperaciones());

// carga de csv
$app->group('/cargaForzadaCSV', function (RouteCollectorProxy $group) {
  $group->post('/{filtro}', \CsvController::class . ':CargaForzada')->add(new MWVerificar("todos"));
})->add(new MWLogOperaciones());


$app->group('/descargas', function (RouteCollectorProxy $group) {
  $group->get('/descargarLogo', \PDFController::class . ':DescargarLogo')->add(new MWVerificar("todos"));
})->add(new MWLogOperaciones());

// JWT test routes
$app->group('/jwt', function (RouteCollectorProxy $group) {

  $group->post('/crearToken', function (Request $request, Response $response) {
    $parametros = $request->getParsedBody();

    $usuario = $parametros['usuario'];
    $perfil = $parametros['perfil'];
    $alias = $parametros['alias'];

    $datos = array('usuario' => $usuario, 'perfil' => $perfil, 'alias' => $alias);

    $token = AutentificadorJWT::CrearToken($datos);
    $payload = json_encode(array('jwt' => $token));

    $response->getBody()->write($payload);
    return $response
      ->withHeader('Content-Type', 'application/json');
  });

  $group->get('/devolverPayLoad', function (Request $request, Response $response) {
    $header = $request->getHeaderLine('Authorization');
    $token = trim(explode("Bearer", $header)[1]);

    try {
      $payload = json_encode(array('payload' => AutentificadorJWT::ObtenerPayLoad($token)));
    } catch (Exception $e) {
      $payload = json_encode(array('error' => $e->getMessage()));
    }

    $response->getBody()->write($payload);
    return $response
      ->withHeader('Content-Type', 'application/json');
  });

  $group->get('/devolverDatos', function (Request $request, Response $response) {
    $header = $request->getHeaderLine('Authorization');
    $token = trim(explode("Bearer", $header)[1]);

    try {
      $payload = json_encode(array('datos' => AutentificadorJWT::ObtenerData($token)));
    } catch (Exception $e) {
      $payload = json_encode(array('error' => $e->getMessage()));
    }

    $response->getBody()->write($payload);
    return $response
      ->withHeader('Content-Type', 'application/json');
  });

  $group->get('/verificarToken', function (Request $request, Response $response) {
    $header = $request->getHeaderLine('Authorization');
    $token = trim(explode("Bearer", $header)[1]);
    $esValido = false;

    try {
      AutentificadorJWT::verificarToken($token);
      $esValido = true;
    } catch (Exception $e) {
      $payload = json_encode(array('error' => $e->getMessage()));
    }

    if ($esValido) {
      $payload = json_encode(array('valid' => $esValido));
    }

    $response->getBody()->write($payload);
    return $response
      ->withHeader('Content-Type', 'application/json');
  });
});


$app->get('[/]', function (Request $request, Response $response) {
  $payload = json_encode(array("mensaje" => "Slim Framework 4 PHP"));
  $response->getBody()->write($payload);
  return $response->withHeader('Content-Type', 'application/json');
});



$app->run();
