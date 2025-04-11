<?php
$host = 'mysql_poas';
$port = '3306';
$dbname = 'BDSISCUH';
$user = 'root';
$pass = 'rootpass';

try {
    $pdo = new PDO("mysql:host=$host;port=$port;dbname=$dbname;charset=utf8mb4", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "✅ Conexión exitosa a la base de datos '$dbname'.";
} catch (PDOException $e) {
    echo "❌ Error de conexión: " . $e->getMessage();
}
