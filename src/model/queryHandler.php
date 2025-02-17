<?php
header("Content-Type: application/json"); // 🔹 Asegura que PHP SIEMPRE devuelva JSON

class DataBase {
    private $host = "10.10.1.9"; 
    private $dbname = "C:\\www\\htdocs\\siaduh\\BD\\BDSISCUH.GDB";
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
    public function autofill_area( $sql ){
        return $this->executeQuery( $sql );
    }
}
?>
