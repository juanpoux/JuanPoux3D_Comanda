<?php

class Mesa
{
    public $id;
    public $estado;
    public $codigo;
    public $fechaCreacion;

    public function crearMesa()
    {
        $objAccesoDatos = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDatos->prepararConsulta("INSERT INTO mesas (estado, codigo, fechaCreacion) VALUES (:estado, :codigo, :fechaCreacion)");
        $consulta->bindValue(':estado', $this->estado, PDO::PARAM_STR);
        $consulta->bindValue(':codigo', $this->codigo, PDO::PARAM_STR);
        $consulta->bindValue(':fechaCreacion', $this->fechaCreacion, PDO::PARAM_STR);
        $consulta->execute();

        return $objAccesoDatos->obtenerUltimoId();
    }

    public static function obtenerTodos()
    {
        $objAccesoDatos = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDatos->prepararConsulta("SELECT id, estado, codigo, fechaCreacion FROM mesas");
        $consulta->execute();

        return $consulta->fetchAll(PDO::FETCH_CLASS, 'Mesa');
    }

    public static function obtenerMesa($id)
    {
        $objAccesoDatos = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDatos->prepararConsulta("SELECT id, estado, codigo, fechaCreacion FROM mesas WHERE id = :id");
        $consulta->bindValue(':id', $id, PDO::PARAM_INT);
        $consulta->execute();

        return $consulta->fetchObject('Mesa');
    }

    public static function obtenerMesaPorCodigo($codigo)
    {
        $objAccesoDatos = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDatos->prepararConsulta("SELECT id, estado, codigo, fechaCreacion FROM mesas WHERE codigo = :codigo");
        $consulta->bindValue(':codigo', $codigo, PDO::PARAM_STR);
        $consulta->execute();

        return $consulta->fetchObject('Mesa');
    }

    public static function modificarMesa($mesa)
    {
        $objAccesoDato = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDato->prepararConsulta("UPDATE mesas SET estado = :estado WHERE id = :id");
        $consulta->bindValue(':estado', $mesa->estado, PDO::PARAM_STR);
        $consulta->bindValue(':id', $mesa->id, PDO::PARAM_INT);
        $consulta->execute();
    }

    public static function borrarMesa($id)
    {
        $objAccesoDato = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDato->prepararConsulta("UPDATE mesas SET fechaBaja = :fechaBaja WHERE id = :id");
        $fecha = new DateTime(date("d-m-Y"));
        $consulta->bindValue(':id', $id, PDO::PARAM_INT);
        $consulta->bindValue(':fechaBaja', date_format($fecha, 'Y-m-d H:i:s'));
        $consulta->execute();
    }

    public static function obtenerCodigoMesaMasUsado()
    {
        $objAccesoDatos = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDatos->prepararConsulta("SELECT codigoMesa, COUNT(*) AS veces_repetido
                                                  FROM pedidos
                                                  GROUP BY codigoMesa
                                                  ORDER BY veces_repetido DESC
                                                  LIMIT 1");
        $consulta->execute();

        $resultado = $consulta->fetch(PDO::FETCH_ASSOC);
        if ($resultado) {
            return $resultado['codigoMesa'];
        } else {
            return false;
        }
    }
}
