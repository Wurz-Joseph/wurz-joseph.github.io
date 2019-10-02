fetch('https://api.openweathermap.org/data/2.5/forecast?id=5607916&APPID=92a74429686969d072af8620a219e47d&units=imperial')
    .then(function (response) {
        return response.json();
    })

    .then(function (jsObject) {
        console.log(jsObject)

        let tempForecast = [];
        let day = 1;
        jsObject.list.forEach(x => {
            if (x.dt_txt.includes("15:00:00")) {
                tempForecast.push(x.main.temp);
            }

        });

        for (var i = 1; i <= 5; i++) {
            document.getElementById('forecastday' + i).innerHTML = tempForecast[i - 1];
        }
    })

