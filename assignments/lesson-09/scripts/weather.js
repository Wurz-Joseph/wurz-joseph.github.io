let weatherObject = new XMLHttpRequest();
let weatherURL = 'https:api.openweathermap.org/data/2.5/weather?id=5604473&APPID=92a74429686969d072af8620a219e47d&units=imperial'
weatherObject.open('GET', weatherURL, true);

weatherObject.send();

weatherObject.onload = function () {
    let weatherInfo = JSON.parse(weatherObject.responseText);

    let iconsrc = "http://openweathermap.org/img/w/" + weatherInfo.weather[0].icon + ".png";
    document.getElementById('condition-img').src = iconsrc;
    document.getElementById('condition-text').innerHTML = weatherInfo.weather[0].description;
    document.getElementById('currentCondition').innerHTML = weatherInfo.weather[0].description;
    document.getElementById('temp').innerHTML = weatherInfo.main.temp;
    document.getElementById('humidity').innerHTML = weatherInfo.main.humidity;
    document.getElementById('speed').innerHTML = weatherInfo.wind.speed;

    let temp = parseFloat(document.getElementById("temp").innerHTML);
    let speed = parseFloat(document.getElementById("speed").innerHTML);
    let chill = 35.74 + 0.6215 * temp - 35.75 * Math.pow(speed, 0.16) + 0.4275 * temp * Math.pow(speed, 0.16);
    let number = parseFloat(Math.round(chill * 100) / 100).toFixed(2);

    document.getElementById("windChill").innerHTML = number;
}
