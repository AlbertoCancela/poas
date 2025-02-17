<?php
try {
    $host = "localhost";
    $dbname = "/var/lib/firebird/data/POAS.fdb"; 
    $user = "SYSDBA";
    $password = "masterkey";

    $dsn = "firebird:dbname={$host}/3050:{$dbname}";

    $pdo = new PDO($dsn, $user, $password, array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));

    echo "✅ Conexión exitosa a Firebird con PDO";
} catch (PDOException $e) {
    echo "❌ Error de conexión: " . $e->getMessage();
}
?>
