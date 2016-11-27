<div id="sidebar" class="sidebar">
    <!-- begin sidebar scrollbar -->
    <div data-scrollbar="true" data-height="100%">
        <!-- begin sidebar user -->
        <ul class="nav">
            <li class="nav-profile">
                <div class="image">
                    <a href="javascript:;"><img src="<%=session.getAttribute("img")%>" alt="" /></a> 
                </div>
                <div class="info">
                    <%=session.getAttribute("name")%> 
                    <small><%= session.getAttribute("pos")%></small> 
                </div>
            </li>
        </ul>
        <!-- end sidebar user -->
        <!-- begin sidebar nav -->
        <ul class="nav">
            <li class="nav-header">Navigation</li>
            <li class="active"><a href="index.jsp"><i class="fa fa-laptop"></i> <span>Dashboard</span></a></li>
            <li class="has-sub">
                <a href="javascript:;">
                    <b class="caret pull-right"></b>
                    <i class="fa fa-user"></i> 
                    <span>Users</span>
                </a>
                <ul class="sub-menu">
                    <li><a href="email_inbox.html">Vendors</a></li>
                    <li><a href="email_inbox.html">Customers</a></li>
                </ul>
            </li>
            <li class="has-sub">
                <a href="javascript:;">
                    <b class="caret pull-right"></b>
                    <i class="fa fa-star"></i>
                    <span>Front End</span> 
                </a>
                <ul class="sub-menu">
                    <li><a href="ui_general.html">News Blog</a></li>
                    <li><a href="ui_typography.html">Online Items</a></li>
                    <li><a href="ui_tabs_accordions.html">Terms and Regulations</a></li>
                    <li><a href="ui_unlimited_tabs.html">Contact Us</a></li>
                    <li><a href="ui_modal_notification.html">Images</a></li>

                </ul>
            </li>
            <li class="has-sub">
                <a href="javascript:;">
                    <b class="caret pull-right"></b>
                    <i class="fa fa-shopping-cart"></i>
                    <span>Online Store</span> 
                </a>
                <ul class="sub-menu">
                    <li><a href="category.jsp">Category</a></li>
                    <li><a href="item.jsp">Store Items</a></li>
                    <li><a href="checkout.jsp">Checkouts <span>  </span></a></li>
                    <li><a href="Supplier.jsp"> Suppliers <span>  </span></a></li>
                    <li><a href="purchase.jsp"> Purchase Orders <span>  </span></a></li>

                </ul>
            </li>
            <li class="has-sub">
                <a href="javascript:;">
                    <b class="caret pull-right"></b>
                    <i class="fa fa-check"></i>
                    <span>Couple Contest</span> 
                </a>
                <ul class="sub-menu">
                    <li><a href="contestants.jsp">Contestants</a></li>
                    <li><a href="contest_results.jsp">Results</a></li>
                    <li><a href="contest_settings.jsp">Settings</a></li>

                </ul>
            </li>

            <li><a href="news_blog.jsp"><i class="fa fa-pencil"></i> <span>News Blog</span></a></li>

            <li><a href="chat.jsp"><i class="fa fa-weixin" aria-hidden="true"></i> <span>Chat Room</span><span class="badge pull-right">10</span></a></li>

            <li class="has-sub">
                <a href="javascript:;">
                    <b class="caret pull-right"></b>
                    <i class="fa fa-file-movie-o"></i>
                    <span>Thanking Video</span> 
                </a>
                <ul class="sub-menu">
                    <li><a href="video_preview.jsp">Preview</a></li>
                    <li><a href="video_settings.jsp">Settings</a></li>
                </ul>
            </li>

            <li><a href="Reports.jsp"><i class="fa fa-file-pdf-o"></i> <span>Reports</span></a></li>

            <li><a href="backup.jsp"><i class="fa fa-download"></i> <span>Backup</span></a></li>



            <li><a href="javascript:;" class="sidebar-minify-btn" data-click="sidebar-minify"><i class="fa fa-angle-double-left"></i></a></li>
            <!-- end sidebar minify button -->
        </ul>
        <!-- end sidebar nav -->
    </div>
    <!-- end sidebar scrollbar -->
</div>
<div class="sidebar-bg"></div>