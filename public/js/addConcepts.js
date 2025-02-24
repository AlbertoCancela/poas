var defineUsers = () => {
    var tags = document.querySelectorAll('.userTag')
    var users = []
    tags.forEach((tag) => {
        var data = tag.getAttribute('data-name')
        newData = data.split('-')
        users.push(newData[0])
    })
    var testSessions = {'cuenta':'1', 'fechaEjecucion':'2', 'conceptoActividad': '22', users}
    console.log(testSessions.users)
    sessionStorage.setItem('concepts', JSON.stringify(testSessions))
};
