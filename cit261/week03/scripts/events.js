function alertOnLoad() {
    alert("This was triggered by the onload event handler");
}
//show temple image
function displayImage() {
    var image = document.getElementById("image");
    image.classList.toggle("show-image");
    
}
//make image bigger/smaller
var getImage = document.getElementById("image");
getImage.addEventListener("mouseover", enlarge);
getImage.addEventListener("mouseleave", shrink);

function enlarge() {
    getImage.style.transform = "scale(1.3)";
}
function shrink() {
    getImage.style.transform = "scale(1)";
}

//animate the square
function moveSquare() {
    document.getElementById("square").animate([
        { transform: 'translate(0, 0)' },
        { transform: 'translate(280px, 478px)' },
        { transform: 'translate(0, 0)' }

    ], {
        duration: 6000,
        iterations: Infinity
    })
}
document.getElementById("square").addEventListener("touchstart", moveSquare);