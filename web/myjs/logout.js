function logout() {

    $.ajax({
        type: "post",
        url: "controllers/logout.jsp",
        success: function (msg) {
            document.location.href = "index.jsp";
        },
        error: function (error) {
            alert(error);
        }
    });

}