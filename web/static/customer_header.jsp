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
                            <li><a href="" onclick="logout(); return false;">Logout</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</header>
<div id="dialog-message" class="xdf" title="Advertisement" style="z-index: 999">
            <div id="imgAd" style="margin-left: 23px;">
                
            </div>
</div>

<script>
        
            $(document).ready(function() {
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
                    "Close": function() {
                        $(this).dialog("close");
                        startTime();
                    }
                }
            });
            
            function startTime(){
                
               setInterval(function(){
                  $('#imgAd').load('controllers/ads.jsp');
                  $('#dialog-message').dialog('open');
                },10000);
                
            }
            
</script> 