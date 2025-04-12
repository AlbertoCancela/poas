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
            fillSearchWithRecentPoas: () => this.fillSearchWithRecentPoas(),
            showPoasDetails: (folio) => this.showPoasDetails(folio),
            showPoasConcepts: ( folio ) => this.showPoasConcepts( folio ),
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
        console.log('xd chiggaaa')
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
                        var description = responseER.data[i].DESCRIPCION
                        htmlOptions +=  '<option description="'+description+'" value="'+value+'">'+label+'</option>'
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
                        var description = responseTC.data[i].DESCRIPCION
                        htmlOptions +=  '<option description="'+description+'" value="'+value+'">'+label+'</option>'
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
                        var description = responseU.data[i].DESCRIPCION
                        htmlOptions +=  '<option description="'+description+'" value="'+value+'">'+label+'</option>'
                        i++
                    }
                    select.innerHTML = htmlOptions
                    break;
            }
        })
    }
    async fillSearchWithRecentPoas(){
        var sql = "afw5";
        const body = {action: 'obtainPoasData', sql: sql}
        const response = await this.request('service-dml.php', body)
        if(!response.success) return
        console.log(response.data)
        const searchResultsContainer = document.getElementById('searchResultsContainer');
        let htmlCards = ""
        let i = 0
        while(i < response.data.length){
            let folio = response.data[i].FOLIO
            let area = response.data[i].AREA
            let autor = response.data[i].AUTOR
            let ejerector = response.data[i].EJE_RECTOR
            let ejercicioFiscal = response.data[i].EJERCICIO_FISCAL
            htmlCards +=  `<div onclick="showPoas(this)" data-folio="${folio}" class=" bg-gray-700 text-white p-4 rounded-md shadow-md flex justify-between items-center hover-animate">
                                <div>
                                    <p class="text-green-400 font-bold">${folio}</p>
                                    <p class="font-semibold">${area}</p>
                                    <p class="text-sm">${autor}</p>
                                    <p class="text-xs text-gray-300">${ejerector}</p>
                                </div>
                                <p class="text-gray-300 text-lg">${ejercicioFiscal}</p>
                            </div>`
            i++
        }
        searchResultsContainer.innerHTML = htmlCards
        setTimeout(() => {
            document.querySelectorAll('.hover-animate').forEach(card => {
                card.classList.add('transition-all', 'duration-300', 'hover:bg-gray-600', 'hover:shadow-lg', 'hover:-translate-y-1');
            });
        }, 100);
    }

    async showPoasDetails( folio ){
        var sql = "afw5";
        const body = {action: 'obtainPoasDetails', sql: sql, folio: folio}
        const response = await this.request("service-dml.php", body)
        this.fillDomForPoasDetails( response )
    }
    
    fillDomForPoasDetails( response ){
        const data = response.data[0]
        const DOMdetails = document.querySelectorAll('.poaDetail-change')
        const arrayDetails = [data.FOLIO, data.TIPO_GASTO,  data.AREA, data.AUTOR, data.DESCRIPCION, data.EJERCICIO_FISCAL, data.FECHA_ELABORACION, data.FECHA_INICIO, data.EJE_RECTOR, data.PROYECTO_META, data.POAS_LINEACCION, data.OBSERVACIONES]
        DOMdetails.forEach( (e, i) => {
            e.innerHTML = arrayDetails[i]
        })
        document.getElementById('showConceptsPoas').setAttribute('folio', data.FOLIO);
    }

    async showPoasConcepts( folio ) {
        console.log(folio)
        var sql = "afsPd";
        const body = { action: "obtainConceptsByFolio", sql: sql, folio: folio };
        const response = await this.request("service-dml.php", body);
        
        console.log(response); // Para verificar si la API responde bien
    
        // if (!response.success) return;
    
        // const showContent = document.getElementById("concepts-myConcepts");
        // console.log(showContent)
        // let htmlCards = "";
        // let i = 0;
        // console.log(response)
        // while (i < response.data.length) {
        //     let folio = response.data[i].FOLIO
        //     let area = response.data[i].AREA
        //     let autor = response.data[i].AUTOR
        //     let fechaejecucion = response.data[i].FECHA_EJECUCION
        //     let cuenta = response.data[i].CUENTA
        //     let unidad = response.data[i].UNIDAD
        //     let concepto = response.data[i].CONCEPTO
        //     let costoUnitario = response.data[i].COSTO_UNITARIO
        //     let cantidad = response.data[i].CANTIDAD
        //     let importeTotal = response.data[i].IMPORTE_TOTAL
        //     htmlCards += `hey`; 
        //     i++;
        // }
    
    //     showContent.innerHTML = htmlCards; // ✅ Ahora se renderiza correctamente
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
            htmlOptions +=  '<option  value="'+value+'">'+label+'</option>'
            i++
        }
        selectSubArea.innerHTML = htmlOptions
    }
    async fillLineaAccion(){
        var sql = "SELECT * FROM POAS_LINEASACCION WHERE ID_EJE_RECTOR = :id";
        const body = {action: 'fillSubArea', sql: sql, params: {id: this.element1.value}}
        const response = await this.request('service-dml.php', body)
        if(!response.success) return
        // console.log(response.data)
        const selectLineaAction = document.getElementById('linea-accion');
        var htmlOptions = '<option disabled selected>Líneas de acción</option>'
        var i = 0
        while(i < response.data.length){
            var value = response.data[i].ID
            var label = response.data[i].NOMBRE
            var description = response.data[i].DESCRIPCION
            htmlOptions +=  '<option description="'+description+'" value="'+value+'">'+label+'</option>'
            i++
        }
        selectLineaAction.innerHTML = htmlOptions
    }
    async fillProyectoMeta(){
        var sql = "SELECT * FROM POAS_PROYECTOMETA WHERE ID_LINEAS_ACCION = :id";
        const body = {action: 'fillSubArea', sql: sql, params: {id: this.element1.value}}
        const response = await this.request('service-dml.php', body)
        if(!response.success) return
        // console.log(response.data)
        const selectLineaAction = document.getElementById('proyecto-meta');
        var htmlOptions = '<option disabled selected>Proyecto / meta</option>'
        var i = 0
        while(i < response.data.length){
            var value = response.data[i].ID
            var label = response.data[i].NOMBRE
            var description = response.data[i].DESCRIPCION
            htmlOptions +=  '<option description="'+description+'" value="'+value+'">'+label+'</option>'
            i++
        }
        selectLineaAction.innerHTML = htmlOptions
    }
}



async function provisionalInsertPoa() {
    const formData = {};

    document.querySelectorAll("[id^=initPoa-] input:not(#initPoa-third *), [id^=initPoa-] textarea:not(#initPoa-third *), [id^=initPoa-] select:not(#initPoa-third *)").forEach(input => {
        switch (input.type) {
            case "radio":
                if (input.checked) formData[input.name] = input.id;
                break;
            case "checkbox":
                formData[input.id] = input.checked;
                break;
            default:
                const value = input.value.trim();
                if (value !== "") formData[input.id] = value;
                break;
        }
    });

    if (Object.keys(formData).length === 0) {
        console.warn("❌ No hay datos para enviar.");
        return;
    }

    // Obtener los conceptos almacenados en sessionStorage
    let storedItems = sessionStorage.getItem('conceptsPOA');
    let conceptsPOA = storedItems ? JSON.parse(storedItems) : [];

    const requestBody = {
        action: "insertPoa",
        sql: "",
        params: { ...formData, conceptsPOA } // Enviamos los datos del formulario + conceptos
    };

    try {
        const response = await fetch("../src/controller/service-dml.php", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(requestBody),
        });

        const result = await response.json();
        console.log("📥 Respuesta del servidor:", result);

        if (result.success) {
            Swal.fire({
                title: "Registro exitoso!",
                text: `¡El POA y sus conceptos se han registrado con FOLIO: ${result.folio}!`,
                icon: "success"
            });
        } else {
            Swal.fire({
                title: "Error!",
                text: result.message || "Hubo un problema con el registro.",
                icon: "error"
            });
        }
    } catch (error) {
        console.error("❌ Error en la solicitud:", error);
    }
}
