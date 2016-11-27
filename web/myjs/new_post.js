function new_post(status, service_id) {

    title = $('#form_title').val();
    content = $('#form_content').val();

    $.ajax({
        type: "post",
        url: "controllers/new_post.jsp",
        data: "service_id=" + service_id + "&title=" + title + "&content=" + content,
        success: function (msg) {
            get_path(status, service_id, msg);
             close_modal();
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

