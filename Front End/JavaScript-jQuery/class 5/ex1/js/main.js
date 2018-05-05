$(function(){

    var count = localStorage.getItem('count');

    $('#count').html(count);

    $('#add').on('click', function () {
        var key = $('#key').val();
        var value = $('#value').val();
        localStorage.setItem(key, value);

    })

    $('#remove').on('click', function () {
        var key = $('#key').val();
        localStorage.removeItem(key);
    })

    $('#click').on('click', function () {
        count = localStorage.getItem('count');
        count++;
        localStorage.setItem('count', count);
        $('#count').html(count);
    })

})