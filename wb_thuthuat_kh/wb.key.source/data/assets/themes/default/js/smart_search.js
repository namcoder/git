$(document).ready(function () {
    $(".search-box").autocomplete({
        source: function (request, response) {
            $.ajax({
                url: "/search/product/autocomplete",
                data: {
                    keyword: request.term
                },
                success: function(data) {
                    response($.map(data.data, function(index, val) {
                        return {
                            value:  index.title,
                            avatar: index.thumbnail,
                            url:    index.url
                        };
                    }));
                }
            });
        }
    }).data("uiAutocomplete")._renderItem = function (ul, item) {
        return $("<li></li>")
            .data("item.autocomplete", item)
            .append("<p class='content_autocomplete_search'><a href='"+ item.url +"'><img class='avt_autocomplete_search' src='" + item.avatar + "' />" + "<span class='txt_autocomplete_search'>" + item.value + "</span>" + "</a></p>")
            .appendTo(ul);
    };
});