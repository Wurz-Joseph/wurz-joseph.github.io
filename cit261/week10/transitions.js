function doTransition(){
    const circle = document.getElementById("circle");
    const container = document.getElementById("container");

    //transition on circle that changes background-color and position using top.
    circle.style.cssText = "background-color: #ffff00; top: 0;";
    //transition to change background color of container div.
    container.style.backgroundColor = "#c4eef8";
}

