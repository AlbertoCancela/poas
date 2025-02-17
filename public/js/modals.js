document.addEventListener("DOMContentLoaded", () => {
    const openButtons = document.querySelectorAll(".open-modal");
    const closeButtons = document.querySelectorAll(".close-modal");
    const modals = document.querySelectorAll(".modal");

    // Abrir modal
    openButtons.forEach(button => {
        button.addEventListener("click", () => {
            const modal = document.getElementById(button.dataset.modal);
            modal.classList.remove("invisible", "opacity-0");
            modal.classList.add("opacity-100");
            modal.querySelector(".modal-content").classList.remove("scale-95");
            modal.querySelector(".modal-content").classList.add("scale-100");
        });
    });

    // Cerrar modal
    closeButtons.forEach(button => {
        button.addEventListener("click", () => {
            const modal = document.getElementById(button.dataset.modal);
            modal.classList.remove("opacity-100");
            modal.classList.add("opacity-0");
            modal.querySelector(".modal-content").classList.remove("scale-100");
            modal.querySelector(".modal-content").classList.add("scale-95");

            // Esconde el modal después de la animación
            setTimeout(() => {
                modal.classList.add("invisible");
            }, 300);
        });
    });

    // Cerrar modal haciendo clic fuera del contenido
    modals.forEach(modal => {
        modal.addEventListener("click", (e) => {
            if (e.target === modal) {
                modal.classList.remove("opacity-100");
                modal.classList.add("opacity-0");
                modal.querySelector(".modal-content").classList.remove("scale-100");
                modal.querySelector(".modal-content").classList.add("scale-95");

                setTimeout(() => {
                    modal.classList.add("invisible");
                }, 300);
            }
        });
    });
});