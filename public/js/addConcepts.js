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
    // conceptItem.forEach(item => {
    //     var conceptItem = item.getAttribute('conceptItem')
    //     var item = item.value
    //     arrayItems[ conceptItem] = item
    // })
    // arrayItems['responsables'] = defineUsers()
    var conceptos = sessionStorage.getItem('test') || ''
    console.log(conceptos)
    arrayItems += conceptos

    sessionStorage.setItem('test', JSON.stringify(arrayItems))
}

// var lengthVerification = (a,b, c = null) => {
//     if(a.length > b && a.length <= c){
//         return users
//     }
//     return false
// }

// var sweetAlertTimer = (...args) => {
//     Swal.fire({
//         position: args[0],
//         icon: args[1],
//         title: args[2],
//         showConfirmButton: false,
//         timer: args[3]
//     });
// }

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

// var clearFields = ( item ) => {
//     item.value = ""
// }