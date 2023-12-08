function addToCart(itemId) {
    const input = document.getElementById('id-input')
    itemId = itemId ? itemId : parseInt(input.value)
    input.value = ''
    let items = JSON.parse(localStorage.getItem('items') || '[]')
    let cart = JSON.parse(localStorage.getItem('cart') || '[]')
    const itemToAdd = items.find(item => item.id === itemId)
    itemToAdd ? cart.push(itemToAdd) : alert('Нет такого товара, о нерадивый пользователь!')
    localStorage.setItem('cart', JSON.stringify(cart))
}

function countPrice() {
    let items = JSON.parse(localStorage.getItem('cart'))
    const price = items.length ? items.map(item => item.price).reduce((prev, curr) => prev + curr) : 0
    const priceOutput = document.getElementById('price-output')
    priceOutput.innerText = price.toString()
}