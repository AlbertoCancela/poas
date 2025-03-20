<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include_once '../model/queryHandler.php';

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $data = json_decode(file_get_contents("php://input"), true);
    $object = new QueryHandler();

    $sqlQuery = ['au' => "SELECT * FROM POAS_USUARIOS pu",
                'ac' => "SELECT * FROM POAS_CUENTAS",
                'afw5' => "SELECT 
                                FIRST 6
                                pp.FOLIO, 
                                ps.NOMBRE AS AREA, 
                                pu.NOMBRE AS AUTOR, 
                                pe.NOMBRE AS EJE_RECTOR,
                                pp.EJERCICIO_FISCAL 
                            FROM POAS_POAS pp
                            INNER JOIN POAS_SECCIONES ps ON pp.FOLIO = ps.ID
                            INNER JOIN POAS_USUARIOS pu ON pp.AUTOR = pu.ID
                            INNER JOIN POAS_PROYECTOMETA ppm ON pp.ID_PDI_PROYECTOMETA = ppm.ID
                            INNER JOIN POAS_LINEASACCION pla ON ppm.ID_LINEAS_ACCION = pla.ID
                            INNER JOIN POAS_EJERECTOR pe ON pla.ID_EJE_RECTOR = pe.ID
                            ORDER BY pp.FECHA_ELABORACION DESC;",
                'afsPd' => "SELECT 
                                pc.FOLIO,
                                ps.NOMBRE AS AREA,
                                pu.NOMBRE AS AUTOR,
                                pc.FECHA_EJECUCION,
                                pcu.NOMBRE AS CUENTA,
                                pun.NOMBRE AS UNIDAD,
                                pc.CONCEPTO,
                                pc.COSTO_UNITARIO,
                                pc.CANTIDAD,
                                pc.IMPORTE_TOTAL
                            FROM POAS_CONCEPTOACTIVIDAD pc
                            INNER JOIN POAS_POAS PP ON (pc.FOLIO = pp.FOLIO)
                            INNER JOIN POAS_SECCIONES ps ON (pp.ID_AREA = ps.ID)
                            INNER JOIN POAS_USUARIOS pu ON (pp.AUTOR = pu.ID)
                            INNER JOIN POAS_CUENTAS pcu ON (pc.TIPO_CUENTA = pcu.ID)
                            INNER JOIN POAS_UNIDADES pun ON (pc.UNIDAD = pun.ID)
                            WHERE pc.FOLIO = :id;"];
    
    if($data['action'] == 'obtainData'){
        $sql = $sqlQuery[$data['sql']];
        // echo  json_encode($sql); 
        $response = $object->simpleQuery($sql);
        if (is_string($response)) {
            echo $response; // Si ya es un JSON string, solo lo devuelve
        } else {
            echo json_encode($response); // Si es un array PHP, lo convierte a JSON
        }
    }
    if($data['action'] == 'obtainConceptsByFolio'){
        $sql = $sqlQuery[$data['sql']];
        $folio = $data['folio'] ?? null; // Si no existe, asigna null
        if (empty($folio)) {
            echo json_encode(["success" => false, "error" => "El folio está vacío o nulo"]);
            exit;
        }
        // $sql = "SELECT * FROM POAS_CONCEPTOACTIVIDAD WHERE FOLIO = ?";
        $params = [$folio]; // Firebird usa ? en lugar de :id
        $response = $object->simpleQuery($sql, $params);
        // echo json_encode(["debug_folio" => $folio]); // Si es un array PHP, lo convierte a JSON
        echo json_encode($response);
    }
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
    if($data['action'] == 'obtainUsers'){
        $response = $object->simpleQuery($data['sql']);
        echo json_encode($response);
    }
    if ($data['action'] == 'insertPoa') { //Corregir más tarde: 1.- Agregar el campo de fecha ejecucion final en conceptos y agregar a los responsables de acuerdo al concepto
        $params = $data['params'];
        error_log("📥 Datos recibidos en insertPoa: " . json_encode($params));
    
        // Asignar valores con fallback
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
    
        $lastIdQuery = "SELECT MAX(FOLIO) AS LAST_ID FROM POAS_POAS";
        $lastIdResponse = $object->executeQuery($lastIdQuery);
        $lastId = ($lastIdResponse["success"] && !empty($lastIdResponse["data"])) 
            ? $lastIdResponse["data"][0]["LAST_ID"] 
            : 0;
        
        $idPoa = $lastId + 1;

        // Insertar POA
        $sql = "INSERT INTO POAS_POAS 
                (FOLIO, FECHA_ELABORACION, EJERCICIO_FISCAL, DESCRIPCION, FECHA_INICIO, FECHA_TERMINO, ID_AREA, 
                TIPO_GASTO, ID_PDI_PROYECTOMETA, OBSERVACIONES, AUTOR) 
                VALUES 
                (:idPoa,:fecha_elaboracion, :ejercicio_fiscal, :descripcion_general, :fecha_inicio, :fecha_termino, :area, 
                :tipo_gasto, :proyecto_meta, :descripcion_observaciones, :autor)";
    
        $queryParams = [
            ":idPoa" => $idPoa,
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
        if (!$response["success"]) {
            error_log("❌ Error al insertar el POA: " . json_encode($response));
        }
        
        if ($response["success"]) {
            $folio = $response["folio"]; // Obtener el FOLIO del POA insertado
    
            // 🔹 Obtener el último ID en POAS_CONCEPTOACTIVIDAD
            $lastIdQuery = "SELECT MAX(ID) AS LAST_ID FROM POAS_CONCEPTOACTIVIDAD";
            $lastIdResponse = $object->executeQuery($lastIdQuery);
    
            // Si hay resultados, tomamos el último ID y sumamos 1, si no, empezamos en 1
            $lastId = ($lastIdResponse["success"] && !empty($lastIdResponse["data"])) ? $lastIdResponse["data"][0]["LAST_ID"] : 0;
            $newId = $lastId + 1;
    
            // Ahora insertamos los conceptos
            if (!empty($params["conceptsPOA"])) {
                foreach ($params["conceptsPOA"] as $concept) {
                    $sqlConcept = "INSERT INTO POAS_CONCEPTOACTIVIDAD 
                                    (ID, FOLIO, TIPO_CUENTA, FECHA_EJECUCION, CONCEPTO, UNIDAD, CANTIDAD, COSTO_UNITARIO, IMPORTE_TOTAL, OBSERVACIONES) 
                                    VALUES 
                                    (:id, :folio, :tipoCuenta, :fechaEjecucion, :conceptoActividad, :unidad, :cantidad, :costoUnitario, :importe, :observaciones)";
                    
                    $queryParamsConcept = [
                        ":id" => $newId, // Usamos el ID autoincrementado manualmente
                        ":folio" => $folio,
                        ":tipoCuenta" => $concept["tipoCuenta"],
                        ":fechaEjecucion" => $concept["fechaEjecucionInicial"], // Asumimos fecha inicial
                        ":conceptoActividad" => $concept["conceptoActividad"],
                        ":unidad" => $concept["unidad"],
                        ":cantidad" => $concept["cantidad"],
                        ":costoUnitario" => $concept["costoUnitario"],
                        ":importe" => $concept["importe"],
                        ":observaciones" => NULL // Puedes agregar observaciones si existen
                    ];
    
                    $object->executeQuery($sqlConcept, $queryParamsConcept);
                    $newId++; // Incrementamos el ID para el siguiente concepto
                }
            }
    
            echo json_encode(["success" => true, "message" => "POA y conceptos insertados correctamente", "folio" => $folio]);
        } else {
            echo json_encode(["success" => false, "message" => "Error al insertar el POA"]);
        }
    }
}

?>