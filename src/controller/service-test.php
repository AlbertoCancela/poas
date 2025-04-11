<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

// Comprobar si el archivo fue alcanzado
error_log("[INFO] Entró a service-test.php");


// Comprobar si el archivo queryHandler existe
if (!file_exists('../model/queryHandler.php')) {
    echo json_encode(["success" => false, "error" => "❌ No se encontró queryHandler.php"]);
    exit;
}

include_once '../model/queryHandler.php';

// Leer JSON
$input = json_decode(file_get_contents("php://input"), true);
file_put_contents("log.txt", "[INFO] Body recibido: " . json_encode($input) . "\n", FILE_APPEND);

try {
    $object = new QueryHandler();
    file_put_contents("log.txt", "[INFO] Instancia de QueryHandler creada\n", FILE_APPEND);

    $response = $object->test();
    echo json_encode(["success" => true, "result" => $response]);
} catch (Throwable $e) {
    // Captura todo: errores fatales, de sintaxis, etc.
    echo json_encode(["success" => false, "error" => $e->getMessage()]);
}
