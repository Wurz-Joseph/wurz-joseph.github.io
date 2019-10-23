const xhr1 = new XMLHttpRequest();
const url = "https://reqres.in/api/users?page=2";
xhr1.open("GET", url, true);

function loadData() {

    let obj1 = JSON.parse(xhr1.responseText);
    console.log(obj1);


    let txt = "";
    for (let i = 0; i < obj1.data.length; i++) {
        txt = obj1.data[i].last_name;

        let table = document.getElementById("get-table");

        let row = table.insertRow(1);
        let newCell = row.insertCell(0);
        newCell.innerHTML = txt;

    }
    
}

xhr1.send();

