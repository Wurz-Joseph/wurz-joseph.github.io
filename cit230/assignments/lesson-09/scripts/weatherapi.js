let weatherObject = new XMLHttpRequest();
weatherObject.open('GET', 'https:api.openweathermap.org/data/2.5/weather?id=4691930&APPID=92a74429686969d072af8620a219e47d&units=imperial', true);

weatherObject.send();

weatherObject.onload = function() {
    let weatherInfo = JSON.parse(weatherObject.responseText);
    console.log(weatherInfo);
    document.getElementById('current-temp').innerHTML = weatherInfo.main.temp;
}