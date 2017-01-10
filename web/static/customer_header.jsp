<script src="myjs/logout.js"></script>

<header id="header" class="header">
    <div class="header-nav navbar-fixed-top header-dark navbar-white navbar-transparent navbar-sticky-animated animated-active">
        <div class="header-nav-wrapper">
            <div class="container">
                <nav>
                    <div id="menuzord-right" class="menuzord red"> <a class="menuzord-brand pull-left flip font-playball text-theme-colored font-32" href="javascript:void(0)"><i class="fa fa-heart-o font-25"></i> As You Wish <i class="fa fa-heart-o font-25"></i></a>                   
                        <div id="side-panel-trigger" class="side-panel-trigger"><a href="#"><i class="fa fa-bars font-24 text-gray-silver"></i></a></div>
                        <ul class="menuzord-menu">
                            <li><a href="couple_blog.jsp">Our Story</a></li>
                            <li><a href="news_blog.jsp">News Blog</a></li>
                            <li><a href="customer_gallery.jsp">Gallery</a></li>
                            <li><a href="vendor_list.jsp?service_id=1&service=Reception Halls">Vendors</a></li>
                            <li><a href="budget_planning.jsp">Budget Planning</a></li>
                            <li><a href="event_list.jsp">Events</a></li>
                            <li><a href="store.jsp">Online Store</a></li>
                            <li><a href="#"><img src="<%=session.getAttribute("image_url")%>" class="img-circle" style="position: relative;top: -10px;margin-left:8;margin-right: 8;" width="40" height="40"></a>
                                <ul class="dropdown">                             
                                    <li><a href="customer_account.jsp">My Account</a></li>
                                    <li><a href="" onclick="logout(); return false;">Sign Out</a></li>
                                </ul>
                            </li>

                        </ul>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</header>

<!--<div id="someidentifier">
    <div>
        <img src="../images/Ads/1.jpg"       
    </div>
    
</div>-->


<div id="adver" >
    <a onclick="ad()" style="color: black; float: right" >[x] Close Advertisement</a>
    <center><div id="imgAd"></div></center>
</div>





<script>

    $(document).ready(function () {
     
        $('#imgAd').load('controllers/ads.jsp');
    });

    $("#dialog-message").dialog({
        modal: true,
        draggable: false,
        resizable: false,
        show: 'blind',
        hide: 'blind',
        width: 500,
        dialogClass: 'ui-dialog-osx',
        buttons: {
            "Close": function () {
                $(this).dialog("close");
                startTime();
            }
        }
    });

    function ad() {
           alert('uvfy');
        $("#adver").toggle();
        $('#imgAd').load('controllers/ads.jsp');
        interval = setInterval(startTime, 5000);
    }

    function startTime() {
        $("#adver").toggle();
        clearInterval(interval);

    }

</script> 