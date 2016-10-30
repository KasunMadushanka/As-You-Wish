function update_like(post_id, type, count) {

    count += 1;
    $.ajax({
        type: "post",
        url: "controllers/update_like.jsp",
        data: "post_id=" + post_id + "&type=" + type + "&count=" + count,
        success: function (msg) {
            document.getElementById(post_id).innerHTML = '<i class="pe-7s-like2"></i>' + count;
        },
        error: function (error) {
            alert(error);

        }
    });

}

function update_comment(post_id, type, event) {

    if (event.which === 13 || event.keyCode === 13) {

        comment = $('#text' + post_id).val();

        $.ajax({
            type: "post",
            url: "controllers/update_comment.jsp",
            data: "post_id=" + post_id + "&type=" + type + "&comment=" + comment,
            success: function (msg) {
                if (msg === "visitor") {
                    visitor_sign_up();
                } else {
                    $.rustaMsgBox({'mode': 'info', 'content': 'Comment added', 'fadeOut': true});
                }
            },
            error: function (error) {
                $.rustaMsgBox({'mode': 'error', 'content': 'Failed to add comment', 'fadeOut': true});

            }
        });
        return false;
    }
    return true;
}

function view_comments(post_id, type) {
    $.ajax({
        type: "post",
        url: "controllers/view_comments.jsp",
        data: "post_id=" + post_id + "&type=" + type,
        success: function (msg) {
            $('#comments').html(msg);
            load_comments();
        },
        error: function (error) {
            $.rustaMsgBox({'mode': 'error', 'content': 'An error occured. Cannot display comments', 'fadeOut': true});

        }
    });
}

function edit_post(post_id) {

    title = $('#title' + post_id).html();
    content = $('#content' + post_id).html();
    image_url = $('#image' + post_id).attr('src');

    $('#form_title').val(title);
    $('#form_content').val(content);
    $('#output').attr('src', image_url);

    post('edit');

}

function delete_post(post_id, type) {

    $.confirm({
        animationSpeed: 750,
        title: 'Confirm!',
        content: 'Are you sure?!',
        confirm: function () {

            $.ajax({
                type: "post",
                url: "controllers/delete_post.jsp",
                data: "post_id=" + post_id + "&type=" + type,
                success: function (msg) {
                    $.ajax({
                        type: "post",
                        url: "controllers/load_blog.jsp",
                        data: "post_id=" + post_id + "&type=" + type,
                        success: function (msg) {


                        },
                        error: function (error) {
                            $.rustaMsgBox({'mode': 'error', 'content': 'Cannot delete', 'fadeOut': true});

                        }
                    });
                },
                error: function (error) {
                    $.rustaMsgBox({'mode': 'error', 'content': 'Cannot delete', 'fadeOut': true});
                }
            });
        }
    });
}
