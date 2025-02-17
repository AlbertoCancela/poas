<!-- Modal to show concepts/activities -->
<div id="conceptActivities" class="modal fixed inset-0 flex items-center justify-center bg-black bg-opacity-50 opacity-0 invisible transition-opacity duration-300 ease-out">
    <div class="modal-content flex flex-col bg-white p-6 rounded-lg shadow-lg w-96 transform scale-95 transition-transform duration-300 ease-out h-96">
        
        <!-- Encabezado del Modal -->
        <div class="flex-1">
            <h2 class="text-xl font-bold mb-4">Mis Conceptos y Actividades</h2>
        </div>

        <!-- Contenido con Collapsibles -->
        <div class="basis-8/12 flex flex-col space-y-2 overflow-y-auto">
            <!-- Concepto 1 -->
            <div class="border rounded-lg">
                <button class="toggle-collapse w-full text-left p-3 bg-gray-100 hover:bg-gray-200 rounded-t-lg flex justify-between items-center">
                    <span>Concepto 1</span>
                    <span class="arrow transition-transform duration-300">▼</span>
                </button>
                <div class="collapse-content hidden p-3 bg-gray-50">
                    <p>Descripción o contenido del concepto 1.</p>
                </div>
            </div>

            <!-- Concepto 2 -->
            <div class="border rounded-lg">
                <button class="toggle-collapse w-full text-left p-3 bg-gray-100 hover:bg-gray-200 rounded-t-lg flex justify-between items-center">
                    <span>Concepto 2</span>
                    <span class="arrow transition-transform duration-300">▼</span>
                </button>
                <div class="collapse-content hidden p-3 bg-gray-50">
                    <p>Detalles sobre el concepto 2.</p>
                </div>
            </div>

            <!-- Concepto 3 -->
            <div class="border rounded-lg">
                <button class="toggle-collapse w-full text-left p-3 bg-gray-100 hover:bg-gray-200 rounded-t-lg flex justify-between items-center">
                    <span>Concepto 3</span>
                    <span class="arrow transition-transform duration-300">▼</span>
                </button>
                <div class="collapse-content hidden p-3 bg-gray-50">
                    <p>Contenido adicional del concepto 3.</p>
                </div>
            </div>
        </div>

        <!-- Botón para cerrar el modal -->
        <div class="flex-1 flex justify-end items-end">
            <button class="close-modal px-4 py-2 bg-red-500 text-white rounded-lg hover:bg-red-600 h-10" data-modal="conceptActivities">
                Cerrar
            </button>
        </div>
    </div>
</div>
