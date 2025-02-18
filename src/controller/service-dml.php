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
    if ($data['action'] == 'autofill_eje-rector') {
        // echo json_encode($data['action']);
        $response = $object->autofill_area($data['sql']);
        if (is_string($response)) {
            echo $response; // Si ya es un JSON string, solo lo devuelve
        } else {
            echo json_encode($response); // Si es un array PHP, lo convierte a JSON
        }
        
    }
    if($data['action'] == 'fillSubArea'){
        $params = [":id" => $data['params']['id']];
        $response = $object->fillSubArea($data['sql'], $params);      
        if (is_string($response)) {
            echo $response; // Si ya es un JSON string, solo lo devuelve
        } else {
            echo json_encode($response); // Si es un array PHP, lo convierte a JSON
        }
    }
    if ($data['action'] == 'insertPoa') {
        $params = $data['params'];
        // Asignar valores con fallback en caso de que no existan
        $fecha_elaboracion = $params['fecha-elaboracion'] ?? date('Y-m-d');
        $ejercicio_fiscal = $params['ejercicio-fiscal'] ?? date('Y');
        $descripcion_general = $params['descripcion-general'] ?? 'Sin descripción';
        $fecha_inicio = $params['fecha-inicio'] ?? NULL;
        $fecha_termino = $params['fecha-termino'] ?? NULL;
        $area = $params['area'] ?? NULL;
        $sub_area = $params['sub-area'] ?? NULL;
        $tipo_gasto = $params['tipo_gasto'] ?? 'ESTRATEGICO';
        $eje_rector = $params['eje-rector'] ?? NULL;
        $linea_accion = $params['linea-accion'] ?? NULL;
        $proyecto_meta = $params['proyecto-meta'] ?? NULL;
        $descripcion_observaciones = $params['descripcion-observaciones'] ?? NULL;
        $autor = 1; // Puedes cambiar esto por el usuario autenticado

        $sql = "INSERT INTO POAS_POAS 
                (FOLIO, FECHA_ELABORACION, EJERCICIO_FISCAL, DESCRIPCION, FECHA_INICIO, FECHA_TERMINO, ID_AREA, 
                TIPO_GASTO, ID_PDI_PROYECTOMETA, OBSERVACIONES, AUTOR) 
                VALUES 
                (3,:fecha_elaboracion, :ejercicio_fiscal, :descripcion_general, :fecha_inicio, :fecha_termino, :area, 
                :tipo_gasto, :proyecto_meta, :descripcion_observaciones, :autor)";

        // Parámetros a pasar en la consulta
        $queryParams = [
            ":fecha_elaboracion" => $fecha_elaboracion,
            ":ejercicio_fiscal" => $ejercicio_fiscal,
            ":descripcion_general" => $descripcion_general,
            ":fecha_inicio" => $fecha_inicio,
            ":fecha_termino" => $fecha_termino,
            ":area" => $area,
            ":tipo_gasto" => $tipo_gasto,
            ":proyecto_meta" => $proyecto_meta,
            ":descripcion_observaciones" => $descripcion_observaciones,
            ":autor" => $autor
        ];

        $response = $object->insertPoa($sql, $queryParams);
        echo json_encode($response);
    }
}

?>