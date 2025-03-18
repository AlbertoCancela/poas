<?php
    setlocale(LC_TIME, 'es_MX.UTF-8');
    date_default_timezone_set('America/Mexico_City');  // Zona horaria de México
    $pathContent = 'verpoas/content1.php';
    $pageContent = array("title" => 'INICIO'); 
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>POA's UH</title>
    <link href="../dist/output.css" rel="stylesheet">
    <link rel="icon" href="../public/images/uhLogo.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body class="">
    <main class="mainContainer w-screen h-screen bg-custom_lightGray flex">
        <?php 
            include_once 'components/sideBar.php';
            include_once 'components/content1.php';
        ?>
    </main>
</body>
<script src="../public/js/sideBarToggle.js"></script>
<script src="../public/js/Class-DML.js"></script>
<script>
    var objectDML = new AutoFill();
    objectDML.fillSearchWithRecentPoas();

</script>
</html>
