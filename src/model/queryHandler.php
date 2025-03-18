<?php
header("Content-Type: application/json"); // 🔹 Asegura que PHP SIEMPRE devuelva JSON

class DataBase {
    private $host = "localhost"; 
    private $dbname = "/var/lib/firebird/data/poas.fdb";
    private $username = "SYSDBA";
    private $password = "masterkey";
    private $conn;

    public function __construct() {
        try {
            $this->conn = new PDO("firebird:dbname={$this->host}:{$this->dbname}", $this->username, $this->password);
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            return ["success" => false, "error" => "❌ Error de conexión: " . $e->getMessage()];
            exit;
        }
    }

    public function executeQuery($sql, $params = []) {
        try {
            $stmt = $this->conn->prepare($sql);
            $stmt->execute($params);
    
            if (stripos($sql, "INSERT") === 0) {
                // Obtener el último FOLIO insertado
                $folio = $this->conn->query("SELECT MAX(FOLIO) AS FOLIO FROM POAS_POAS")->fetch(PDO::FETCH_ASSOC);
                return ["success" => true, "message" => "Registro insertado correctamente", "folio" => $folio['FOLIO']];
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
    public function simpleQuery ( $sql ){
        return $this->executeQuery( $sql );
    }
    public function autofill_area( $sql ){
        return $this->executeQuery( $sql );
    }
    public function fillSubArea( $sql, $params ){
        return $this->executeQuery( $sql, $params );
    }
    public function insertPoa($sql, $params) {
        return $this->executeQuery($sql, $params);
    }
}

?>
