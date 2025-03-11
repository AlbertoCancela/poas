addConcept = () => {
    let formHandler = new FormHandler();
    // console.log($formHandler.testFunction())
    const container = document.querySelector('#initPoa-third');
    var conceptItem = Array.from(container.querySelectorAll('input, textarea, select')); // Convertir NodeList a Array
    var arrayItems = {};

    let hasError = conceptItem.some(item => {
        let conceptKey = item.getAttribute('conceptItem')
        let value = item.value.trim()
        
        if(formHandler.lengthVerification(value, 1)) return true

        arrayItems[conceptKey] = value
        return false // Continúa el bucle
    });

    if (hasError) {
        console.warn("Error en la validación, ejecución detenida.");
        return;
    }

    // Limpiar los campos solo si todo es válido
    // conceptItem.forEach(item => {
    //     clearFields(item);
    // });
    // conceptItem.forEach(item => {
    //     var conceptItem = item.getAttribute('conceptItem')
    //     var item = item.value
    //     arrayItems[ conceptItem] = item
    // })
    // arrayItems['responsables'] = defineUsers()
    console.log(arrayItems)
    // sweetAlertTimer('top-end', 'success', 'Concepto guardado', '1000')
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