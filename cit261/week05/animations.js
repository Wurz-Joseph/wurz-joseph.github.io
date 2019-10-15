function showCode(){
    let getBlock = document.getElementById("codeBlock");
    getBlock.style.visibility = "visible";
    getBlock.style.animationPlayState = "running";
}


let scrollPos = 0;
const nav = document.querySelector('#list');

function checkPosition() {
  let windowY = window.scrollY;
  if (windowY > 400) {
    // Scrolling UP
    nav.classList.add('is-visible');
    nav.classList.remove('is-hidden');
  } else {
    // Scrolling DOWN
    nav.classList.add('is-hidden');
    nav.classList.remove('is-visible');
  }
  scrollPos = windowY;
}

window.addEventListener('scroll', checkPosition);
