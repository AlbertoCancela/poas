function showPoas( element ){
    initPoa_changeView('searchResultsContainer','poaDetails')
    const objectShowPoaDetails = new AutoFill()
    const folio = element.getAttribute('data-folio');
    objectShowPoaDetails.showPoasDetails(folio)
}