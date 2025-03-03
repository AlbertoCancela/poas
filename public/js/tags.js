document.addEventListener("DOMContentLoaded", () => {
    const input = document.getElementById("responsable-search");
    const suggestionsContainer = document.getElementById("suggestions");
    const selectedTagsContainer = document.getElementById("selected-tags");    

    async function getSuggestions() {
        try {
            const autofill = new AutoFill(); // Crear la instancia
            let suggestions = await autofill.obtainUsersData(); // Llamar al método asíncrono
            return suggestions;
        } catch (error) {
            console.error("Error obteniendo usuarios:", error);
            return [];
        }
    }
    getSuggestions().then(suggestions => {
        input.addEventListener("input", () => {
            const query = input.value.toLowerCase();
            suggestionsContainer.innerHTML = "";
            if (query.length === 0) {
                suggestionsContainer.classList.add("hidden");
                return;
            }
    
            const filteredSuggestions = suggestions.filter(item => item.toLowerCase().includes(query));
    
            if (filteredSuggestions.length === 0) {
                suggestionsContainer.classList.add("hidden");
                return;
            }
    
            filteredSuggestions.forEach(item => {
                const div = document.createElement("div");
                div.textContent = item;
                div.className = "cursor-pointer p-2 hover:bg-gray-600";
                div.addEventListener("click", () => addTag(item));
                suggestionsContainer.appendChild(div);
            });
    
            suggestionsContainer.classList.remove("hidden");
            suggestionsContainer.classList.add("absolute");
        });
    
        function addTag(name) {
            if ([...selectedTagsContainer.children].some(tag => tag.dataset.name === name)) return;
    
            const tag = document.createElement("span");
            tag.className = "bg-blue-600 text-white text-sm px-2 py-1 rounded-md flex items-center gap-2 userTag";
            tag.dataset.name = name;
            tag.innerHTML = `${name} <button class="text-white font-bold focus:outline-none">×</button>`;
            
            tag.querySelector("button").addEventListener("click", () => {
                selectedTagsContainer.removeChild(tag);
            });
    
            selectedTagsContainer.appendChild(tag);
            input.value = "";
            suggestionsContainer.classList.add("hidden");
        }
    
        
    }).catch(error => console.error("Error obteniendo usuarios:", error));
    // let suggestions = ["Juan Pérez", "Ana Gómez", "Carlos Mendoza", "María López", "Fernando Díaz","Alberto Cancela"]; //Simulación de datos


    document.addEventListener("click", (e) => {
        if (!suggestionsContainer.contains(e.target) && e.target !== input) {
            suggestionsContainer.classList.add("hidden");
        }
    });
});