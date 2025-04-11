<?php
header("Content-Type: application/json"); // Devuelve siempre JSON

class DataBase {
    private $host = "mysql_poas";
    private $port = "3306";
    private $dbname = "BDSISCUH";
    private $username = "root";
    private $password = "rootpass";
    private $conn;

    public function __construct() {
        try {
            $dsn = "mysql:host={$this->host};port={$this->port};dbname={$this->dbname};charset=utf8mb4";
            $this->conn = new PDO($dsn, $this->username, $this->password);
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            echo json_encode(["success" => false, "error" => "❌ Error de conexión: " . $e->getMessage()]);
            exit;
        }
    }

    public function executeQuery($sql, $params = []) {
        try {
            $stmt = $this->conn->prepare($sql);
            $stmt->execute($params);

            if (stripos($sql, "INSERT") === 0) {
                $lastId = $this->conn->lastInsertId();
                return ["success" => true, "message" => "Registro insertado correctamente", "id" => $lastId];
            }

            if (stripos($sql, "SELECT") === 0) {
                return ["success" => true, "data" => $stmt->fetchAll(PDO::FETCH_ASSOC)];
            }

            return ["success" => true, "message" => "Consulta ejecutada correctamente"];
        } catch (PDOException $e) {
            return ["success" => false, "error" => "❌ Error en la consulta: " . $e->getMessage()];
        }
    }
}

class QueryHandler extends DataBase {
    public function test() {
        return $this->executeQuery("SELECT * FROM POAS_USUARIOS");
    }

    public function simpleQuery($sql, $params = []) {
        return $this->executeQuery($sql, $params);
    }

    public function autofill_area($sql) {
        return $this->executeQuery($sql);
    }

    public function fillSubArea($sql, $params) {
        return $this->executeQuery($sql, $params);
    }

    public function insertPoa($sql, $params) {
        return $this->executeQuery($sql, $params);
    }
}
?>
