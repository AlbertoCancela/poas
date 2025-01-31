<?php
    setlocale(LC_TIME, 'es_ES.UTF-8');  // Configura el idioma a español
    // echo strftime('%d de %B de %Y'); 
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tailwind CSS</title>
    <link href="dist/output.css" rel="stylesheet">
</head>
<body class="">
    <main class="mainContainer w-screen h-screen bg-custom_lightGray flex">
        <aside class="basis-2/12 flex flex-col bg-custom_blueUH text-white p-4">
            <div class="flex-1 "><img src="public/images/uhSquareLogo.png" alt=""></div>
            <div class="basis-6/12 ">
                <nav class="flex h-full flex-col items-center justify-center p-2 space-y-2 text-xl font-roboto">
                    <!-- Opción: Inicio -->
                    <a href="#" class="block p-3 border-b-2 border-transparent hover:border-green-600 ease-out duration-75">
                        <span class="font-medium">Inicio</span>
                    </a>

                    <!-- Opción: Perfil -->
                    <a href="#" class="block p-3 border-b-2 border-transparent hover:border-green-600 ease-out duration-75">
                        <span class="font-medium">Perfil</span>
                    </a>

                    <!-- Opción: POA's con lista desplegable -->
                    <div class="text-center">
                        <!-- Botón con borde transparente para evitar movimiento -->
                        <button id="toggle-poas" class="w-full block p-3 border-b-2 border-transparent hover:border-green-600 ease-out duration-75 focus:outline-none">
                            <span class="font-medium">POA's</span>
                        </button>

                        <!-- Submenú desplegable -->
                        <div id="submenu-poas" class="max-h-0 opacity-0 bg-custom_glass flex-col mt-2 space-y-1 overflow-hidden transition-all duration-300 ease-in-out">
                            <a href="#" class="block px-4 py-2 border-b-2 border-transparent hover:border-green-600">ver POA's</a>
                            <a href="#" class="block px-4 py-2 border-b-2 border-transparent hover:border-green-600">Nuevo</a>
                            <a href="#" class="block px-4 py-2 border-b-2 border-transparent hover:border-green-600">Información</a>
                        </div>
                    </div>

                    <!-- Opción: Reportes -->
                    <a href="#" class="block p-3 border-b-2 border-transparent hover:border-green-600 ease-out duration-75">
                        <span class="font-medium">Reportes</span>
                    </a>
                </nav>

            </div>
            <div class="flex-1 flex flex-col justify-end items-center p-1">
                <button class="border-2 border-gray-200 rounded w-6/12 h-10 hover:bg-slate-300 hover:text-custom_blueUH font-roboto text-lg ease-out duration-100 ">
                    Log Out
                </button>
            </div>
        </aside>
        <div class="flex-1 bg-white p-4">
            <div class="flex flex-col container h-full">
                <div class="flex border-b-2 border-custom_glass basis-2/12 p-4">
                    <div class="flex-1 flex items-center text-4xl text-gray-600 font-montserrat font-semibold ">INICIO</div>
                    <div class="flex flex-col items-end flex-1 text-gray-600">
                        <p class="font-roboto font-semibold">Alberto Josué Cancela Arredondo</p>
                        <p class="font-roboto font-semibold"><?php echo strftime('%A, %d de %B del %Y')?></p>
                    </div>
                </div>
                <div class=" flex-1 flex p-6 justify-around"> 
                    <div class="bg-custom_gray basis-8/12 shadow-custom_medium rounded-md"></div>
                    <div class=" bg-custom_gray basis-3/12 shadow-custom_medium rounded-md"></div>
                </div>
            </div>
        </div>
    </main>
</body>
<script>
document.addEventListener('DOMContentLoaded', () => {
    const toggleButton = document.getElementById('toggle-poas');
    const submenu = document.getElementById('submenu-poas');

    toggleButton.addEventListener('click', () => {
        if (submenu.classList.contains('max-h-0')) {
            submenu.classList.remove('max-h-0', 'opacity-0');
            submenu.classList.add('max-h-40', 'opacity-100');  // Ajusta la altura máxima según tu contenido
        } else {
            submenu.classList.remove('max-h-40', 'opacity-100');
            submenu.classList.add('max-h-0', 'opacity-0');
        }
    });
});

</script>
</html>
