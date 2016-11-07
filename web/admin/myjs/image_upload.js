function get_path(status,post_id) {
  
    $.ajax({
        type: "post",
        url: "controllers/upload_path.jsp",
        data: "status="+status+"&post_id="+post_id,
        success: function (msg) {
            image_upload(status);
        },
        error: function (error) {
            $.rustaMsgBox({"content": "Image path cannot be found"});

        }
    });

}

function image_upload(status) {

    if (status === "news_blog") {
        form = $('#form_upload_news_blog')[0];
    } 

    formData = new FormData(form);

    $.ajax({
        type: "post",
        url: "controllers/image_upload.jsp",
        data: formData,
        contentType: false,
        processData: false,
        success: function (msg) {

        },
        error: function (error) {
            $.rustaMsgBox({"content": "Error occured while uploading image"});

        }
    });

}
