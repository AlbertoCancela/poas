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
<script>
document.addEventListener("DOMContentLoaded", () => {
    const openButtons = document.querySelectorAll(".open-modal");
    const closeButtons = document.querySelectorAll(".close-modal");
    const modals = document.querySelectorAll(".modal");

    // Abrir modal
    openButtons.forEach(button => {
        button.addEventListener("click", () => {
            const modal = document.getElementById(button.dataset.modal);
            modal.classList.remove("invisible", "opacity-0");
            modal.classList.add("opacity-100");
            modal.querySelector(".modal-content").classList.remove("scale-95");
            modal.querySelector(".modal-content").classList.add("scale-100");
        });
    });

    // Cerrar modal
    closeButtons.forEach(button => {
        button.addEventListener("click", () => {
            const modal = document.getElementById(button.dataset.modal);
            modal.classList.remove("opacity-100");
            modal.classList.add("opacity-0");
            modal.querySelector(".modal-content").classList.remove("scale-100");
            modal.querySelector(".modal-content").classList.add("scale-95");

            // Esconde el modal después de la animación
            setTimeout(() => {
                modal.classList.add("invisible");
            }, 300);
        });
    });

    // Cerrar modal haciendo clic fuera del contenido
    modals.forEach(modal => {
        modal.addEventListener("click", (e) => {
            if (e.target === modal) {
                modal.classList.remove("opacity-100");
                modal.classList.add("opacity-0");
                modal.querySelector(".modal-content").classList.remove("scale-100");
                modal.querySelector(".modal-content").classList.add("scale-95");

                setTimeout(() => {
                    modal.classList.add("invisible");
                }, 300);
            }
        });
    });
});
</script>
</html>
