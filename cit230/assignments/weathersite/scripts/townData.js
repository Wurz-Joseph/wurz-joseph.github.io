let weatherObj = new XMLHttpRequest();
weatherObj.open('GET', 'https://byui-cit230.github.io/weather/data/towndata.json', true);

weatherObj.send();

weatherObj.onload = function() {
    let weatherInfo = JSON.parse(weatherObj.responseText);
    document.getElementById('prestonMotto').innerHTML = weatherInfo.towns[4].motto;
    document.getElementById('prestonFound').innerHTML = weatherInfo.towns[4].yearFounded;
    document.getElementById('prestonPop').innerHTML = weatherInfo.towns[4].currentPopulation;
    document.getElementById('prestonRain').innerHTML = weatherInfo.towns[4].averageRainfall;


    document.getElementById('sodaMotto').innerHTML = weatherInfo.towns[5].motto;
    document.getElementById('sodaFound').innerHTML = weatherInfo.towns[5].yearFounded;
    document.getElementById('sodaPop').innerHTML = weatherInfo.towns[5].currentPopulation;
    document.getElementById('sodaRain').innerHTML = weatherInfo.towns[5].averageRainfall;


    document.getElementById('fishMotto').innerHTML = weatherInfo.towns[1].motto;
    document.getElementById('fishFound').innerHTML = weatherInfo.towns[1].yearFounded;
    document.getElementById('fishPop').innerHTML = weatherInfo.towns[1].currentPopulation;
    document.getElementById('fishRain').innerHTML = weatherInfo.towns[1].averageRainfall;
}
