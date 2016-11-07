function update_like(post_id, count) {

    count += 1;

    $.ajax({
        type: "post",
        url: "controllers/update_like.jsp",
        data: "post_id=" + post_id + "&count=" + count,
        success: function (msg) {
            document.getElementById(post_id).innerHTML = '<i class="fa fa-thumbs-up fa-fw"></i>' + count;
        },
        error: function (error) {
            alert(error);

        }
    });

}

function update_comment(post_id, event) {

    if (event.which === 13 || event.keyCode === 13) {

        comment = $('#text' + post_id).val();

        $.ajax({
            type: "post",
            url: "controllers/update_comment.jsp",
            data: "post_id=" + post_id + "&comment=" + comment,
            success: function (msg) {
                $('#comments_count'+post_id).html(parseInt($('#comments_count'+post_id).html()) + 1);
                $.rustaMsgBox({'mode': 'info', 'content': 'Comment added', 'fadeOut': true});


            },
            error: function (error) {
                $.rustaMsgBox({'mode': 'error', 'content': 'Failed to add comment', 'fadeOut': true});

            }
        });
        return false;
    }
    return true;
}

function view_comments(post_id) {

    $.ajax({
        type: "post",
        url: "controllers/view_comments.jsp",
        data: "post_id=" + post_id,
        success: function (msg) {
            if (msg != "") {
                $('#comments-form').html(msg);
            } else {
                $('#comments-form').html("No Comments yet...");
            }
            $('#modal-comments').modal('show');

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
