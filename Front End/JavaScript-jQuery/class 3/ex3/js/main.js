$(function () {
    $($('.gallery__content-image')[0]).addClass('gallery__content-image--active');

    $('#nazad').on('click', function () {
        var activePic = $('.gallery__content-image--active');
        var nextPic = activePic.prev();

        if (!nextPic.length) {
            var lastIndex = $('.gallery__content-image').length-1;
            nextPic = $($('.gallery__content-image')[lastIndex]);
        }

        activePic.removeClass('gallery__content-image--active');
        nextPic.addClass('gallery__content-image--active');

    })

    $('#napred').on('click', function () {
        var activePic = $('.gallery__content-image--active');
        var nextPic = activePic.next();

        if (!nextPic.length) {
            nextPic = $($('.gallery__content-image')[0]);
        }

        activePic.removeClass('gallery__content-image--active');
        nextPic.addClass('gallery__content-image--active');

    })

})
