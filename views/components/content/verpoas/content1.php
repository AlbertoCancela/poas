
<div class="bg-gray-300 basis-3/12 shadow-lg rounded-lg p-4 flex flex-col justify-between h-full gap-6">
    <div>
        <label for="search" class="block font-semibold text-gray-700">Buscar Poas</label>
        <input id="search" type="text" class="w-full mt-2 p-2 border rounded-md focus:ring focus:ring-gray-300" placeholder="Folio / Área">
    </div>
    <p class="text-gray-700">Al hacer clic en cualquiera de los poas, se abrirá una ventana interactuable</p>
    <!-- <button class="bg-gray-500 text-white py-2 px-4 rounded-md flex items-center justify-between">
        Filtrar
        <span class="ml-2">🔽</span>
    </button> -->

    <!-- Botones hasta abajo -->
    <div onclick="showPoasDetails()" class="grid grid-cols-2 gap-2 mt-auto">
        <!-- <button class="bg-gray-800 text-gray-200 p-3 rounded-md border border-blue-600">
            Aprobar POA
        </button>
        <button class="bg-gray-800 text-gray-200 p-3 rounded-md border border-green-600">
            Sugerir Edición
        </button>
        <button class="bg-gray-800 text-gray-200 p-3 rounded-md border border-gray-600">
            Imprimir Excel
        </button>
        <button class="bg-gray-800 text-gray-200 p-3 rounded-md border border-gray-600">
        </button> -->
    </div>
</div>

<!-- Contenedor de resultados (derecha, 8/12 del ancho total) -->
<div class="bg-gray-300 basis-8/12 shadow-lg rounded-lg p-4 overflow-y-auto max-h-[90vh]">
    <div class="space-x-4 text-gray-700 font-semibold rounded-md mb-4 ">
        <b class="cursor-pointer" onclick="changeHidden('poaDetails','searchResultsContainer')"> <i class="bi bi-arrow-left-circle"></i> Regresar a resultados de búsqueda</b>
        <h2 class=" text-right">RESULTADOS DE BÚSQUEDA</h2>
    </div>
    <div id="poaDetails" class="flex flex-col bg-gray-700 rounded-md h-[70vh] max-h-[70vh] overflow-y-auto text-gray-300">        
        <div class="flex flex-col p-3 border-b">
            <div class="space-x-4">
                <b class="text-green-700 poaDetail-change">1003</b> <b class="text-cyan-400 poaDetail-change">Estratégico</b>
            </div>
            <div><b class="poaDetail-change">V.O - COORDINACIÓN DE SISTEMAS, REDES Y DESARROLLO TECNOLÓGICO</b></div>
            <div><i class="poaDetail-change">Alberto Josué Cancela Arredondo</i></div>
        </div>
        <div class="flex flex-col space-y-4 p-6 border-b">
            <div>
                <b class="text-orange-500">Descripción general</b>
                <p class="poaDetail-change">Lorem ipsum dolor sit amet consectetur adipisicing elit. Soluta reprehenderit nobis sed sequi. 
                    Eaque laborum vel praesentium repudiandae hic esse quia totam itaque, quasi aliquid facere. Illum dolores beatae minus!
                    
                </p>
            </div>
            <div>
                <b class="flex text-orange-500">Datos generales</b>
                <div class="space-x-2 text-sm">
                    <b>Ejercicio Fiscal: <i class="text-yellow-500 poaDetail-change">2025</i></b>
                    <b>Fecha de creación: <i class="text-yellow-500 poaDetail-change">20/03/2024</i></b>
                    <b>Fecha de ejecución: <i class="text-yellow-500 poaDetail-change">20/03/2024 - 21/03/2024</i></b>
                </div>
            </div>
            <div class="space-x-4 text-sm">
                <b class="poaDetail-change">VI - Gestión administrativa institucional</b>
                <b class="poaDetail-change">Línea de acción 1.1</b>
                <b class="poaDetail-change">Proyecto/meta1.4</b>
                <!-- <b class="poaDetail-change">Línea de acción 1.1</b>
                <b class="poaDetail-change">Proyecto/meta1.4</b> -->
            </div>
            <div>
                <b class="text-orange-500">Observaciones</b>
                <p class="poaDetail-change">Lorem ipsum dolor sit amet consectetur adipisicing elit. Quidem blanditiis porro temporibus 
                    exercitationem? Veritatis magni qui repellat labore ipsum expedita illum quis repellendus? Repudiandae minus quis ut. Voluptatum, reprehenderit quia.
                </p>
            </div>
            <div class="flex flex-col space-y-2">
                <b class="text-orange-500">Conceptos</b>
                <button class="w-[14vh] h-8 border-2 border-green-700 rounded-md bg-custom_glass_green"> Ver conceptos</button>
            </div>
        </div>
        <div class="flex p-4 justify-center space-x-8">
            <div class="border-2 border-cyan-500 w-[13vh] h-[8vh] flex items-center justify-center text-center hover:bg-custom_glass_cyan cursor-pointer">Aprobar POA</div>
            <div class="border-2 border-red-500 w-[13vh] h-[8vh] flex items-center justify-center text-center hover:bg-custom_glass_red cursor-pointer">Sugerir Edición</div>
            <div class="border-2 border-green-600 w-[13vh] h-[8vh] flex items-center justify-center text-center hover:bg-custom_glass_green cursor-pointer">Imprimir en excel</div>
            <div class="border-2 border-yellow-500 w-[13vh] h-[8vh] flex items-center justify-center text-center hover:bg-custom_glass_yellow cursor-pointer">Función sugerida</div>
        </div>
    </div>
    <div id="searchResultsContainer" class="hidden space-y-4 max-h-[70vh] overflow-y-auto">
        
    </div>
</div>




