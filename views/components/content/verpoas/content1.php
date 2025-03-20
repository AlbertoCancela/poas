
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
        <button class="bg-gray-800 text-gray-200 p-3 rounded-md border border-blue-600">
            Aprobar POA
        </button>
        <button class="bg-gray-800 text-gray-200 p-3 rounded-md border border-green-600">
            Sugerir Edición
        </button>
        <button class="bg-gray-800 text-gray-200 p-3 rounded-md border border-gray-600">
            Imprimir Excel
        </button>
        <button class="bg-gray-800 text-gray-200 p-3 rounded-md border border-gray-600">
            <!-- Espacio vacío si no hay contenido -->
        </button>
    </div>
</div>

<!-- Contenedor de resultados (derecha, 8/12 del ancho total) -->
<div class="bg-gray-300 basis-8/12 shadow-lg rounded-lg p-4 overflow-y-auto max-h-[90vh]">
    <h2 class="text-gray-700 text-lg font-semibold mb-4 text-right">RESULTADOS DE BÚSQUEDA</h2>
    <div id="searchResultsContainer" class="space-y-4 max-h-[70vh] overflow-y-auto">
        <!-- Tarjetas de resultados -->
        <div class="bg-gray-700 text-white p-4 rounded-md shadow-md flex justify-between items-center">
            <div>
                <p class="text-green-400 font-bold">12345</p>
                <p class="font-semibold">Coordinación de Sistemas</p>
                <p class="text-sm">Alberto Josué Cancela Arredondo</p>
                <p class="text-xs text-gray-300">Certificación de procesos administrativos.</p>
            </div>
            <p class="text-gray-300 text-lg">2026</p>
        </div>

        <div class="bg-gray-700 text-white p-4 rounded-md shadow-md flex justify-between items-center">
            <div>
                <p class="text-green-400 font-bold">54321</p>
                <p class="font-semibold">Dirección de Gestión de la Calidad</p>
                <p class="text-sm">Daniel Zamora</p>
                <p class="text-xs text-gray-300">Certificación de procesos administrativos.</p>
            </div>
            <p class="text-gray-300 text-lg">2026</p>
        </div>

        <div class="bg-gray-700 text-white p-4 rounded-md shadow-md flex justify-between items-center">
            <div>
                <p class="text-green-400 font-bold">54321</p>
                <p class="font-semibold">Dirección de Gestión de la Calidad</p>
                <p class="text-sm">Daniel Zamora</p>
                <p class="text-xs text-gray-300">Certificación de procesos administrativos.</p>
            </div>
            <p class="text-gray-300 text-lg">2025</p>
        </div>

        <div class="bg-gray-700 text-white p-4 rounded-md shadow-md flex justify-between items-center">
            <div>
                <p class="text-green-400 font-bold">12345</p>
                <p class="font-semibold">Coordinación de Sistemas</p>
                <p class="text-sm">Alberto Josué Cancela Arredondo</p>
                <p class="text-xs text-gray-300">Certificación de procesos administrativos.</p>
            </div>
            <p class="text-gray-300 text-lg">2024</p>
        </div>
    </div>
    <div id="searchResultsContainer" class="hidden space-y-4 max-h-[70vh] overflow-y-auto p-4">
    <div class="bg-gray-700 text-white p-6 rounded-lg shadow-lg">
      <div class="flex justify-between items-center border-b border-gray-600 pb-2 mb-4">
        <span class="text-lg font-semibold text-green-400">1003</span>
        <span class="text-green-400 font-semibold">Estratégico</span>
      </div>
      <h2 class="text-xl font-bold">COORDINACIÓN DE SISTEMAS, REDES Y DESARROLLO TECNOLÓGICO</h2>
      <p class="text-gray-300 mt-2">Alberto Josué Cancela Arredondo</p>
      <p class="text-gray-400">Gestión administrativa institucional</p>
      <p class="text-gray-400 mt-2">Proyecto/meta <span class="text-yellow-400 ">1.4</span></p>
      <div class="flex justify-between text-gray-400 mt-2 text-sm">
        <p>Fecha de creación: <span class="text-yellow-400">20/03/2024</span></p>
        <p>Ejercicio Fiscal: <span class="text-yellow-400">2025</span></p>
        <p>Fecha de ejecución: <span class="text-yellow-400">20/03/2024 - 21/03/2024</span></p>
      </div>
      <p class="text-gray-400 mt-4 text-sm">
        Lorem ipsum dolo dolo dolo dolo dolooooo Lorem ipsum dolo dolo dolo dolo dolo dolo...
      </p>
    </div>
    <div class="bg-gray-700 p-6 rounded-lg shadow-lg">
  <select class="w-full bg-gray-800 text-white p-2 rounded-md border border-gray-600">
    <option>Seleccionar concepto del POA</option>
  </select>
  
  <div class="grid grid-cols-2 gap-4 mt-4">
    <input type="text" placeholder="Tipo de cuenta" class="bg-gray-800 text-white p-2 rounded-md border border-gray-600 w-full" />
    <input type="text" placeholder="Unidad" class="bg-gray-800 text-white p-2 rounded-md border border-gray-600 w-full" />
  </div>
  
  <div class="grid grid-cols-2 gap-4 mt-4">
    <input type="text" placeholder="Fecha de ejecución inicial" class="bg-gray-800 text-white p-2 rounded-md border border-gray-600 w-full" />
    <input type="text" placeholder="Fecha de ejecución final" class="bg-gray-800 text-white p-2 rounded-md border border-gray-600 w-full" />
  </div>
  
  <div class="grid grid-cols-2 gap-4 mt-4">
    <input type="text" placeholder="Cantidad" class="bg-gray-800 text-white p-2 rounded-md border border-gray-600 w-full" />
    <input type="text" placeholder="Costo unitario" class="bg-gray-800 text-white p-2 rounded-md border border-gray-600 w-full" />
    <input type="text" placeholder="Importe" class="bg-gray-800 text-white p-2 rounded-md border border-gray-600 w-full col-span-2" />
  </div>
  
  <textarea placeholder="Concepto o actividad" class="bg-gray-800 text-white p-2 rounded-md border border-gray-600 w-full mt-4 h-24"></textarea>
  
  <div class="mt-4">
    <p class="text-white">Responsables</p>
    <div class="grid grid-cols-1 md:grid-cols-1 gap-2">
      <input type="text" placeholder="Responsable 1" class="bg-gray-800 text-white p-2 rounded-md border border-gray-600 w-full" />
      <input type="text" placeholder="Responsable 2" class="bg-gray-800 text-white p-2 rounded-md border border-gray-600 w-full" />
      <input type="text" placeholder="Responsable 3" class="bg-gray-800 text-white p-2 rounded-md border border-gray-600 w-full" />
    </div>
  </div>
</div>
  </div>

</div>


