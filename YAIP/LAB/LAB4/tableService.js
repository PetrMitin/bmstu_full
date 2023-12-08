function fillRow(row, item) {
    for (field in item) {
        const td = document.createElement('td')
        td.innerText = item[field].toString()
        row.appendChild(td)
    }
}

function fillGrid(dataMode) {
    const table = document.getElementsByTagName('table')[0]
    let data = JSON.parse(localStorage.getItem(dataMode === 'items' ? 'items' : 'cart'))
    if (!data) {
        data = []
        localStorage.setItem(dataMode, JSON.stringify(data) || '[]')
    }
    const tableBody = table.appendChild(document.createElement('tbody'))
    for (let i = 0; i < data.length; i++) {
        const row = document.createElement('tr')
        fillRow(row, data[i])
        tableBody.appendChild(row)
    }
}