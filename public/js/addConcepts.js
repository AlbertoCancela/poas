addConcept = () => {
    let formHandler = new FormHandler();
    // console.log($formHandler.testFunction())
    const container = document.querySelector('#initPoa-third');
    var conceptItem = Array.from(container.querySelectorAll('input, textarea, select')); // Convertir NodeList a Array
    var arrayItems = {};

    let hasError = conceptItem.some(item => {
        let conceptKey = item.getAttribute('conceptItem')
        let value = item.value.trim()
        if(conceptKey == 'responsables') value = defineUsers()
        if(formHandler.lengthVerification(value, 1)) {
            item.focus()
            return true
        }  

        arrayItems[conceptKey] = value
            return false
        })

    if (hasError) {
        // console.log(hasError)
        formHandler.sweetAlertTimer('center', 'error', 'Error inesperado', 'Verifica que todos los campos sean correctos y no vacíos', 1600)
        console.warn("Error en la validación, ejecución detenida.")
        return;
    }

    // Limpiar los campos solo si todo es válido
    // conceptItem.forEach(item => {
    //     formHandler.clearFields(item);
    // });

    formHandler.saveObjectsToSessionStorage(arrayItems, 'conceptsPOA')
    let concepts = formHandler.getConceptsFromSessionStorage()
    console.log(concepts)
    showMyConcepts(concepts)
}

var showMyConcepts = () => {
    let formHandler = new FormHandler();
    let concepts = formHandler.getConceptsFromSessionStorage()

    let conceptsContainer = document.getElementById('concepts-myConcepts');
    conceptsContainer.innerHTML = ""; // Limpiar antes de agregar nuevos elementos

    let myConcepts = "";

    concepts.forEach((concept, index) => {
        myConcepts += `
            <div class="border rounded-lg">
                <button class="toggle-collapse w-full text-left p-3 bg-gray-100 hover:bg-gray-200 rounded-t-lg flex justify-between items-center">
                    <span>Concepto ${index + 1}</span>
                    <span class="arrow transition-transform duration-300">▼</span>
                </button>
                <div class="collapse-content max-h-0 overflow-hidden opacity-0 transition-all duration-300 ease-out">
                    <p><b>Tipo de cuenta: </b></p>${concept.tipoCuenta}
                    <p><b>Fecha de Ejecución: </b></p>${concept.fechaEjecucionInicial} - ${concept.fechaEjecucionFinal}
                    <p><b>Concepto/actividad: </b></p>${concept.conceptoActividad || "Sin información"}
                    <p><b>Unidad: </b></p>${concept.unidad}
                    <p><b>Cantidad: </b></p>${concept.cantidad}
                    <p><b>Costo Unitario: </b></p>${concept.costoUnitario}
                    <p><b>Importe: </b></p>${concept.importe}
                    <p><b>Responsable(s): </b></p>${Array.isArray(concept.responsables) ? concept.responsables.join(', ') : "N/A"}
                </div>
            </div>
        `;
    });

    conceptsContainer.insertAdjacentHTML("beforeend", myConcepts);

    // Agregar eventos a los botones de colapsar con Tailwind
    document.querySelectorAll(".toggle-collapse").forEach(button => {
        button.addEventListener("click", function () {
            let content = this.nextElementSibling;

            content.classList.toggle("max-h-0");
            content.classList.toggle("opacity-0");
            content.classList.toggle("max-h-[500px]");
            content.classList.toggle("opacity-100");

            // Rotar la flecha
            let arrow = this.querySelector(".arrow");
            arrow.classList.toggle("rotate-180");
        });
    });
};

var defineUsers = () => {
    var tags = document.querySelectorAll('.userTag')
    var users = []
    tags.forEach((tag) => {
        var data = tag.getAttribute('data-name')
        newData = data.split('-')
        users.push(newData[0])
    })
    return users
}
