<?php
require_once './middlewares/AutentificadorJWT.php';

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use AutentificadorJWT as AutentificadorJWT;
use Slim\Handlers\Strategies\RequestHandler;


class PdfController
{
  public function DescargarLogo($request, $response, $args)
  {
    $html = "<img src='https://loremflickr.com/cache/resized/65535_52294428543_2d04971c12_n_320_240_nofilter.jpg' width='128'alt='Logo'>";

    DescargarPDF($html, "logo.pdf");
    $payload = $html;

    $response->getBody()->write($payload);
    return $response->withHeader('Content-Type', 'application/json');
  }
}
