<?php

class Log
{
    public $id;
    public $id_usuario;
    public $accion;
    public $status;
    public $fecha_accion;
    public $info;

    public function __construct($id_usuario, $accion, $status, $info = "ok")
    {
        $this->id_usuario = $id_usuario;
        $this->accion = $accion;
        $this->status = $status;
        $this->fecha_accion = date('Y-m-d H:i:s');
        $this->info = $info;
    }

    public function crearLog()
    {
        $objAccesoDatos = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDatos->prepararConsulta("
        INSERT INTO log (id_usuario, accion, status, fecha_accion, info) VALUES (:id_usuario, :accion, :status, :fecha_accion, :info)");
        $consulta->bindValue(':id_usuario', $this->id_usuario, PDO::PARAM_INT);
        $consulta->bindValue(':accion', $this->accion, PDO::PARAM_STR);
        $consulta->bindValue(':status', $this->status, PDO::PARAM_INT);
        $consulta->bindValue(':fecha_accion', $this->fecha_accion, PDO::PARAM_STR);
        $consulta->bindValue(':info', $this->info, PDO::PARAM_STR);
        $consulta->execute();

        return $objAccesoDatos->obtenerUltimoId();
    }
}
