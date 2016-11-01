<!doctype html>
<html lang="en-us">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>As You Wish</title>
        <link rel="stylesheet" href="video_data/template_data/style.css">
        <script src="video_data/template_data/UnityProgress.js"></script>

    </head>
    <body>
        <section data-bg-img="images/bg/bg22.png">
            <div class="template">
                <div class="template-wrap clear">
                    <canvas class="emscripten" id="canvas" oncontextmenu="event.preventDefault()" height="450px" width="750px" style="position:relative;top:50px;"></canvas>
                    <br>
                    <div class="logo"></div>
                </div>

                <script type='text/javascript'>
                    var Module = {
                        TOTAL_MEMORY: 268435456,
                        errorhandler: null,
                        compatibilitycheck: null,
                        dataUrl: "video_data/Video.data",
                        codeUrl: "video_data/Video.js",
                        memUrl: "video_data/Video.mem",
                    };
                </script>
                <script src="video_data/UnityLoader.js"></script>
            </div>
        </section>  
    </body>
</html>