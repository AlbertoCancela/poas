<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include_once '../model/queryHandler.php';

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $data = json_decode(file_get_contents("php://input"), true);
    $object = new QueryHandler();

    if ($data['action'] == 'autofill_area') {
        $response = $object->autofill_area($data['sql']);
        if (is_string($response)) {
            echo $response; // Si ya es un JSON string, solo lo devuelve
        } else {
            echo json_encode($response); // Si es un array PHP, lo convierte a JSON
        }
        
    }
}

?>