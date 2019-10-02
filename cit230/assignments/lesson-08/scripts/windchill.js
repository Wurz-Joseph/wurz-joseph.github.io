let temp = parseFloat(document.getElementById("temp").innerHTML);
let speed = parseFloat(document.getElementById("speed").innerHTML);

let chill = 35.74 + 0.6215 * temp - 35.75 * Math.pow(speed, 0.16) +
    0.4275 * temp * Math.pow(speed, 0.16);
let number = parseFloat(Math.round(chill * 100) / 100).toFixed();

document.getElementById("windChill").innerHTML = number;