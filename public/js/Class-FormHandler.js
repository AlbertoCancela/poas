class FormHandler {

    test(){
        return 'hey, im a test';
    }

    clearFields(item) {
        if (item && 'value' in item) {
            item.value = "";
        } else {
            console.warn("El elemento proporcionado no es válido.");
        }
    }

    lengthVerification(item, min, max = null) {
        if (item.length >= min && (max === null || item.length <= max)) {
            return false;
        }
        return true;
    }

    sweetAlertTimer(...args) {
        if (args.length < 4) {
            console.warn("Faltan argumentos para sweetAlertTimer.");
            return;
        }

        Swal.fire({
            position: args[0],  // Posición de la alerta
            icon: args[1],      // Icono de la alerta
            title: args[2],     // Título de la alerta
            text: args[3],
            showConfirmButton: false,
            timer: args[4]      // Tiempo de duración
        });
    }
}

class FormFunctions extends FormHandler{
    testFunction(){
        return this.test()
    }
}