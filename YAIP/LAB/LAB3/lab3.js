function traverseTree(node=document.getElementsByTagName('body')[0], level=0) {
    if (level === 0) {
        document.getElementById('tree-container').innerHTML = ''
    }
    if (node?.id !== 'tree-container') {
        show(node, level)
        for (childIndex in node.children) {
            const child = node.children[childIndex]
            if(child?.tagName) {
                traverseTree(child, level+1)
            }
        }
    }
}

function show(node, level) {
    console.log(node)
    const newNode = document.createElement('div')
    newNode.className = 'node'
    newNode.innerText = `\u00A0`.repeat(level*4) + node.tagName
    document.getElementById('tree-container').appendChild(newNode)
}