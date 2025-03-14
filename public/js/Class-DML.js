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
    constructor(action = null){
        super('../src/controller/');
        if (action){
            this.action = action
            this.executeAction(this.action)
        }
    }
    executeAction( action ){
        const actions = this.getMapActions();
        const actionFunc = actions[action] || actions.default;
        actionFunc()
    }
    getMapActions(){
        return {
            selectsInitPoa: () => this.selectsInitPoa(),
            obtainUsersData: () => this.obtainUsersData(),
            test: () => this.test(),
            default: () => console.warn(`La acción '${this.action}' no es reconocida.`)
        }
    }
    async obtainUsersData(){
        var sql = "au";
        const response = await this.request('service-dml.php',{action: 'obtainData', sql: sql})
        // console.log(response)
        var i = 0
        var suggestions = [];
        while(i < response.data.length){
            var id = response.data[i]['ID']
            var nombre = response.data[i]['NOMBRE']
            suggestions.push(id+"-"+nombre)
            i++
        }
        // console.log(suggestions)
        return suggestions
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
                    var sql = 'SELECT * FROM POAS_DEPARTAMENTOS'
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
                case 'eje-rector':
                    var sql = 'SELECT * FROM POAS_EJERECTOR'
                    const responseER = await this.request('service-dml.php',{action: 'autofill_eje-rector', sql: sql})
                    if(!responseER.success) return
                    var htmlOptions = '<option disabled selected>Eje rector</option>';
                    var i = 0
                    while(i < responseER.data.length){
                        var value = responseER.data[i].ID
                        var label = responseER.data[i].NOMBRE
                        htmlOptions +=  '<option value="'+value+'">'+label+'</option>'
                        i++
                    }
                    select.innerHTML = htmlOptions
                    break;
                case 'tipo-cuenta':
                    var sql = 'SELECT * FROM POAS_CUENTAS'
                    const responseTC = await this.request('service-dml.php',{action: 'autofill_eje-rector', sql: sql})
                    if(!responseTC.success) return
                    var htmlOptions = '<option value="" disabled selected>Tipo de cuenta</option>'
                    var i = 0
                    while(i < responseTC.data.length){
                        var value = responseTC.data[i].ID
                        var label = responseTC.data[i].NOMBRE
                        htmlOptions +=  '<option value="'+value+'">'+label+'</option>'
                        i++
                    }
                    select.innerHTML = htmlOptions
                    break;
                case 'fecha-ejecucion':
                    var months = ['enero', 'febrero', 'marzo', 'abril', 'mayo', 'junio', 'julio', 'agosto', 'septiembre', 'octubre', 'noviembre', 'diciembre'] 
                    var i = 0
                    var htmlOptions = '<option disabled selected>Mes de ejecución</option>'
                    while(i < months.length){
                        htmlOptions +=  '<option value="'+months[i]+'">'+months[i]+'</option>'
                        i++
                    }
                    select.innerHTML = htmlOptions
                    break;
                case 'unidad':
                    var sql = 'SELECT * FROM POAS_UNIDADES'
                    const responseU = await this.request('service-dml.php',{action: 'autofill_eje-rector', sql: sql})
                    if(!responseU.success) return
                    var htmlOptions = '<option disabled selected>Unidades</option>'
                    var i = 0
                    while(i < responseU.data.length){
                        var value = responseU.data[i].ID
                        var label = responseU.data[i].NOMBRE
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
            fillSubArea: () => this.fillSubArea(),
            fillLineaAccion: () => this.fillLineaAccion(),
            fillProyectoMeta: () => this.fillProyectoMeta(),
            test: () => this.test(),
            default: () => console.warn(`La acción '${this.action}' no es reconocida.`)
        }
    }

    async test(){
        // const response = await this.request('service-dml.php',{action: 'holii test'})
        console.log('response NIGGA')
    }

    async fillSubArea(){
        // console.log(this.element1.value)
        var sql = "SELECT * FROM POAS_SECCIONES WHERE ID_DEPARTAMENTO = :id";
        const body = {action: 'fillSubArea', sql: sql, params: {id: this.element1.value}}
        
        const response = await this.request('service-dml.php', body)
        if(!response.success) return
        
        const selectSubArea = document.getElementById('sub-area');
        var htmlOptions = '<option disabled selected>Sub Área</option>'
        var i = 0
        while(i < response.data.length){
            var value = response.data[i].ID
            var label = response.data[i].NOMBRE
            htmlOptions +=  '<option value="'+value+'">'+label+'</option>'
            i++
        }
        selectSubArea.innerHTML = htmlOptions
    }
    async fillLineaAccion(){
        var sql = "SELECT * FROM POAS_LINEASACCION WHERE ID_EJE_RECTOR = :id";
        const body = {action: 'fillSubArea', sql: sql, params: {id: this.element1.value}}
        const response = await this.request('service-dml.php', body)
        if(!response.success) return
        console.log(response.data)
        const selectLineaAcction = document.getElementById('linea-accion');
        var htmlOptions = '<option disabled selected>Líneas de acción</option>'
        var i = 0
        while(i < response.data.length){
            var value = response.data[i].ID
            var label = response.data[i].NOMBRE
            htmlOptions +=  '<option value="'+value+'">'+label+'</option>'
            i++
        }
        selectLineaAcction.innerHTML = htmlOptions
    }
    async fillProyectoMeta(){
        var sql = "SELECT * FROM POAS_PROYECTOMETA WHERE ID_LINEAS_ACCION = :id";
        const body = {action: 'fillSubArea', sql: sql, params: {id: this.element1.value}}
        const response = await this.request('service-dml.php', body)
        if(!response.success) return
        console.log(response.data)
        const selectLineaAcction = document.getElementById('proyecto-meta');
        var htmlOptions = '<option disabled selected>Proyecto / meta</option>'
        var i = 0
        while(i < response.data.length){
            var value = response.data[i].ID
            var label = response.data[i].NOMBRE
            htmlOptions +=  '<option value="'+value+'">'+label+'</option>'
            i++
        }
        selectLineaAcction.innerHTML = htmlOptions
    }
}



async function provisionalInsertPoa() {
    const formData = {};

    // Obtener todos los inputs, selects y textareas
    const inputs = document.querySelectorAll("#initPoa-first input, #initPoa-first textarea, #initPoa-first select, #initPoa-second input, #initPoa-second textarea, #initPoa-second select, #initPoa-third input, #initPoa-third textarea, #initPoa-third select");

    inputs.forEach(input => {
        if (input.type === "radio") {
            if (input.checked) {
                formData[input.name] = input.id;
            }
        } else if (input.type === "checkbox") {
            formData[input.id] = input.checked;
        } else {
            formData[input.id] = input.value.trim();
        }
    });

    // Construcción del body para el fetch
    const requestBody = {
        action: "insertPoa", // Acción para el backend
        sql: "", // Aquí debes colocar tu consulta SQL en el backend
        params: formData // Enviamos los datos del formulario
    };

    try {
        const response = await fetch("../src/controller/service-dml.php", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(requestBody),
        });

        const result = await response.json();
        if(result.success){
            Swal.fire({
                title: "Registro exitoso!",
                text: "¡El poa se ha registrado en la base de datos!",
                icon: "success"
              });
        };
    } catch (error) {
        console.error("❌ Error en la solicitud:", error);
    }
}
