addConcept = () => {
    const conceptItem = document.querySelectorAll('.concept')
    var arrayItems = {}
    conceptItem.forEach(item => {
        var conceptItem = item.getAttribute('conceptItem')
        var item = item.value;
        arrayItems[ conceptItem] = item
    })
    return arrayItems
}

var lengthVerification = (a,b, c = null) => {
    if(a.length > b && a.length <= c){
        return users;
    }
    return false;
}


var defineUsers = () => {
    var tags = document.querySelectorAll('.userTag')
    var users = []
    tags.forEach((tag) => {
        var data = tag.getAttribute('data-name')
        newData = data.split('-')
        users.push(newData[0])
    })
    return users;
};
