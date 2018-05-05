$(function () {

    $('#get').on('click', function () {
        $.get('http://api.icndb.com/jokes/random?firstName=' +
            $('#firstName').val() + '&lastName=' + $('#lastName').val(),
            function (data) {
                $('#joke').html(data.value.joke);
            })
    })
})
