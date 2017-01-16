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
            
	<li class="<% out.print(pageTitle == "home" ? "active" : ""); %>"><a href="index.jsp"><i class="fa fa-laptop"></i> <span>Dashboard</span></a></li>
        <li class="has-sub <% out.print(pageTitle == "vendor" ? "active" : ""); %>"><a href="javascript:;"><b class="caret pull-right"></b><i class="fa fa-user"></i><span>Vendor</span></a>
            <ul class="sub-menu">
                <li class="<% out.print(subPage == "allvendor" ? "active" : ""); %>"><a href="vendors.jsp">All Vendors</a></li>
                <li class="<% out.print(subPage == "vendorads" ? "active" : ""); %>"><a href="vendorAds.jsp">Vendor Advertisements</a></li>
            </ul>
        </li>
        <li class="has-sub <% out.print(pageTitle == "customer" ? "active" : ""); %>"><a href="javascript:;"><b class="caret pull-right"></b><i class="fa fa-users"></i><span>Customer</span></a>
            <ul class="sub-menu">
                <li class="<% out.print(subPage == "allcust" ? "active" : ""); %>"><a href="customers.jsp">All Customer</a></li>
                <li class="<% out.print(subPage == "allvis" ? "active" : ""); %>"><a href="visitor.jsp">All Visitors</a></li>
                <li class="<% out.print(subPage == "request" ? "active" : ""); %>"><a href="service_requests.jsp">Service Requests</a></li>
            </ul>
        </li>
        <li class="has-sub <% out.print(pageTitle == "frontend" ? "active" : ""); %>"><a href="javascript:;"><b class="caret pull-right"></b><i class="fa fa-star"></i><span>Front End</span> </a>
            <ul class="sub-menu">
                <li class="<% out.print(subPage == "terms" ? "active" : ""); %>"><a href="terms.jsp">Terms and Regulations</a></li>
                <li class="<% out.print(subPage == "legal" ? "active" : ""); %>"><a href="legal.jsp">Legal Information</a></li>
                <li class="<% out.print(subPage == "priv" ? "active" : ""); %>"><a href="PrivacyPolicy.jsp">Privacy Policy</a></li>
			</ul>
        </li>
        <li class="has-sub <% out.print(pageTitle == "store" ? "active" : ""); %>"><a href="javascript:;"><b class="caret pull-right"></b> <i class="fa fa-shopping-cart"></i><span>Online Store</span></a>
            <ul class="sub-menu">
                <li class="<% out.print(subPage == "cat" ? "active" : ""); %>"><a href="category.jsp">Category</a></li>
                <li class="<% out.print(subPage == "items" ? "active" : ""); %>"><a href="item.jsp">Store Items</a></li>
                <li class="<% out.print(subPage == "checkouts" ? "active" : ""); %>"><a href="checkout.jsp">Checkouts <span>  </span></a></li>
                <li class="<% out.print(subPage == "sup" ? "active" : ""); %>"><a href="Supplier.jsp"> Suppliers <span>  </span></a></li>
                <li class="<% out.print(subPage == "purOrders" ? "active" : ""); %>"><a href="purchase.jsp"> Purchase Orders <span>  </span></a></li>
			</ul>
		</li>
        <li class="has-sub <% out.print(pageTitle == "contest" ? "active" : ""); %>"><a href="javascript:;"><b class="caret pull-right"></b><i class="fa fa-check"></i><span>Couple Contest</span></a>
            <ul class="sub-menu">
                <li class="<% out.print(subPage == "conters" ? "active" : ""); %>"><a href="contestants.jsp">Contestants</a></li>
                <li class="<% out.print(subPage == "results" ? "active" : ""); %>"><a href="contest_results.jsp">Results</a></li>
                <li class="<% out.print(subPage == "setting" ? "active" : ""); %>"><a href="contest_settings.jsp">Settings</a></li>
            </ul>
        </li>
        <li class="<% out.print(pageTitle == "blog" ? "active" : ""); %>"><a href="news_blog.jsp "><i class="fa fa-pencil"></i> <span>News Blog</span></a></li>
        <li class="<% out.print(pageTitle == "chat" ? "active" : ""); %>"><a href="chat.jsp"><i class="fa fa-weixin" aria-hidden="true"></i> <span>Chat Room</span></a></li>
	<li class="has-sub <% out.print(pageTitle == "video" ? "active" : ""); %>"><a href="javascript:;"><b class="caret pull-right"></b><i class="fa fa-file-movie-o"></i><span>Thanking Video</span></a>
            <ul class="sub-menu">
                <li class="<% out.print(subPage == "setting_video" ? "active" : ""); %>"><a href="weddings.jsp">Settings</a></li>
                <li class="<% out.print(subPage == "links" ? "active" : ""); %>"><a href="videos.jsp">Videos</a></li>
            </ul>
        </li>
        <li class="has-sub <% out.print(pageTitle == "report" ? "active" : ""); %>"><a href="javascript:;"><b class="caret pull-right"></b><i class="fa fa-file-pdf-o"></i><span>Reports</span></a>
            <ul class="sub-menu">
                <li class="<% out.print(subPage == "vendorReport" ? "active" : ""); %>"><a href="vendorReports.jsp">Vendor Reports</a></li>
                <li class="<% out.print(subPage == "custReport" ? "active" : ""); %>"><a href="customerReports.jsp">Customer Reports</a></li>
                <li class="<% out.print(subPage == "storeReport" ? "active" : ""); %>"><a href="storeReports.jsp">Online Store Reports</a></li>
                <li class="<% out.print(subPage == "otherReport" ? "active" : ""); %>"><a href="otherReports.jsp">Other Reports</a></li>
            </ul>
        </li>
        <li class="<% out.print(pageTitle == "backup" ? "active" : ""); %>"><a href="backup.jsp"><i class="fa fa-download"></i> <span>Backup</span></a></li>
					
					
					
		<li><a href="javascript:;" class="sidebar-minify-btn" data-click="sidebar-minify"><i class="fa fa-angle-double-left"></i></a></li>
	</ul>
        <!-- end sidebar nav -->
    </div>
    <!-- end sidebar scrollbar -->
</div>
<div class="sidebar-bg"></div>