
function addItem() {
    //create a new li element
    let newListItem = document.createElement("LI");
    let text = document.getElementById('itemText').value;
    if (text != '') {
        let textNode = document.createTextNode(text);
        newListItem.appendChild(textNode);
        document.getElementById('list').appendChild(newListItem);
        document.getElementById('itemText').value = '';
        document.getElementById('itemText').focus();
    }
}

function removeItem() {
    let list = document.getElementById('list');
    list.removeChild(list.lastChild);
}

function insertAbove() {
    let newListItem = document.createElement("LI");
    let text = document.getElementById('itemText').value;
    let textNode = document.createTextNode(text);
    newListItem.appendChild(textNode);
    let list = document.getElementById('list');
    list.insertBefore(newListItem, list.childNodes[0]);

    document.getElementById('itemText').value = '';
    document.getElementById('itemText').focus();

}
