<?php
    setlocale(LC_TIME, 'es_MX.UTF-8');
    date_default_timezone_set('America/Mexico_City');  // Zona horaria de México
    $pathContent = 'initpoa/main-initPoa.php';
    $pageContent = array("title" => 'Planeación Operativa Anual de Actividades'); 
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicializar POA</title>
    <link href="../dist/output.css" rel="stylesheet">
    <link rel="icon" href="../public/images/uhLogo.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body class="">
<main class="mainContainer w-screen h-screen bg-custom_lightGray flex">
        <?php 
        include_once 'components/sideBar.php';
        include_once 'components/content1.php';
        include_once 'components/modals/myConcepts.php';
        ?>
    </main>
</body>
<script src="../public/js/sideBarToggle.js"></script>
<script src="../public/js/initPoa.js"></script>
<script src="../public/js/modals.js"></script>
<script src="../public/js/Class-PoaForm.js"></script>
<script src="../public/js/Class-DML.js"></script>
<script>
    var inputs = document.querySelectorAll('.input-field')
    if(inputs.length === 0){
        console.error("No se encontraron inputs con la clase 'input-field'.")
    }
    inputs.forEach( input => {
        input.addEventListener("blur", () => {
            new InitPoaForm(input);
        })
    })
    var selects = document.querySelectorAll('.input-fieldSelect')
    if(selects.length === 0){
        console.error("No se encontraron inputs con la clase 'input-field'.")
    }
    selects.forEach( select => {
        select.addEventListener('change', ()=> {
            // console.log(new DBGetter(select))
            new DBHandler(select, 'test')
            
        })
    })

    

</script>
<script>
    new AutoFill('selectsInitPoa')
</script>
</html>
