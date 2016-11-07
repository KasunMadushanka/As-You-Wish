function new_post() {

    title = $('#form_title').val();
    content = $('#form_content').val();

    $.ajax({
        type: "post",
        url: "controllers/new_post.jsp",
        data: "title=" + title + "&content=" + content,
        success: function (msg) {
            get_path("news_blog", msg);
          
            reset();
            $.rustaMsgBox({"content": "Added to your timeline!"});

        },
        error: function (error) {
            alert(error);

        }
    });
}

function reset() {

    $('#form_title').val(null);
    $('#form_content').val(null);
}

