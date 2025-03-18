
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
    <div class="grid grid-cols-2 gap-2 mt-auto">
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
</div>





<!--
  <h2 class="text-center font-bold text-lg uppercase">Planeación Operativa Anual de Actividades</h2>

  <div class="grid grid-cols-2 gap-4 text-sm mt-2 border border-gray-300 p-2">
    <div class="border border-gray-300 p-1"><strong>Fecha de elaboración:</strong> 21 de Noviembre de 2023</div>
    <div class="border border-gray-300 p-1"><strong>Ejercicio fiscal:</strong> 2024</div>
    <div class="col-span-2 border border-gray-300 p-1"><strong>Descripción general:</strong> Certificar el Sistema de Gestión de la Calidad de la Universidad...</div>
    <div class="border border-gray-300 p-1"><strong>Fecha de inicio:</strong> Noviembre</div>
    <div class="border border-gray-300 p-1"><strong>Fecha de término:</strong> Noviembre</div>
    <div class="border border-gray-300 p-1"><strong>Área:</strong> Rectoría</div>
    <div class="border border-gray-300 p-1"><strong>Subárea:</strong> Dirección de Gestión de la Calidad</div>
    <div class="border border-gray-300 p-1"><strong>Gasto Estratégico:</strong> ✔</div>
    <div class="border border-gray-300 p-1"><strong>Gasto Corriente:</strong> ✔</div>
    <div class="col-span-2 border border-gray-300 p-1"><strong>Eje Rector del POI:</strong> VI: Gestión Administrativa Institucional</div>
    <div class="col-span-2 border border-gray-300 p-1"><strong>Línea de Acción del POI:</strong> Implementación institucional...</div>
    <div class="col-span-2 border border-gray-300 p-1"><strong>Proyecto o Meta del POI:</strong> 1.4. Certificación de procesos administrativos.</div>
  </div>

  <div class="w-full mt-4">
    <table class="w-full border-collapse border border-gray-300">
      <thead>
        <tr>
          <th class="border border-gray-300 px-4 py-2">Concepto o Actividad</th>
          <th class="border border-gray-300 px-4 py-2">Tipo de cuenta</th>
          <th class="border border-gray-300 px-4 py-2">Fecha de Ejecución</th>
          <th class="border border-gray-300 px-4 py-2">Responsables</th>
          <th class="border border-gray-300 px-4 py-2">Cantidad</th>
          <th class="border border-gray-300 px-4 py-2">Unidad</th>
          <th class="border border-gray-300 px-4 py-2">Costo Unitario</th>
          <th class="border border-gray-300 px-4 py-2">Importes</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td class="border border-gray-300 px-4 py-2">Cuota de certificación del Sistema de Gestión</td>
          <td class="border border-gray-300 px-4 py-2">Servicios</td>
          <td class="border border-gray-300 px-4 py-2">Noviembre</td>
          <td class="border border-gray-300 px-4 py-2">Dirección de Gestión de la Calidad</td>
          <td class="border border-gray-300 px-4 py-2">1</td>
          <td class="border border-gray-300 px-4 py-2">Servicios</td>
          <td class="border border-gray-300 px-4 py-2">$111,000.00</td>
          <td class="border border-gray-300 px-4 py-2">$111,000.00</td>
        </tr>
        <tr>
          <td class="border border-gray-300 px-4 py-2">Hospedaje del equipo evaluador</td>
          <td class="border border-gray-300 px-4 py-2">Noches</td>
          <td class="border border-gray-300 px-4 py-2">Noviembre</td>
          <td class="border border-gray-300 px-4 py-2">Dirección de Gestión de la Calidad</td>
          <td class="border border-gray-300 px-4 py-2">6</td>
          <td class="border border-gray-300 px-4 py-2">Noches</td>
          <td class="border border-gray-300 px-4 py-2">$3,000.00</td>
          <td class="border border-gray-300 px-4 py-2">$18,000.00</td>
        </tr>
        <tr>
          <td class="border border-gray-300 px-4 py-2">Alimentos del equipo evaluador</td>
          <td class="border border-gray-300 px-4 py-2">Alimentos</td>
          <td class="border border-gray-300 px-4 py-2">Noviembre</td>
          <td class="border border-gray-300 px-4 py-2">Dirección de Gestión de la Calidad</td>
          <td class="border border-gray-300 px-4 py-2">42</td>
          <td class="border border-gray-300 px-4 py-2">Alimentos</td>
          <td class="border border-gray-300 px-4 py-2">$500.00</td>
          <td class="border border-gray-300 px-4 py-2">$21,000.00</td>
        </tr>
      </tbody>
    </table>
  </div>

  <div class="text-right font-bold mt-2">Costo estimado del proyecto: $309,500.00</div> -->