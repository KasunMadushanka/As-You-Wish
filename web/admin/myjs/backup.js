function update_dropbox_settings() {

    $.ajax({
        type: "post",
        url: "DropboxUpload.jsp",
        data: null,
        success: function (msg) {
            $.rustaMsgBox({'mode': 'info', 'content': 'Changes Applied Successfully', 'fadeOut': true});
        },
        error: function (error) {
            $.rustaMsgBox({'mode': 'error', 'content': 'Cannot Apply', 'fadeOut': true});
        }
    });

}

function dropbox_upload() {

    dropbox_access_code = $('#dropbox_access_code').val();

    $.ajax({
        type: "post",
        url: "controllers/dropbox_upload.jsp",
        data: "code="+dropbox_access_code,
        success: function (msg) {
            $.rustaMsgBox({'mode': 'info', 'content': 'Uploaded successfully', 'fadeOut': true});
        },
        error: function (error) {
            $.rustaMsgBox({'mode': 'error', 'content': 'Cannot Apply', 'fadeOut': true});
        }
    });

}


function openInNewTab(url) {
    var win = window.open(url, '_blank');
    win.focus();
}