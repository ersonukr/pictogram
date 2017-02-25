$(document).ready(function () {
    $('.more-comments').click(function () {
        $(this).on('ajax:success', function (event, data, status, xhr) {
            var articleId = $(this).data("article-id");
            $("#comments_" + articleId).html(data);
            $("#comments-paginator-" + articleId).html("<a id='more-comments' data-article-id=" + articleId + "data-type='html' data-remote = 'true'href = '/articles/" + articleId + "/comments>show more comments < / a > ");
        });
    })
})