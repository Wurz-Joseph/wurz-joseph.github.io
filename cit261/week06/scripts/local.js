const xhr2 = new XMLHttpRequest();
xhr2.open("GET", "xml.json");
xhr2.send();

function fetchData(){

    let obj2 = JSON.parse(xhr2.responseText)
    console.log(obj2);

    let firstName = obj2.firstName;
    let lastName = obj2.lastName;
    let sport = obj2.favorite_sport;


    document.getElementById("local").textContent = "My name is " + firstName + " " + lastName +
    " and my favorite sport is " + sport;
};

setTimeout(fetchData, 5000);











