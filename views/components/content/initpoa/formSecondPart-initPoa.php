<div id="initPoa-second" class="hidden flex-col p-6 space-y-6 opacity-0 translate-y-4 transition-all duration-300 ease-in-out">
        <h2 class="text-xl font-semibold text-center">Planeación Operativa Anual (Conceptos/actividades)    </h2>
            <!-- Eje rector del PDI -->
        <div class="flex space-x-4">
            <div class="flex-1">
                <label for="eje-rector" class="block text-sm font-medium text-gray-300 mb-1">Eje Rector del PDI</label>
                <div class="flex items-center bg-gray-700 rounded-md border border-gray-600">
                    <span class="inline-flex items-center px-3 text-gray-400"><i class="bi bi-diagram-3"></i></span>
                    <select DB-action="fillLineaAccion" id="eje-rector" class="input-field hasDescription auto-fill input-fieldSelect flex-1 bg-gray-800 text-white focus:ring-blue-500 focus:border-blue-500 rounded-md border-none p-2.5">
                        <option selected disabled>EJe de ejemplo</option>
                        <option>Eje 1</option>
                        <option>Eje 2</option>
                    </select>
                </div>
            </div>
        </div>
            <!-- Línea de acción y proyecto o meta(PDI) -->
        <div class="flex space-x-4">
            <div class="flex-1">
                <label for="linea-accion" class="block text-sm font-medium text-gray-300 mb-1">Línea de acción del PDI</label>
                <div class="flex items-center bg-gray-700 rounded-md border border-gray-600">
                    <span class="inline-flex items-center px-3 text-gray-400"><i class="bi bi-diagram-3"></i></span>
                    <select DB-action="fillProyectoMeta" id="linea-accion" class="input-field hasDescription input-fieldSelect flex-1 bg-gray-800 text-white focus:ring-blue-500 focus:border-blue-500 rounded-md border-none p-2.5">
                        <option selected disabled>Línea de acción del PDI</option>
                        <option>línea 1</option>
                        <option>línea 2</option>
                    </select>
                </div>
            </div>

            <div class="flex-1">
                <label for="proyecto-meta" class="block text-sm font-medium text-gray-300 mb-1">Proyecto o meta del PDI</label>
                <div class="flex items-center bg-gray-700 rounded-md border border-gray-600">
                    <span class="inline-flex items-center px-3 text-gray-400"><i class="bi bi-diagram-2"></i></span>
                    <select  id="proyecto-meta" class="input-field hasDescription flex-1 bg-gray-800 text-white focus:ring-blue-500 focus:border-blue-500 rounded-md border-none p-2.5">
                        <option selected disabled>Proyecto / meta del PDI</option>
                        <option>proyecto 1</option>
                        <option>meta 2</option>
                    </select>
                </div>
            </div>
        </div>
        <!-- observaciones -->
        <div>
            <label for="observaciones" class="block text-sm font-medium text-gray-300 mb-1">Observaciones</label>
            <div class="flex items-center bg-gray-700 rounded-md border border-gray-600">
                <span class="h-36 inline-flex items-center px-3 text-gray-400"><i class="bi bi-textarea-t"></i></span>
                <textarea input-action="verifyLength" id="descripcion-observaciones" class="input-field h-36 flex-1 bg-gray-800 text-white focus:ring-blue-500 focus:border-blue-500 rounded-md border-none p-2.5" placeholder="Observaciones"></textarea>
            </div>
            <p id='errorMessage-descripcion-observaciones' class="error-message absolute left-0 mt-1 text-red-500 text-sm hidden">
                ⚠ Este campo debe contener entre 10 a 1000 caracteres.
            </p>
        </div>
        
        <div class="flex justify-between">
            <button onclick="initPoa_changeView('initPoa-second', 'initPoa-first',)" class="hover:bg-green-700 border-2 border-green-600 text-white font-semibold py-2 px-4 rounded-md">
                <i class="bi bi-arrow-left-short"></i> atrás 
            </button>
            <button onclick="initPoa_changeView('initPoa-second', 'initPoa-third',2)" class="hover:bg-green-700 border-2 border-green-600 text-white font-semibold py-2 px-4 rounded-md">
                siguiente<i class="bi bi-arrow-right-short"></i>
            </button>
        </div>
    </div>