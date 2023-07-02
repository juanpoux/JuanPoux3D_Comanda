<?php

class Usuario
{
    public $id;
    public $nombre;
    public $usuario;
    public $clave;
    public $rol;
    public $estado;

    public function crearUsuario()
    {
        $inicio = date('Y-m-d H:i:s');
        $estado = "activo";
        $objAccesoDatos = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDatos->prepararConsulta("INSERT INTO usuarios (nombre, usuario, clave, rol, fechaInicio, estado) VALUES (:nombre, :usuario, :clave, :rol, :fechaInicio, :estado)");
        $claveHash = password_hash($this->clave, PASSWORD_DEFAULT);
        $consulta->bindValue(':nombre', $this->nombre, PDO::PARAM_STR);
        $consulta->bindValue(':usuario', $this->usuario, PDO::PARAM_STR);
        $consulta->bindValue(':rol', $this->rol, PDO::PARAM_STR);
        $consulta->bindValue(':clave', $claveHash);
        $consulta->bindValue(':fechaInicio', $inicio, PDO::PARAM_INT);
        $consulta->bindValue(':estado', $estado, PDO::PARAM_STR);
        $consulta->execute();

        return $objAccesoDatos->obtenerUltimoId();
    }

    public static function obtenerTodosActivos()
    {
        $estado = "activo";
        $objAccesoDatos = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDatos->prepararConsulta("SELECT id, nombre, usuario, clave, rol, estado FROM usuarios WHERE estado LIKE :estado");
        $consulta->bindValue(':estado', $estado, PDO::PARAM_STR);
        $consulta->execute();

        return $consulta->fetchAll(PDO::FETCH_CLASS, 'Usuario');
    }

    public static function obtenerTodos()
    {
        $objAccesoDatos = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDatos->prepararConsulta("SELECT id, nombre, usuario, clave, rol, estado FROM usuarios");
        $consulta->execute();

        return $consulta->fetchAll(PDO::FETCH_CLASS, 'Usuario');
    }

    public static function obtenerUsuario($usuario)
    {
        $objAccesoDatos = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDatos->prepararConsulta("SELECT id, nombre, usuario, clave, rol, estado FROM usuarios WHERE usuario = :usuario");
        $consulta->bindValue(':usuario', $usuario, PDO::PARAM_STR);
        $consulta->execute();

        return $consulta->fetchObject('Usuario');
    }

    public static function obtenerUsuarioPorId($id)
    {
        $objAccesoDatos = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDatos->prepararConsulta("SELECT id, nombre, usuario, clave, rol, estado FROM usuarios WHERE id = :id");
        $consulta->bindValue(':id', $id, PDO::PARAM_STR);
        $consulta->execute();

        return $consulta->fetchObject('Usuario');
    }

    public static function modificarUsuario($usr)
    {
        $objAccesoDato = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDato->prepararConsulta("UPDATE usuarios SET usuario = :usuario, nombre = :nombre, clave = :clave, rol = :rol, estado = :estado WHERE id = :id");
        $consulta->bindValue(':usuario', $usr->usuario, PDO::PARAM_STR);
        $consulta->bindValue(':nombre', $usr->nombre, PDO::PARAM_STR);
        $consulta->bindValue(':clave', $usr->clave, PDO::PARAM_STR);
        $consulta->bindValue(':id', $usr->id, PDO::PARAM_INT);
        $consulta->bindValue(':rol', $usr->rol, PDO::PARAM_STR);
        $consulta->bindValue(':estado', $usr->estado, PDO::PARAM_STR);
        $consulta->execute();
    }

    public static function borrarUsuario($id)
    {
        $estado = "inactivo";
        $fechaBaja = date('Y-m-d H:i:s');
        $objAccesoDato = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDato->prepararConsulta("UPDATE usuarios SET fechaBaja = :fechaBaja, estado = :estado WHERE id = :id");
        $consulta->bindValue(':id', $id, PDO::PARAM_INT);
        $consulta->bindValue(':fechaBaja', $fechaBaja, PDO::PARAM_INT);
        $consulta->bindValue(':estado', $estado, PDO::PARAM_STR);
        $consulta->execute();
    }

    public static function getLoggedUsrID($cookies)
    {
        $token = '';
        if (isset($cookies['jwt_token'])) {
            $token = $cookies['jwt_token'];
        }
        $dataUsr = AutentificadorJWT::ObtenerData($token);
        $idUsuario = $dataUsr->id;
        return $idUsuario;
    }

    public static function CargaForzada($usuarios)
    {
        $contador = 0;

        foreach ($usuarios as $usuario) {
            if (!Usuario::obtenerUsuarioPorId($usuario->id)) {
                $usuarioAux = new Usuario();
                $usuarioAux->id = $usuario->id;
                $usuarioAux->nombre = $usuario->nombre;
                $usuarioAux->usuario = $usuario->usuario;
                $usuarioAux->clave = $usuario->clave;
                $usuarioAux->rol = $usuario->rol;

                $usuarioAux->crearUsuario();
                $contador++;
            }
        }

        return $contador;
    }
}
