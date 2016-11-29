function update_dropbox_settings() {

    dropbox_status = $('#dropbox_status').is(':checked');
    dropbox_app_key = $('#dropbox_app_key').val();
    dropbox_app_secret = $('#dropbox_app_secret').val();

    if (!(dropbox_status && (dropbox_app_key === "" || dropbox_app_secret === ""))) {

        $.ajax({
            type: "post",
            url: "controllers/update_dropbox_settings.jsp",
            data: "dropbox_status=" + dropbox_status + "&dropbox_app_key=" + dropbox_app_key + "&dropbox_app_secret=" + dropbox_app_secret,
            success: function (msg) {
                $.rustaMsgBox({'mode': 'info', 'content': 'Changes applied successfully', 'fadeOut': true});
            },
            error: function (error) {
                $.rustaMsgBox({'mode': 'error', 'content': 'Cannot apply', 'fadeOut': true});
            }
        });
    } else {
        $.rustaMsgBox({'mode': 'error', 'content': 'Please enter Dropbox app key and app secret', 'fadeOut': true});
    }

}

function dropbox_upload() {

    dropbox_access_code = $('#dropbox_access_code').val();

    $.ajax({
        type: "post",
        url: "controllers/dropbox_upload.jsp",
        data: "code=" + dropbox_access_code,
        success: function (msg) {
            $.rustaMsgBox({'mode': 'info', 'content': 'Uploaded successfully', 'fadeOut': true});
        },
        error: function (error) {
            $.rustaMsgBox({'mode': 'error', 'content': 'Cannot Apply', 'fadeOut': true});
        }
    });

}

function update_backup_settings() {

    backup_status = $('#backup_status').is(':checked');
    backup_schedule = $('#backup_schedule').text();
    backup_path = $('#backup_path').val();
alert(backup_schedule);
    $.ajax({
        type: "post",
        url: "controllers/update_backup_settings.jsp",
        data: "backup_status=" + backup_status + "&backup_schedule=" + backup_schedule + "&backup_path=" + backup_path,
        success: function (msg) {
            $.rustaMsgBox({'mode': 'info', 'content': 'Changes applied successfully', 'fadeOut': true});
            set_backup_scheduler();
        },
        error: function (error) {
            $.rustaMsgBox({'mode': 'error', 'content': 'Cannot apply', 'fadeOut': true});
        }
    });

}

function set_backup_scheduler(time){
    
    $.ajax({
        type: "post",
        url: "../BackupScheduler",
        data: "time=" + time,
        success: function (msg) {
            $.rustaMsgBox({'mode': 'info', 'content': 'Changes applied successfully', 'fadeOut': true});
            
        },
        error: function (error) {
            $.rustaMsgBox({'mode': 'error', 'content': 'Cannot apply', 'fadeOut': true});
        }
    });
}

function openInNewTab(url) {
    var win = window.open(url, '_blank');
    win.focus();
}