function get_path(status, service_id, post_id) {

    $.ajax({
        type: "post",
        url: "controllers/upload_path.jsp",
        data: "status=" + status + "&service_id=" + service_id + "&post_id=" + post_id,
        success: function (msg) {
            image_upload(status);
        },
        error: function (error) {
            $.rustaMsgBox({"content": "Image path cannot be found"});

        }
    });

}

function image_upload(status) {

    if (status === "customer_profile") {
        form = $('#form_upload_customer_profile')[0];
    } else if (status === "couple_blog") {
        form = $('#form_upload_couple_blog')[0];
    } else if (status === "customer_gallery") {
        form = $('#form_upload_customer_gallery')[0];
    } else if (status === "vendor_profile") {
        form = $('#form_upload_vendor_profile')[0];
    } else if (status === "vendor_blog") {
        form = $('#form_upload_vendor_blog')[0];
    } else if (status === "vendor_gallery") {
        form = $('#form_upload_vendor_gallery')[0];
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
