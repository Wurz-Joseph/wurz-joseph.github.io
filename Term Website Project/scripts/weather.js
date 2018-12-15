
let dalObject = new XMLHttpRequest();
let dallasURL = 'https://api.openweathermap.org/data/2.5/weather?zip=75230&APPID=92a74429686969d072af8620a219e47d&units=imperial'
dalObject.open('GET', dallasURL, true);

dalObject.send();

dalObject.onload = function () {
    let weatherInfo = JSON.parse(dalObject.responseText);

    let iconsrc = "https://openweathermap.org/img/w/" + weatherInfo.weather[0].icon + ".png";
    document.getElementById('dalIco').src = iconsrc;

    document.getElementById('dalWeather').innerHTML = weatherInfo.main.temp;
};

let frankObject = new XMLHttpRequest();
let frankURL = 'https://api.openweathermap.org/data/2.5/weather?zip=61381,de&APPID=92a74429686969d072af8620a219e47d&units=imperial'
frankObject.open('GET', frankURL, true);

frankObject.send();

frankObject.onload = function () {
    let weatherInfo = JSON.parse(frankObject.responseText);
    

    let iconsrc = "https://openweathermap.org/img/w/" + weatherInfo.weather[0].icon + ".png";
    document.getElementById('frankIco').src = iconsrc;
    document.getElementById('frankWeather').innerHTML = weatherInfo.main.temp;
};

let mexObject = new XMLHttpRequest();
let mexURL = 'https://api.openweathermap.org/data/2.5/weather?zip=45030,mx&APPID=92a74429686969d072af8620a219e47d&units=imperial'
mexObject.open('GET', mexURL, true);

mexObject.send();

mexObject.onload = function () {
    let weatherInfo = JSON.parse(mexObject.responseText);
    

    let iconsrc = "https://openweathermap.org/img/w/" + weatherInfo.weather[0].icon + ".png";
    document.getElementById('mexIco').src = iconsrc;
    document.getElementById('mexWeather').innerHTML = weatherInfo.main.temp;
};

let caliObject = new XMLHttpRequest();
let caliURL = 'https://api.openweathermap.org/data/2.5/weather?zip=92122,us&APPID=92a74429686969d072af8620a219e47d&units=imperial'
caliObject.open('GET', caliURL, true);

caliObject.send();

caliObject.onload = function () {
    let weatherInfo = JSON.parse(caliObject.responseText);
    

    let iconsrc = "https://openweathermap.org/img/w/" + weatherInfo.weather[0].icon + ".png";
    document.getElementById('caliIco').src = iconsrc;
    document.getElementById('cali').innerHTML = weatherInfo.main.temp;
};



