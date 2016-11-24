function new_post(status, service_id) {

    title = $('#form_title').val();
    content = $('#form_content').val();

    $.ajax({
        type: "post",
        url: "controllers/new_post.jsp",
        data: "service_id=" + service_id + "&title=" + title + "&content=" + content,
        success: function (msg) {
            get_path(status, service_id, msg);
            $.rustaMsgBox({"content": "Added to your timeline!"});
            //document.location.href = "couple_blog.jsp";


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

