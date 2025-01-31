document.addEventListener('DOMContentLoaded', () => {
    const toggleButton = document.getElementById('toggle-poas');
    const submenu = document.getElementById('submenu-poas');

    toggleButton.addEventListener('click', () => {
        if (submenu.classList.contains('max-h-0')) {
            submenu.classList.remove('max-h-0', 'opacity-0');
            submenu.classList.add('max-h-40', 'opacity-100');  // Ajusta la altura máxima según tu contenido
        } else {
            submenu.classList.remove('max-h-40', 'opacity-100');
            submenu.classList.add('max-h-0', 'opacity-0');
        }
    });
});