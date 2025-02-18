<div class="bg-custom_gray basis-8/12 shadow-custom_medium rounded-md p-4 overflow-y-auto max-h-[screen]"></div>



<div class="bg-custom_gray basis-3/12 shadow-custom_medium rounded-md p-4">
        <h2 class="text-lg font-semibold text-gray-800 mb-4">Notificaciones</h2>
        <div class="space-y-4">
            <div class="bg-gray-700 text-white p-4 rounded-md shadow-md opacity-0 animate-fade-in h-auto flex flex-col  transition-transform hover:scale-105 hover:shadow-lg hover:cursor-pointer">
                <p class=" text-green-600 font-bold">Tipo de notificación</p>
                <p>Esta es una pequeña descripción de un test</p>
            </div>
            <div class="bg-gray-700 text-white p-4 rounded-md shadow-md opacity-0 animate-fade-in delay-100 h-auto flex flex-col transition-transform hover:scale-105 hover:shadow-lg hover:cursor-pointer">
                <p class=" text-pink-600 font-bold">Tipo de notificación</p>
                <p>Esta es una pequeña descripción de un test</p>
            </div>
            <div class="bg-gray-700 text-white p-4 rounded-md shadow-md opacity-0 animate-fade-in delay-200 h-auto flex flex-col transition-transform hover:scale-105 hover:shadow-lg hover:cursor-pointer">
                <p class=" text-blue-600 font-bold">Tipo de notificación</p>
                <p>Esta es una pequeña descripción de un test</p>
            </div>
            <div class="bg-gray-700 text-white p-4 rounded-md shadow-md opacity-0 animate-fade-in delay-300 h-auto flex flex-col transition-transform hover:scale-105 hover:shadow-lg hover:cursor-pointer">
                <p class=" text-purple-600 font-bold">Tipo de notificación</p>
                <p>Esta es una pequeña descripción de un test</p>
            </div>
            <div class="bg-gray-700 text-white p-4 rounded-md shadow-md opacity-0 animate-fade-in delay-400 h-auto flex flex-col transition-transform hover:scale-105 hover:shadow-lg hover:cursor-pointer">
                <p class=" text-cyan-600 font-bold">Tipo de notificación</p>
                <p>Esta es una pequeña descripción de un test</p>
            </div>
            <div class="bg-gray-700 text-white p-4 rounded-md shadow-md opacity-0 animate-fade-in delay-500 h-auto flex flex-col  transition-transform hover:scale-105 hover:shadow-lg hover:cursor-pointer">
                <p class=" text-green-600 font-bold">Tipo de notificación</p>
                <p>Esta es una pequeña descripción de un test</p>
            </div>
        </div>
    </div>

    <style>
        @keyframes fade-in {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .animate-fade-in {
            animation: fade-in 0.6s ease-out forwards;
        }

        .delay-100 { animation-delay: 0.1s; }
        .delay-200 { animation-delay: 0.2s; }
        .delay-300 { animation-delay: 0.3s; }
        .delay-400 { animation-delay: 0.4s; }
        .delay-500 { animation-delay: 0.5s; }
    </style>