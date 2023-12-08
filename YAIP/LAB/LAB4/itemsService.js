function createItem() {
    const items = JSON.parse(localStorage.getItem('items')) || []
    const name = document.getElementById('name-input').value
    const price = parseInt(document.getElementById('price-input').value)
    if (!name || !price) return alert('О нерадивый пользователь, проверь глаза и свой ввод!')
    let item = items.find(item => item.name === name && item.price === price)
    if (!item) {
        const id = items.length + 1
        item = {id, name, price}
        items.push(item)
        localStorage.setItem('items', JSON.stringify(items))
    }
    addToCart(item.id)
    const row = document.createElement('tr')
    fillRow(row, item)
    const orderTableBody = document.getElementsByTagName('tbody')[0]
    orderTableBody.appendChild(row)
    const priceOutput = document.getElementById('price-output')
    priceOutput.innerText && countPrice()
}