<div id="initPoa-first" class="flex flex-col p-6 space-y-6 opacity-100 translate-y-0 transition-all duration-300 ease-in-out">
        <!-- Título del formulario -->
        <h2 class="text-xl font-semibold text-center">Planeación Operativa Anual</h2>
        <!-- Fila: Fecha de elaboración y ejercicio fiscal -->
        <div class="flex space-x-4">
            <div class="flex-1">
                <label for="fecha-elaboracion" class="block text-sm font-medium text-gray-300 mb-1">Fecha de elaboración</label>
                <div class="flex items-center bg-gray-700 rounded-md border border-gray-600">
                    <span class="inline-flex items-center px-3 text-gray-400"><i class="bi bi-calendar"></i></span>
                    <input input-action='fillEjercicioFiscal' type="date" id="fecha-elaboracion" class="input-field flex-1 bg-gray-800 text-white focus:ring-blue-500 focus:border-blue-500 rounded-md border-none p-2.5">
                </div>
                <p id='errorMessage-fecha-elaboracion' class="error-message absolute left-0 mt-1 text-red-500 text-sm hidden">
                    ⚠ Este campo no puede estar vacío.
                </p>
            </div>

            <div class="flex-1">
                <label for="ejercicio-fiscal" class="block text-sm font-medium text-gray-300 mb-1">Ejercicio fiscal</label>
                <div class="flex items-center bg-gray-700 rounded-md border border-gray-600">
                    <span class="inline-flex items-center px-3 text-gray-400"><i class="bi bi-briefcase"></i></span>
                    <input readonly type="text" id="ejercicio-fiscal" class="input-field flex-1 bg-gray-800 text-white focus:ring-blue-500 focus:border-blue-500 rounded-md border-none p-2.5" placeholder="Ejercicio fiscal">
                </div>
            </div>
        </div>

        <!-- Descripción general -->
        <div>
            <label for="descripcion-general" class="block text-sm font-medium text-gray-300 mb-1">Descripción general</label>
            <div class="flex items-center bg-gray-700 rounded-md border border-gray-600">
                <span class="h-24 inline-flex items-center px-3 text-gray-400"><i class="bi bi-textarea-t"></i></span>
                <textarea input-action="verifyLength" id="descripcion-general" class="input-field h-24 flex-1 bg-gray-800 text-white focus:ring-blue-500 focus:border-blue-500 rounded-md border-none p-2.5" placeholder="Descripción general"></textarea>
            </div>
            <p id='errorMessage-descripcion-general' class="error-message absolute left-0 mt-1 text-red-500 text-sm hidden">
                ⚠ Este campo debe contener entre 10 a 1000 caracteres.
            </p>
        </div>

        <!-- Fila: Fecha de inicio y Fecha de término -->
        <div class="flex space-x-4">
            <div class="flex-1">
                <label for="fecha-inicio" class="block text-sm font-medium text-gray-300 mb-1">Fecha de inicio</label>
                <div class="flex items-center bg-gray-700 rounded-md border border-gray-600">
                    <span class="inline-flex items-center px-3 text-gray-400"><i class="bi bi-calendar-check"></i></span>
                    <input input-action="generalDateFormat" type="date" id="fecha-inicio" class="input-field flex-1 bg-gray-800 text-white focus:ring-blue-500 focus:border-blue-500 rounded-md border-none p-2.5">
                </div>
                <p id='errorMessage-fecha-inicio' class="error-message absolute left-0 mt-1 text-red-500 text-sm hidden">
                    ⚠ Este campo no puede estar vacío. 
                </p>
            </div>

            <div class="flex-1">
                <label for="fecha-termino" class="block text-sm font-medium text-gray-300 mb-1">Fecha de término</label>
                <div class="flex items-center bg-gray-700 rounded-md border border-gray-600">
                    <span class="inline-flex items-center px-3 text-gray-400"><i class="bi bi-calendar-x"></i></span>
                    <input input-action="compareFechaInicio" type="date" id="fecha-termino" class="input-field flex-1 bg-gray-800 text-white focus:ring-blue-500 focus:border-blue-500 rounded-md border-none p-2.5">
                </div>
                <p id='errorMessage-fecha-termino' class="error-message left-2 mt-1 text-red-500 text-sm hidden">
                    ⚠ Este campo no puede estar vacío ni ser menor a fechaInicio. 
                </p>
            </div>
        </div>
        

        <!-- Área y Sub área (Selects) -->
        <div class="flex space-x-4">
            <div class="flex-1">
                <label for="area" class="block text-sm font-medium text-gray-300 mb-1">Área</label>
                <div class="flex items-center bg-gray-700 rounded-md border border-gray-600">
                    <span class="inline-flex items-center px-3 text-gray-400"><i class="bi bi-diagram-3"></i></span>
                    <select DB-action="fillSubArea" id="area" class="auto-fill input-field input-fieldSelect flex-1 bg-gray-800 text-white focus:ring-blue-500 focus:border-blue-500 rounded-md border-none p-2.5">
                        <option selected disabled>Área de ejemplo</option>
                        <option>Área 1</option>
                        <option>Área 2</option>
                    </select>
                </div>
                <p id='errorMessage-area' class="error-message absolute left-0 mt-1 text-red-500 text-sm hidden">
                    ⚠ Este campo no puede estar vacío. 
                </p>
            </div>

            <div class="flex-1">
                <label for="sub-area" class="block text-sm font-medium text-gray-300 mb-1">Sub área</label>
                <div class="flex items-center bg-gray-700 rounded-md border border-gray-600">
                    <span class="inline-flex items-center px-3 text-gray-400"><i class="bi bi-diagram-2"></i></span>
                    <select input-action="" id="sub-area" class="input-field flex-1 bg-gray-800 text-white focus:ring-blue-500 focus:border-blue-500 rounded-md border-none p-2.5">
                        <option selected disabled>Sub área de ejemplo</option>
                        <option>Sub área 1</option>
                        <option>Sub área 2</option>
                    </select>
                </div>
                <p id='errorMessage-sub-area' class="error-message left-0 mt-1 text-red-500 text-sm hidden">
                    ⚠ Este campo no puede estar vacío. 
                </p>
            </div>
        </div>


        <!-- Tipo de gasto (Switch) -->
    <div>
        <label class="block text-sm font-medium text-gray-300 mb-2">Tipo de gasto</label>
        <div class="flex bg-gray-700 rounded-md border border-gray-600 p-2">
            <!-- Opción: Gasto estratégico -->
            <label class="flex-1 cursor-pointer text-center">
                <input type="radio" value='ESTRATEGICO' name="tipo_gasto" id="estrategico" class="input-field hidden peer">
                <span class="hover:border-green-600 peer-checked:bg-green-600 peer-checked:text-white block px-4 py-2 bg-gray-600 border-2 border-gray-500 rounded-l-md text-sm">Estratégico</span>
            </label>

            <!-- Opción: Gasto corriente -->
            <label class="flex-1 cursor-pointer text-center">
                <input type="radio" value='CORRIENTE' name="tipo_gasto" id="corriente" class="input-field hidden peer">
                <span class="hover:border-green-600 peer-checked:bg-green-600 peer-checked:text-white block px-4 py-2 bg-gray-600 border-2 border-gray-500 rounded-r-md text-sm">Corriente</span>
            </label>
        </div>


                <!-- Botón de siguiente -->
        <div class="flex justify-end mt-8">
            <button id="btnValidate" onclick="initPoa_changeView('initPoa-first', 'initPoa-second', 1)" class="hover:bg-green-700 border-2 border-green-600 text-white font-semibold py-2 px-4 rounded-md">
                siguiente <i class="bi bi-arrow-right-short"></i>
            </button>
        </div>
    </div>
</div>