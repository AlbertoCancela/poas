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

    const toggleButtons = document.querySelectorAll(".toggle-collapse");

    toggleButtons.forEach(button => {
        button.addEventListener("click", () => {
            const content = button.nextElementSibling;
            const arrow = button.querySelector(".arrow");

            if (content.classList.contains("hidden")) {
                content.classList.remove("hidden");
                content.style.maxHeight = "0px";
                content.style.opacity = "0";
                content.style.transform = "translateY(-10px)";

                setTimeout(() => {
                    content.classList.add("block");
                    content.style.transition = "max-height 0.5s cubic-bezier(0.4, 0, 0.2, 1), opacity 0.4s ease, transform 0.4s ease";
                    content.style.maxHeight = content.scrollHeight + "px";
                    content.style.opacity = "1";
                    content.style.transform = "translateY(0)";
                }, 10);

                arrow.classList.add("rotate-180");
            } else {
                content.style.maxHeight = content.scrollHeight + "px";
                content.style.opacity = "1";
                content.style.transform = "translateY(0)";

                setTimeout(() => {
                    content.style.transition = "max-height 0.4s cubic-bezier(0.4, 0, 0.2, 1), opacity 0.3s ease, transform 0.3s ease";
                    content.style.maxHeight = "0px";
                    content.style.opacity = "0";
                    content.style.transform = "translateY(-10px)";
                }, 10);

                setTimeout(() => {
                    content.classList.remove("block");
                    content.classList.add("hidden");
                }, 400);

                arrow.classList.remove("rotate-180");
            }
        });
    })
});

function showPoasDetails() {
    
}

// Función para cerrar el modal
function closeModal() {
    const modal = document.getElementById("showPoasDetails");

    modal.classList.remove("opacity-100", "visible", "scale-100");
    modal.classList.add("opacity-0", "invisible");
}
