

<%
    String cur_page = (String) session.getAttribute("page");
%>

<div id="side-panel" class="bg-black-111">
    <div class="side-panel-wrap">
        <div id="side-panel-trigger-close" class="side-panel-trigger"><a href="#"><i class="icon_close font-30"></i></a></div>
        <a class="menuzord-brand pull-left flip font-playball text-white font-21 pt-30 pb-30" href="javascript:void(0)"><i class="fa fa-heart-o font-25"></i> As You Wish <i class="fa fa-heart-o font-25"></i></a>
        <div class="side-panel-nav mt-30">
            <div class="widget no-border">
                <nav>
                    <ul class="nav nav-list">
                        <%if (cur_page.equals("vendor_blog")) {%>
                        <li><a onclick="post('new')" href="#">New Post</a></li>
                            <%} else if (cur_page.equals("gallery")) {%>
                        <li><a href="#">Add Images</a></li>
                            <%} else if (cur_page.equals("storefront")) {%>
                        <li><a class="tree-toggler nav-header" href="#">Edit<i class="fa fa-angle-down"></i></a>
                            <ul class="nav nav-list tree">
                                <li><a id="front_images" href="#">Front Images</a></li>
                                <li><a id="about" href="#">Introduction</a></li>
                                 <li><a id="vision" href="#">Vision</a></li>
                                <li><a id="location" href="#">Location</a></li>
                                <li><a id="contact" href="#">Contact</a></li>
                                <li><a id="pricing" href="#">Pricing</a></li>
                            </ul>
                        </li>
                        <%}%>
                        <li><a class="tree-toggler nav-header" href="#">Messages<i class="fa fa-angle-down"></i></a>
                            <ul class="nav nav-list tree">
                                <li><a id="new_message" href="#">New Message</a></li>
                                <li><a id="received" href="#">Received</a></li>
                                <li><a id="sent" href="#">Sent</a></li>              
                            </ul>
                        </li>
                        <li><a id="reviews" href="#">Reviews</a></li>
                        <li><a id="reports" href="#">Reports</a></li>
                        <li><a id="advertisements" href="#">Advertisements</a></li>
                        <li><a id="subscription" href="#">Subscription</a></li>
                        <li><a class="tree-toggler nav-header" href="#">Contact<i class="fa fa-angle-down"></i></a>
                            <ul class="nav nav-list tree">
                                <li><a id="contact_customer" href="#">Customer</a></li>
                                <li><a id="contact_vendor" href="#">Vendor</a></li>
                                <li><a id="contact_admin" href="#">Admin</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="side-panel-widget mt-30">
            <div class="widget no-border">
                <ul>
                    <li class="font-14 mb-5"> Phone: <a href="#" class="text-gray">+(094) 012 145 424</a> </li>
                    <li class="font-14 mb-5"> Email: <a href="#" class="text-gray">asyouwish077@gmail.com</a> </li>
                </ul>
            </div>
        </div>
    </div>
</div>