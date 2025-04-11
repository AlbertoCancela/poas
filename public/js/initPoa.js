function initPoa_changeView(firstElement, secondElement, animation = null) {
    const FE = document.getElementById(firstElement);
    const SE = document.getElementById(secondElement);
    const ANIMATION = animation == null ? 'translate-y-4' : animation; 

    partValidation(firstElement, secondElement);

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

    }, 300); // Coincide con `duration-300`
}

function partValidation(firstElement, secondElement){
    if(firstElement == 'initPoa-first' && secondElement == 'initPoa-second'){
        const inputs = document.querySelectorAll('#initPoa-first .input-field');
        var counter = 0;
            inputs.forEach( input => {
                if(input.type === 'radio'){
                    if (input.checked) {
                        counter++;
                    }
                }
                else{
                    if(input.value){
                        console.log(input.getAttribute('id'))
                        counter++
                    }
                }
            })
            console.log(counter)
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
