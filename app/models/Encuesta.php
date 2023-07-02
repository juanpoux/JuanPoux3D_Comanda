<?php

class Encuesta
{
    public $id;
    public $codigoMesa;
    public $codigoPedido;
    public $notaMesa;
    public $notaRestaurante;
    public $notaCocinero;
    public $notaMozo;
    public $comentario;

    public function crearEncuesta()
    {
        $objAccesoDatos = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDatos->prepararConsulta("INSERT into calificaciones (codigoMesa, codigoPedido, notaMesa, notaRestaurante, notaMozo, notaCocinero, comentario) VALUES (:codigoMesa, :codigoPedido, :notaMesa, :notaRestaurante, :notaMozo, :notaCocinero, :comentario)");
        $consulta->bindValue(':codigoMesa', $this->codigoMesa, PDO::PARAM_STR);
        $consulta->bindValue(':codigoPedido', $this->codigoPedido, PDO::PARAM_STR);
        $consulta->bindValue(':notaMesa', $this->notaMesa, PDO::PARAM_INT);
        $consulta->bindValue(':notaRestaurante', $this->notaRestaurante, PDO::PARAM_INT);
        $consulta->bindValue(':notaCocinero', $this->notaCocinero, PDO::PARAM_INT);
        $consulta->bindValue(':notaMozo', $this->notaMozo, PDO::PARAM_INT);
        $consulta->bindValue(':comentario', $this->comentario, PDO::PARAM_STR);
        $consulta->execute();

        return $objAccesoDatos->obtenerUltimoId();
    }

    public static function obtenerEncuestaPorCodigoMesaYPedido($codigoMesa, $codigoPedido)
    {
        $objAccesoDatos = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDatos->prepararConsulta("SELECT * FROM calificaciones WHERE codigoMesa = :codigoMesa AND codigoPedido = :codigoPedido");
        $consulta->bindValue(':codigoMesa', $codigoMesa, PDO::PARAM_STR);
        $consulta->bindValue(':codigoPedido', $codigoPedido, PDO::PARAM_STR);
        $consulta->execute();

        return $consulta->fetchObject('Encuesta');
    }

    public static function obtenerTodos()
    {
        $objAccesoDatos = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDatos->prepararConsulta("SELECT * FROM calificaciones");
        $consulta->execute();

        return $consulta->fetchAll(PDO::FETCH_CLASS, 'Encuesta');
    }

    public static function obtenerMejores()
    {
        $objAccesoDatos = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDatos->prepararConsulta("SELECT * FROM calificaciones WHERE notaMesa > 6 OR notaRestaurante > 6  OR notaMozo > 6  OR notaCocinero > 6 ");
        $consulta->execute();

        return $consulta->fetchAll(PDO::FETCH_CLASS, 'Encuesta');
    }
}
