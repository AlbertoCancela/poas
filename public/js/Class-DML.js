class API {
    constructor(baseURL) {
        this.baseURL = baseURL; // URL de la API PHP
        // console.log(this.baseURL)
    }

    async request(endpoint, body = null, method = "POST",) {
        const options = {
            method,
            headers: { "Content-Type": "application/json" },
            body: body ? JSON.stringify(body) : null,
        };

        try {
            const response = await fetch(`${this.baseURL}/${endpoint}`, options);
            if (!response.ok) throw new Error(`Error ${response.status}: ${response.statusText}`);
            return await response.json(); // Convertir respuesta a JSON
        } catch (error) {
            console.error("❌ JS: Error en la solicitud:", error);
            return { success: false, error: error.message };
        }
    }
}


class AutoFill extends API{
    constructor(action){
        super('../src/controller/');
        this.action = action
        this.executeAction(this.action)
    }
    executeAction( action ){
        const actions = this.getMapActions();
        const actionFunc = actions[action] || actions.default;
        actionFunc()
    }

    getMapActions(){
        return {
            selectsInitPoa: () => this.selectsInitPoa(),
            test: () => this.test(),
            default: () => console.warn(`La acción '${this.action}' no es reconocida.`)
        }
    }
    test (){
        console.log('xd')
    }
    selectsInitPoa (){
        selects = document.querySelectorAll('.auto-fill');
        selects.forEach( async ( select ) => {
            var caseSelect = select.getAttribute('id')
            switch(caseSelect){
                case 'area':
                    var sql = 'SELECT * FROM POAS_SECCIONES'
                    const response = await this.request('service-dml.php',{action: 'autofill_'+caseSelect, sql: sql})
                    if(!response.success) return
                    
                    var htmlOptions = '<option disabled selected>Área</option>';
                    var i = 0
                    while(i < response.data.length){
                        var value = response.data[i].ID
                        var label = response.data[i].NOMBRE
                        htmlOptions +=  '<option value="'+value+'">'+label+'</option>'
                        i++
                    }
                    select.innerHTML = htmlOptions
                    break;
            }
        })
    }
}

class DBHandler extends API {
    constructor (element1, element2 = null) {
        super('../src/controller/') //srcservice-dml.php
        this.element1 = element1
        element2 ? this.element2 = element2 : ''
        this.action = element1.getAttribute('DB-action')
        this.executeAction(this.action)
    }

    executeAction( action ){
        const actions = this.getMapActions();
        const actionFunc = actions[action] || actions.default;
        actionFunc()
    }

    getMapActions(){
        return {
            test: () => this.test(),
            default: () => console.warn(`La acción '${this.action}' no es reconocida.`)
        }
    }

    async test(){
        // const response = await this.request('service-dml.php',{action: 'holii test'})
        console.log('response')
    }

}

// 🔹 Clase Hija para Modificar Datos y Manipular Campos
// class DBUpdater extends API {
//     async insertData(data) {
//         return await this.request("insert.php", "POST", data);
//     }

//     async updateData(data) {
//         return await this.request("update.php", "PUT", data);
//     }

//     async deleteData(id) {
//         return await this.request(`delete.php?id=${id}`, "DELETE");
//     }

//     // 🔹 Acción extra: Cambiar valor de un input
//     setInputValue(inputElement, value) {
//         if (inputElement) {
//             inputElement.value = value;
//             console.log(`✅ Input actualizado: ${value}`);
//         } else {
//             console.warn("⚠️ Input no encontrado.");
//         }
//     }

//     // 🔹 Acción extra: Seleccionar una opción en un `<select>`
//     setSelectValue(selectElement, value) {
//         if (selectElement) {
//             selectElement.value = value;
//             console.log(`✅ Opción seleccionada en select: ${value}`);
//         } else {
//             console.warn("⚠️ Select no encontrado.");
//         }
//     }
// }

