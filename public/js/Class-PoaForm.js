class PoaForm {
    constructor(input) {
        this.input = input
        this.action = this.getInputAction(this.input)
    }
    getInputAction(input){
        const action = input.getAttribute('input-action');
        return action ? action : input.getAttribute('id');
    }
}



class InitPoaForm extends PoaForm{
    constructor(input){
        super(input)
        this.executeAction(this.action);
    }

    executeAction( action ){
        const actions = this.getMapActions();
        const actionFunc = actions[action] || actions.default;
        actionFunc();
    }

    getMapActions(){
        return {
            fillEjercicioFiscal: () => this.fillEjercicioFiscal(),
            verifyLength: () => this.verifyLength(),
            generalDateFormat: () => this.generalDateFormat(),
            compareFechaInicio: () => this.compareFechaInicio(),
            emptyVerification: () => this.emptyVerification(this.input.value),
            default: () => console.warn(`La acción del atributo'${this.action}' no es reconocida.`)
        }
    }

    fillEjercicioFiscal(){
        var currentDate = this.input.value
        if(!this.emptyVerification(currentDate)) return
        var currentYear = currentDate.split('-')[0]
        document.getElementById('ejercicio-fiscal').value = Number(currentYear) + 1
    }

    verifyLength(){
        var string = this.input.value
        if(!this.emptyVerification(string)) return
        var stringLength = string.length
        stringLength >= 10 && stringLength < 1000 ? console.log('nice') : this.emptyVerification('')
    }

    emptyVerification( data ){
        var errorMessage = document.getElementById('errorMessage-'+this.input.getAttribute('id')) 
        if (!data) {
            errorMessage.classList.remove("hidden") // Mostrar advertencia
            return false
        } 
        
        errorMessage.classList.add("hidden")
        return true
        
    }

    generalDateFormat(){
        var current = this.input.value
        if(!this.emptyVerification(current)) return
        console.log(current)
    }

    compareFechaInicio(){
        var endDate = this.input.value
        if(!this.emptyVerification(endDate)) return
        var startDate = document.getElementById("fecha-inicio").value
        if(!this.emptyVerification(startDate)) return
        endDate = new Date(endDate)
        startDate = new Date(startDate)
        
        // console.log(endDate + '-' + startDate)
        if(endDate < startDate) this.emptyVerification('')
        
    }
}


