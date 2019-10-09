//function for adding new <li> element to the ordered list.
function addItem() {
    //create a new li element
    let newListItem = document.createElement("LI");
    //gets the text from the input box
    let text = document.getElementById('itemText').value;
    //prevents user from creating empty list items
    if (text != '') {
        //creates a text node from users input
        let textNode = document.createTextNode(text);
        //appends text node to element node
        newListItem.appendChild(textNode);
        //appends list item to ordered list as a child element.
        document.getElementById('list').appendChild(newListItem);
        //resets input field
        document.getElementById('itemText').value = '';
        //keeps text box in focus after each new list item.
        document.getElementById('itemText').focus();
    }
}
//remove the last child element from the list.
function removeItem() {
    let list = document.getElementById('list');
    list.removeChild(list.lastChild);
}

//This function inserts a new list item to the top of the list.
function insertAbove() {
    let newListItem = document.createElement("LI");
    let text = document.getElementById('itemText').value;
    if (text != '') {
        let textNode = document.createTextNode(text);
        newListItem.appendChild(textNode);
        let list = document.getElementById('list');
        list.insertBefore(newListItem, list.childNodes[0]);

        document.getElementById('itemText').value = '';
        document.getElementById('itemText').focus();
    }
}
