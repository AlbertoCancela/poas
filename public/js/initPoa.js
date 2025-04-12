function initPoa_changeView(firstElement, secondElement, step = null, animation = null) {
    const FE = document.getElementById(firstElement);
    const SE = document.getElementById(secondElement);
    const ANIMATION = animation == null ? 'translate-y-4' : animation; 

    
    if (step != null){ //cambiar validaciones por step en lugar de first / second element.
        const validation = partValidation(step);
        if (!validation){
            alert('Existen campos por rellenar')
            return
        }
        // alert('you won ma nigga')
    }
    // Animar la salida del primer elemento
    FE.classList.add('opacity-0', ANIMATION, 'transition-all', 'duration-300', 'ease-in-out');

    setTimeout(() => {
        FE.classList.add('hidden');
        FE.classList.remove('opacity-0', ANIMATION, 'transition-all', 'duration-300');

        // Mostrar y animar el segundo elemento
        SE.classList.remove('hidden');
        SE.classList.add('flex', 'opacity-0', ANIMATION);

        // Forzar reflujo para que la transición se aplique
        void SE.offsetWidth;

        // Animar la entrada del segundo elemento
        SE.classList.add('opacity-100', 'translate-y-0', 'transition-all', 'duration-300', 'ease-in-out');
        SE.classList.remove('opacity-0', ANIMATION);

    }, 300);
}

function partValidation( step ){
    if(step == 1){
        const inputs = document.querySelectorAll('#initPoa-first .input-field');
        var counter = 0;
            inputs.forEach( input => {
                if(input.type === 'radio'){
                    if (input.checked) {
                        counter++
                    }
                }
                else{
                    if(input.value){
                        counter++
                    }
                }
            })
            return counter < 8 ? false : true
    }
    else if(step == 2){
        console.log('im in my nigga')
        const inputs = document.querySelectorAll('#initPoa-second .input-field');
        var counter = 0;
            inputs.forEach( input => {
                    if(input.value){
                        counter++
                    }
            })
            return counter < 4 ? false : true
    }
}

function changeHidden(f,s){
    f = document.getElementById(f)
    s = document.getElementById(s)
    f.classList.add('hidden')
    s.classList.remove('hidden')
}


document.querySelectorAll('.hasDescription').forEach(select => {
    select.addEventListener('change', function() {
        let selectedOption = this.options[this.selectedIndex]; // Obtiene la opción seleccionada
        let description = selectedOption.getAttribute('description'); // Obtiene la descripción

        
        document.getElementById('selectDescription').textContent = description || 'Descripción no disponible';
        

    });
});
