<div class="flex flex-col bg-gray-700 basis-8/12 shadow-custom_medium rounded-md font-roboto text-white">
<div class="first flex flex-col p-6 space-y-6">

    <!-- Título del formulario -->
    <h2 class="text-xl font-semibold text-center">Planeación Operativa Anual</h2>
    <!-- Fila: Fecha de elaboración y ejercicio fiscal -->
    <div class="flex space-x-4">
        <div class="flex-1">
            <label for="fecha-elaboracion" class="block text-sm font-medium text-gray-300 mb-1">Fecha de elaboración</label>
            <div class="flex items-center bg-gray-700 rounded-md border border-gray-600">
                <span class="inline-flex items-center px-3 text-gray-400"><i class="bi bi-calendar"></i></span>
                <input type="date" id="fecha-elaboracion" class="flex-1 bg-gray-800 text-white focus:ring-blue-500 focus:border-blue-500 rounded-md border-none p-2.5">
            </div>
        </div>

        <div class="flex-1">
            <label for="ejercicio-fiscal" class="block text-sm font-medium text-gray-300 mb-1">Ejercicio fiscal</label>
            <div class="flex items-center bg-gray-700 rounded-md border border-gray-600">
                <span class="inline-flex items-center px-3 text-gray-400"><i class="bi bi-briefcase"></i></span>
                <input type="text" id="ejercicio-fiscal" class="flex-1 bg-gray-800 text-white focus:ring-blue-500 focus:border-blue-500 rounded-md border-none p-2.5" placeholder="Ejercicio fiscal">
            </div>
        </div>
    </div>

    <!-- Descripción general -->
    <div>
        <label for="descripcion-general" class="block text-sm font-medium text-gray-300 mb-1">Descripción general</label>
        <div class="flex items-center bg-gray-700 rounded-md border border-gray-600">
            <span class="inline-flex items-center px-3 text-gray-400"><i class="bi bi-textarea-t"></i></span>
            <textarea id="descripcion-general" class="flex-1 bg-gray-800 text-white focus:ring-blue-500 focus:border-blue-500 rounded-md border-none p-2.5" placeholder="Descripción general"></textarea>
        </div>
    </div>

    <!-- Fila: Fecha de inicio y Fecha de término -->
    <div class="flex space-x-4">
        <div class="flex-1">
            <label for="fecha-inicio" class="block text-sm font-medium text-gray-300 mb-1">Fecha de inicio</label>
            <div class="flex items-center bg-gray-700 rounded-md border border-gray-600">
                <span class="inline-flex items-center px-3 text-gray-400"><i class="bi bi-calendar-check"></i></span>
                <input type="date" id="fecha-inicio" class="flex-1 bg-gray-800 text-white focus:ring-blue-500 focus:border-blue-500 rounded-md border-none p-2.5">
            </div>
        </div>

        <div class="flex-1">
            <label for="fecha-termino" class="block text-sm font-medium text-gray-300 mb-1">Fecha de término</label>
            <div class="flex items-center bg-gray-700 rounded-md border border-gray-600">
                <span class="inline-flex items-center px-3 text-gray-400"><i class="bi bi-calendar-x"></i></span>
                <input type="date" id="fecha-termino" class="flex-1 bg-gray-800 text-white focus:ring-blue-500 focus:border-blue-500 rounded-md border-none p-2.5">
            </div>
        </div>
    </div>

    <!-- Área y Sub área (Selects) -->
    <div class="flex space-x-4">
        <div class="flex-1">
            <label for="area" class="block text-sm font-medium text-gray-300 mb-1">Área</label>
            <div class="flex items-center bg-gray-700 rounded-md border border-gray-600">
                <span class="inline-flex items-center px-3 text-gray-400"><i class="bi bi-diagram-3"></i></span>
                <select id="area" class="flex-1 bg-gray-800 text-white focus:ring-blue-500 focus:border-blue-500 rounded-md border-none p-2.5">
                    <option>Área de ejemplo</option>
                    <option>Área 1</option>
                    <option>Área 2</option>
                </select>
            </div>
        </div>

        <div class="flex-1">
            <label for="sub-area" class="block text-sm font-medium text-gray-300 mb-1">Sub área</label>
            <div class="flex items-center bg-gray-700 rounded-md border border-gray-600">
                <span class="inline-flex items-center px-3 text-gray-400"><i class="bi bi-diagram-2"></i></span>
                <select id="sub-area" class="flex-1 bg-gray-800 text-white focus:ring-blue-500 focus:border-blue-500 rounded-md border-none p-2.5">
                    <option>Sub área de ejemplo</option>
                    <option>Sub área 1</option>
                    <option>Sub área 2</option>
                </select>
            </div>
        </div>
    </div>

    <!-- Tipo de gasto (Switch) -->
    <div>
    <label class="block text-sm font-medium text-gray-300 mb-2">Tipo de gasto</label>
    <div class="flex bg-gray-700 rounded-md border border-gray-600 p-2">
        <!-- Opción: Gasto estratégico -->
        <label class="flex-1 cursor-pointer text-center">
            <input type="radio" name="tipo_gasto" id="gasto-estrategico" class="hidden peer">
            <span class="peer-checked:bg-green-600 peer-checked:text-white block px-4 py-2 bg-gray-600 border-2 border-gray-500 rounded-l-md text-sm">Estratégico</span>
        </label>

        <!-- Opción: Gasto corriente -->
        <label class="flex-1 cursor-pointer text-center">
            <input type="radio" name="tipo_gasto" id="gasto-corriente" class="hidden peer">
            <span class="peer-checked:bg-green-600 peer-checked:text-white block px-4 py-2 bg-gray-600 border-2 border-gray-500 rounded-r-md text-sm">Corriente</span>
        </label>
    </div>
</div>

    <!-- Botón de siguiente -->
    <div class="flex justify-end">
        <button class="hover:bg-green-700 border-2 border-green-600 text-white font-semibold py-2 px-4 rounded-md">
            Siguiente <i class="bi bi-arrow-right-short"></i>
        </button>
    </div>
</div>
</div>

<div class="bg-custom_gray basis-3/12 shadow-custom_medium rounded-md"></div>
