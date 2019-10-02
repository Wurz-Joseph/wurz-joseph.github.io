$('.next').click(function () {
    var currentImg = $('.slide.active');
    var nextImg = currentImg.next();

    currentImg.fadeOut(0).removeClass('active');
    nextImg.fadeIn(300).addClass('active');

    if (nextImg.length == 0) {
        $('.slide').first().fadeIn(200).addClass('active');
    }

});

$('.prev').click(function () {
    var currentImg = $('.slide.active');
    var prevImg = currentImg.prev();

    currentImg.fadeOut(0).removeClass('active');
    prevImg.fadeIn(300).addClass('active');

    if (prevImg.length == 0) {
        $('.slide').last().fadeIn(200).addClass('active');
    }
});