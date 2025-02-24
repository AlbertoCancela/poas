<div id="initPoa-third" class="hidden flex-col p-6 space-y-6 opacity-0 translate-y-4 transition-all duration-300 ease-in-out">
        <h2 class="text-xl font-semibold text-center">Planeación Operativa Anual (Conceptos/actividades)    </h2>
            <!-- Tipo de cuenta -->
        <div class="flex space-x-4">
            <div class="flex-1">
                <label for="tipo-cuenta" class="block text-sm font-medium text-gray-300 mb-1">Tipo de cuenta</label>
                <div class="flex items-center bg-gray-700 rounded-md border border-gray-600">
                    <span class="inline-flex items-center px-3 text-gray-400"><i class="bi bi-diagram-3"></i></span>
                    <select id="tipo-cuenta" class="auto-fill flex-1 bg-gray-800 text-white focus:ring-blue-500 focus:border-blue-500 rounded-md border-none p-2.5">
                        <option selected disabled>Cuenta ejemplo</option>
                        <option>cuenta 1</option>
                        <option>cuenta 2</option>
                    </select>
                </div>
            </div>
        </div>
        <!-- Concepto o actividad -->
        <div class="flex space-x-4">
            <div class="flex-1">
                <label for="fecha-ejecucion" class="block text-sm font-medium text-gray-300 mb-1">Fecha de ejecución</label>
                <div class="flex items-center bg-gray-700 rounded-md border border-gray-600">
                    <span class="inline-flex items-center px-3 text-gray-400"><i class="bi bi-diagram-3"></i></span>
                    <select id="fecha-ejecucion" class="auto-fill flex-1 bg-gray-800 text-white focus:ring-blue-500 focus:border-blue-500 rounded-md border-none p-2.5">
                        <option selected disabled>Mes de ejecución</option>
                        <option>Mes 1</option>
                        <option>Mes 2</option>
                    </select>
                </div>
            </div>
            <div class="flex-1">
                <label for="observaciones" class="block text-sm font-medium text-gray-300 mb-1">Concepto o actividad</label>
                <div class="flex items-center bg-gray-700 rounded-md border border-gray-600">
                    <span class="h-16 inline-flex items-center px-3 text-gray-400"><i class="bi bi-textarea-t"></i></span>
                    <textarea id="descripcion-general" class="h-16 flex-1 bg-gray-800 text-white focus:ring-blue-500 focus:border-blue-500 rounded-md border-none p-2.5" placeholder="Concepto o actividad"></textarea>
                </div>
            </div>
        </div>
        
        <!-- Unidad y cantidad -->
        <div class="flex space-x-4">
            <div class="flex-1">
                <label for="unidad" class="block text-sm font-medium text-gray-300 mb-1">Unidad</label>
                <div class="flex items-center bg-gray-700 rounded-md border border-gray-600">
                    <span class="inline-flex items-center px-3 text-gray-400"><i class="bi bi-diagram-3"></i></span>
                    <select id="unidad" class="auto-fill flex-1 bg-gray-800 text-white focus:ring-blue-500 focus:border-blue-500 rounded-md border-none p-2.5">
                        <option selected disabled>Unidad</option>
                        <option>Unidad 1</option>
                        <option>Unidad 2</option>
                    </select>
                </div>
            </div>
            <div class="flex-1">
                <label for="cantidad" class="block text-sm font-medium text-gray-300 mb-1">Cantidad</label>
                <div class="flex items-center bg-gray-700 rounded-md border border-gray-600">
                    <span class="inline-flex items-center px-3 text-gray-400"><i class="bi bi-briefcase"></i></span>
                    <input type="text" id="cantidad" class="flex-1 bg-gray-800 text-white focus:ring-blue-500 focus:border-blue-500 rounded-md border-none p-2.5" placeholder="Cantidad">
                </div>
            </div>
            <div class="flex-1">
                <label for="costo-unitario" class="block text-sm font-medium text-gray-300 mb-1">Costo unitario</label>
                <div class="flex items-center bg-gray-700 rounded-md border border-gray-600">
                    <span class="inline-flex items-center px-3 text-gray-400"><i class="bi bi-briefcase"></i></span>
                    <input input-action="fillImportes" type="text" id="costo-unitario" class="input-field flex-1 bg-gray-800 text-white focus:ring-blue-500 focus:border-blue-500 rounded-md border-none p-2.5" placeholder="Costo unitario">
                </div>
            </div>
            <div class="flex-1">
                <label for="importes" class="block text-sm font-medium text-gray-300 mb-1">Importes</label>
                <div class="flex items-center bg-gray-700 rounded-md border border-gray-600">
                    <span class="inline-flex items-center px-3 text-gray-400"><i class="bi bi-briefcase"></i></span>
                    <input readonly type="text" id="importes" class=" flex-1 bg-gray-800 text-white focus:ring-blue-500 focus:border-blue-500 rounded-md border-none p-2.5" placeholder="Importes" value="">
                </div>
            </div>
        </div>

        <div class="flex space-x-4">
            <div class="flex-1">
                <label for="responsable-tagContainer" class="block text-sm font-medium text-gray-300 mb-1">Responsables</label>
                <div class="flex items-center bg-gray-700 rounded-md border border-gray-600 p-2 flex-wrap gap-2">
                    <span class="inline-flex items-center px-3 text-gray-400"><i class="bi bi-briefcase"></i></span>
                    <div id="selected-tags" class="flex flex-wrap gap-1"></div>
                    <input type="text" id="responsable-search" class="flex-1 bg-gray-800 text-white focus:ring-blue-500 focus:border-blue-500 rounded-md border-none p-2.5 outline-none" placeholder="Buscar responsables">
                </div>
                <div id="suggestions" class="bg-gray-800 text-white mt-1 rounded-md shadow-md hidden max-h-40 overflow-auto"></div>
            </div>
        </div>
        
        <div class="flex justify-between h-24">
            <button onclick="initPoa_changeView('initPoa-third', 'initPoa-second')" class="hover:bg-green-700 border-2 border-green-600 text-white font-semibold py-2 px-4 rounded-md h-3/6">
                <i class="bi bi-arrow-left-short"></i> atrás
            </button>
            <div class="flex flex-col items-end">
                <button data-modal="" class="hover:bg-blue-400 border-2 border-blue-600 text-white font-semibold py-2 px-4 rounded-md">
                    Añadir concepto/actividad <i class="bi bi-plus-circle"></i>  
                </button>
                <button data-modal="conceptActivities" class="open-modal hover:bg-blue-400 border-2 border-blue-600 text-white font-semibold py-2 px-4 rounded-md w-9/12 mt-1">
                    Mis conceptos<i class="bi bi-list"></i>  
                </button>
            </div>
        </div>
        <div class="flex space-x-4">
            <div class="flex flex-1 justify-center items-center">
                <button onclick="defineUsers()" class="hover:bg-green-700 border-2 border-green-600 text-white font-semibold py-2 px-2 h-24 rounded-full">
                    Finalizar
                </button>
            </div>
        </div>
    </div>