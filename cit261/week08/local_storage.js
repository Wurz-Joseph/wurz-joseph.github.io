
let name = document.getElementById('inName');
let noun1 = document.getElementById('inNoun1');
let noun2 = document.getElementById('inNoun2');
let bodyPart = document.getElementById('inBody');
let fluid = document.getElementById('inFluid');
let adj = document.getElementById('inAdj');
let substance = document.getElementById('inSubstance');
let place = document.getElementById('inPlace');
let event = document.getElementById('inEvent');
let noun3 = document.getElementById('inNoun3');


submitWords.onclick = function () {
    localStorage.setItem("name", name.value);
    localStorage.setItem("noun1", noun1.value);
    localStorage.setItem("noun2", noun2.value);
    localStorage.setItem("bodypart", bodyPart.value);
    localStorage.setItem("fluid", fluid.value);
    localStorage.setItem("adj", adj.value);
    localStorage.setItem("substance", substance.value);
    localStorage.setItem("place", place.value);
    localStorage.setItem("event", event.value);
    localStorage.setItem("noun3", noun3.value);

    document.forms[0].reset();

};

clearStorage.onclick = function () {
    localStorage.clear();
}

let txt1 = document.getElementById('text1').classList;
let txt2 = document.getElementById('text2').classList;
let txt3 = document.getElementById('text3').classList;
let txt4 = document.getElementById('text4').classList;

function displayFirst() {
  
        document.getElementById('name1').textContent = localStorage.getItem('name');
        document.getElementById('adj1').textContent = localStorage.getItem('adj');
        document.getElementById('noun1').textContent = localStorage.getItem('noun1');

        txt1.remove('hide');
        txt2.add('hide');
        txt3.add('hide');
        txt4.add('hide');
    }


function displaySecond() {
    document.getElementById('name2').textContent = localStorage.getItem('name');
    document.getElementById('bodyPart').textContent = localStorage.getItem('bodypart');
    document.getElementById('fluid').textContent = localStorage.getItem('fluid');
    document.getElementById('substance').textContent = localStorage.getItem('substance');

    txt1.add('hide');
    txt2.remove('hide');
    txt3.add('hide');
    txt4.add('hide');
}

function displayThird() {
    document.getElementById('name3').textContent = localStorage.getItem('name');
    document.getElementById('place').textContent = localStorage.getItem('place');
    document.getElementById('noun2').textContent = localStorage.getItem('noun2');

    txt1.add('hide');
    txt2.add('hide');
    txt3.remove('hide');
    txt4.add('hide');

}

function displayFourth() {
    document.getElementById('name4').textContent = localStorage.getItem('name');
    document.getElementById('noun3').textContent = localStorage.getItem('noun3');
    document.getElementById('event').textContent = localStorage.getItem('event');

    txt1.add('hide');
    txt2.add('hide');
    txt3.add('hide');
    txt4.remove('hide');

}





console.log(localStorage);

