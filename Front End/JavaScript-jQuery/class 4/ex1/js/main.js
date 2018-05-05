$(function () {

    $('#get').on('click', function () {
        var searchQuery = $('#search-input').val();

        $.ajax(
            {
                url: 'https://api.github.com/search/repositories',
                type: 'GET',
                data: {
                    q: searchQuery.replace(' ', '+')
                },
                success: function (data) {
                    var elements = "";

                    for (var i = 0; i < data.items.length; i++) {
                        elements += '<li class="item" id-number="' + i + '"><h2>' +
                            data.items[i].name + '</h2><h3>' + data.items[i].url + '</h3></li> ';
                    }

                    $('#results').html("").append(elements);

                    $('.item').on('click', function () {
                        var id = $(this).attr('id-number');

                        $('#name .right-details').html(data.items[id].name);
                        $('#url .right-details').html(data.items[id].url);
                        $('#score .right-details').html(data.items[id].score);
                        var dropdown = $('#dropdown');
                        dropdown.removeClass('open');
                        dropdown.html("");
                    })
                }
            })
    });


    $('#search-input').on('keyup', function () {

        var momentChars = this.value.length;
        var inProgress = false;

        if (momentChars > 4) {
            if (!inProgress) {
                inProgress = true;
                $.ajax({
                    url: 'https://api.github.com/search/repositories',
                    type: 'GET',
                    data: {
                        q: this.value
                    },
                    success: function (data) {
                        var elements = "";

                        for (var i = 0; i < 5; i++) {
                            elements += '<li class="dd-item" id-number="' + i + '">' + data.items[i].name + '</li>';
                        }
                        var dropdown = $('#dropdown');
                        dropdown.html("").append(elements);

                        dropdown.addClass('open');

                        $('.dd-item').on('click', function () {
                            var id = $(this).attr('id-number');

                            $('#name .right-details').html(data.items[id].name);
                            $('#url .right-details').html(data.items[id].url);
                            $('#score .right-details').html(data.items[id].score);
                            dropdown.removeClass('open');
                            dropdown.html("");
                        })

                        inProgress = false;
                    }
                })
            } else {
                console.log('progress');
                inProgress = false;
            }

        } else {
            var dropdown = $('#dropdown');
            dropdown.removeClass('open');
            dropdown.html("");
        }
    })
})
