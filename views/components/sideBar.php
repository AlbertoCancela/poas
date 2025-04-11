<aside class="basis-2/12 flex flex-col bg-custom_blueUH text-white p-4">
            <div class="flex-1 "><img src="../public/images/uhSquareLogo.png" alt=""></div>
            <div class="basis-6/12 ">
                <nav class="flex h-full flex-col items-center justify-center p-2 space-y-2 text-xl font-roboto">
                    <!-- Opción: Inicio -->
                    <a href="index.php" class="block p-3 border-b-2 border-transparent hover:border-green-600 ease-out duration-75">
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
                        <div id="submenu-poas" class="max-h-0 opacity-0 bg-custom_glass flex-col mt-2 space-y-1 overflow-hidden transition-all duration-600 ease-in-out">
                            <a href="verPoas.php" class="block px-4 py-2 border-b-2 border-transparent hover:border-green-600">Ver POA's</a>
                            <a href="initPoa.php" class="block px-4 py-2 border-b-2 border-transparent hover:border-green-600">Nuevo</a>
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