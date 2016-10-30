<%
    String current_page = (String) session.getAttribute("page");
%>

<div id="side-panel" class="bg-black-111">
    <div class="side-panel-wrap">
        <div id="side-panel-trigger-close" class="side-panel-trigger"><a href="#"><i class="icon_close font-30"></i></a></div>
        <div>
           <a class="menuzord-brand pull-left flip font-playball text-white font-22 pt-30 pb-30" href="javascript:void(0)"><i class="fa fa-heart-o font-25"></i> As You Wish <i class="fa fa-heart-o font-25"></i></a>
        </div>
        <div class="side-panel-nav mt-30">
            <div class="widget no-border">
                <nav>
                    <ul class="nav nav-list">
                        <%if (current_page.equals("couple_blog")) {%>
                        <li><a id="new_post" href="" onclick="post('new');return false;">New Post</a></li>
                            <%} else if (current_page.equals("gallery")) {%>
                        <li><a id="add_images" href="#">Add Images</a></li>
                            <%}%>
                        <li><a href="#">Invitations</a></li>
                        <li><a href="#">Reviews</a></li>
                        <li><a class="tree-toggler nav-header" href="#">Messages<i class="fa fa-angle-down"></i></a>
                            <ul class="nav nav-list tree">
                                <li><a id="new_post" href="#">New Message</a></li>
                                <li><a id="new_post" href="#">Received</a></li>
                                <li><a id="new_post" href="#">Sent</a></li>
                            </ul>
                        </li>
                        <li><a class="tree-toggler nav-header" href="#">Contact<i class="fa fa-angle-down"></i></a>
                            <ul class="nav nav-list tree">
                                <li><a href="#">Vendor</a></li>
                                <li><a href="#">Friend</a></li>
                                <li><a href="#">Admin</a></li>
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