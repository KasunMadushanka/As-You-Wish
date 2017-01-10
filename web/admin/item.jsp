<%@ include file="../config/sessionCheckAdmin.jsp" %>
<%

    ResultSet rs;
    String sql = "SELECT `itemId`,`itemName`, `price`, `reviews`,catName ,`stock`, margin FROM `items` inner join category on items.catId = category.catId";
    rs = getCon().createStatement().executeQuery(sql);

    String id = request.getParameter("txt");

    //String edit = request.getParameter("edit");
    //String 

%>

<!DOCTYPE html>

<html lang="en">
  
    <head>
        <%@ include file="static/head.jsp" %>
    </head>
    <body>

        <!-- begin #page-container -->
        <div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
            <!-- begin #header -->
            <%@ include file="static/header.jsp" %>
            <!-- end #header -->

            <!-- begin #sidebar -->
            <%
                    String pageTitle = "store";
                    String subPage = "items";
            %>
            <%@ include file="static/navbar.jsp" %>
            <!-- end #sidebar -->

            <!-- begin #content -->
            <div id="content" class="content">
                <!-- begin breadcrumb -->
                <ol class="breadcrumb pull-right">
                    <li><a href="javascript:;">Home</a></li>
                    <li><a href="javascript:;">Online Store</a></li>
                    <li class="active">Items</li>
                </ol>
                <!-- end breadcrumb -->
                <!-- begin page-header -->
                <h1 class="page-header">All Items <small></small></h1>
                <!-- end page-header -->

                <!-- begin row -->
                <div class="row">
                    <!-- begin col-12 -->
                    <div class="col-md-12">
                        <!-- begin panel -->
                        <div class="panel panel-inverse">
                            <div class="panel-heading">
                                <div class="panel-heading-btn">
                                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-repeat"></i></a>
                                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
                                </div>
                                <h4 class="panel-title">Data Table - Default</h4>
                            </div>
                            <div class="panel-body">
                                <button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#myModal2"><i class="fa fa-plus"></i>  Add New Item</button><br><br>

                                <table id="data-table" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Item Name</th>
                                            <th>Category Type</th>
                                            <th>Price</th>
                                            <th>No Of Items</th>
                                            <th>Stock Status</th>
                                            <th>Reviews</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%                                        while (rs.next()) {
                                                int s = Integer.parseInt(rs.getString("stock"));
                                                int margin = Integer.parseInt(rs.getString("margin"));
                                                String hhh = "";
                                                String hhh2 = "";
                                                String hhh3 = "";
                                                if (s > 0) {
                                                    hhh = s + " items";
                                                } else {
                                                    hhh = "<p style='color: red'> <b>" + s + " items</b></p>";
                                                }

                                                if (s > margin) {
                                                    hhh2 = "<p style='color: Green'> <b>Stock Available </b> </p>";
                                                    hhh3 = "<button type='submit' disabled='true' name='Pur' class='btn btn-success btn-sm' data-toggle='modal' data-target='#myModal3' ><i class='fa fa-cart-plus'></i> Re Order </button>";
                                                } else if (s <= margin && s > 0) {
                                                    hhh2 = "<p style='color: #ec971f'> <b>Item need to re-order</b></p>";
                                                    hhh3 = "<button type='submit' name='Pur' class='btn btn-success btn-sm' data-toggle='modal' data-target='#myModal3' ><i class='fa fa-cart-plus'></i> Re Order </button>";
                                                } else {
                                                    hhh2 = "<p style='color: red'> <b>No Stock</b></p>";
                                                    hhh3 = "<button type='submit' name='Pur' class='btn btn-success btn-sm' data-toggle='modal' data-target='#myModal3' ><i class='fa fa-cart-plus'></i> Re Order </button>";
                                                }


                                        %>
                                        <tr class="odd gradeX">
                                            <td><%= rs.getString("itemName")%></td>
                                            <td><%= rs.getString("catName")%></td>
                                            <td><%= rs.getString("price")%></td>
                                            <td><%= hhh%></td>
                                            <td><%= hhh2%></td>
                                            <td><%= rs.getString("reviews")%></td>
                                            <td> 
                                                <form  method="post">
                                                    <input type="hidden" id="txt" name="txt" value="<%= rs.getString("itemId")%>">
                                                    <button type="submit"  name="editCat" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal1" ><i class="fa fa-pencil-square-o"></i> Edit</button>                                                         
                                                    <button type="submit" name="delCat" id="mf2"  onclick="return confirm('Are you sure you want to delete ?');" class="btn btn-warning btn-sm"><i class="fa fa-trash-o"></i> Delete</button>
                                                    <%= hhh3%>
                                                </form>
                                            </td>

                                        </tr>

                                        <%
                                            }

                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!-- end panel -->
                    </div>
                    <!-- end col-12 -->
                </div>
                <!-- end row -->
            </div>
            <!-- end #content -->

            <!-- ###############################################          Model     ###################################################################################################################-->         
            <div class="modal fade" id="myModal2" role="dialog">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Insert New Item</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <!-- begin col-6 -->
                                <div class="col-md-12">
                                    <!-- begin panel -->
                                    <div class="panel panel-inverse" data-sortable-id="form-validation-1">
                                        <div class="panel-body panel-form">
                                            <form class="form-horizontal form-bordered" id="form_upload" action="../controllers/online_store/insertItem.jsp" method="get" enctype="multipart/form-data"  data-parsley-validate="true" name="demo-form1" >
                                                <div class="form-group">
                                                    <label class="control-label col-md-4 col-sm-4" for="email">Item Name :</label>
                                                    <div class="col-md-6 col-sm-6">
                                                        <input class="form-control" type="text" id="email" name="Name" data-parsley-required="true" required value="" /> 
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-4 col-sm-4" for="website">Category Type :</label>
                                                    <div class="col-md-6 col-sm-6">
                                                        <select class="form-control" id="city" name="cat" required>
                                                            <%                                                                    ResultSet rs2;
                                                                String sql2 = "SELECT * FROM category";
                                                                rs2 = getCon().createStatement().executeQuery(sql2);
                                                                while (rs2.next()) {
                                                            %>
                                                            <option value="<%= rs2.getString("catId")%>" ><%= rs2.getString("catName")%></option>
                                                            <%	}
                                                            %>
                                                        </select>


                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-4 col-sm-4" for="email">Price (LKR) :</label>
                                                    <div class="col-md-6 col-sm-6">
                                                        <input class="form-control" type="text" id="rate" name="price" placeholder="1000.00" data-parsley-required="true" required value="" /> 
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-4 col-sm-4" for="email">Tag :</label>
                                                    <div class="col-md-6 col-sm-6">
                                                        <input class="form-control" type="text" id="rate" name="tag" placeholder="10% discount" data-parsley-required="true" required value="" /> 
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-4 col-sm-4" for="email">Description :</label>
                                                    <div class="col-md-6 col-sm-6">
                                                        <textarea class="form-control" cols="5" rows="5" name="desc" ></textarea>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-4 col-sm-4" for="website">Supplier :</label>
                                                    <div class="col-md-6 col-sm-6">
                                                        <select class="form-control" id="city" name="sup" required>
                                                            <%
                                                                ResultSet rsSupp;
                                                                String sqlSupp = "SELECT * FROM `supplier`";
                                                                rsSupp = getCon().createStatement().executeQuery(sqlSupp);
                                                                while (rsSupp.next()) {
                                                            %>
                                                            <option value="<%= rsSupp.getString("sId")%>" ><%= rsSupp.getString("sName")%></option>
                                                            <%	}
                                                            %>
                                                        </select>


                                                    </div>
                                                </div>        
                                                <div class="form-group">
                                                    <label class="control-label col-md-4 col-sm-4" for="email">Brand :</label>
                                                    <div class="col-md-6 col-sm-6">
                                                        <input class="form-control" type="text" id="rate" name="brand" placeholder="" data-parsley-required="true" required value="" /> 
                                                    </div>
                                                    <label class="control-label col-md-4 col-sm-4" for="email">Weight :</label>
                                                    <div class="col-md-6 col-sm-6">
                                                        <input class="form-control" type="text" id="rate" name="weight" placeholder="150g" data-parsley-required="true" required value="" /> 
                                                    </div>
                                                    <label class="control-label col-md-4 col-sm-4" for="email">Size :</label>
                                                    <div class="col-md-6 col-sm-6">
                                                        <input class="form-control" type="text" id="rate" name="size" placeholder="" data-parsley-required="true" required value="" /> 
                                                    </div>
                                                    <label class="control-label col-md-4 col-sm-4" for="email">Color :</label>
                                                    <div class="col-md-6 col-sm-6">
                                                        <input class="form-control" type="text" id="rate" name="color" placeholder="" data-parsley-required="true" required value="" /> 
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-4 col-sm-4" for="email">Stock :</label>
                                                    <div class="col-md-6 col-sm-6">
                                                        <input class="form-control" type="number" id="rate" name="stock" placeholder="No of Items" data-parsley-required="true" required value="0" /> 
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-4 col-sm-4" for="email">Re Order Level :</label>
                                                    <div class="col-md-6 col-sm-6">
                                                        <input class="form-control" type="number" id="rate" name="reOrder" placeholder="5" data-parsley-required="true" required value="5" /> 
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-4 col-sm-4" for="message">Image :</label>
                                                    <div class="col-md-3 col-sm-3">
                                                        <input type="file" name="file" id="file" accept="image/*" required >

                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-4 col-sm-4"></label>
                                                    <div class="col-md-6 col-sm-6">
                                                        <button type="submit" id="upload_button" onclick="return xxx();" name="sbmitItem"  class="btn btn-primary">Add to database</button> 
                                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <!-- end panel -->
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>



            <!-- ###############################################          Model     ###################################################################################################################-->         

            <%
                if (id != null) {
                    String CatName = "";
                    if (request.getParameter("editCat") != null) {

                        String iName = "";
                        String price = "";
                        String tag = "";
                        String desc = "";
                        String brand = "";
                        String weight = "";
                        String size = "";
                        String color = "";
                        String img = "";
                        String catId = "";
                        String stock = "";
                        String reOrder = "";
                        String supp = "";

                        ResultSet rs3 = getCon().createStatement().executeQuery("Select * from items where itemId = '" + id + "'");
                        while (rs3.next()) {
                            iName = rs3.getString("itemName");
                            price = rs3.getString("price");
                            tag = rs3.getString("tag");
                            desc = rs3.getString("desc");
                            brand = rs3.getString("brand");
                            weight = rs3.getString("weight");
                            size = rs3.getString("size");
                            color = rs3.getString("color");
                            img = rs3.getString("img");
                            catId = rs3.getString("catId");
                            stock = rs3.getString("stock");
                            reOrder = rs3.getString("margin");
                            supp = rs3.getString("supId");
                        }

            %>


            <div class="modal fade" id="myModal1" role="dialog">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Edit Item</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <!-- begin col-6 -->
                                <div class="col-md-12">
                                    <!-- begin panel -->
                                    <div class="panel panel-inverse" data-sortable-id="form-validation-1">
                                        <div class="panel-body panel-form">
                                            <form class="form-horizontal form-bordered" action="../controllers/online_store/updateItem.jsp" method="get" enctype="multipart/form-data"  data-parsley-validate="true" name="demo-form1" >
                                                <div class="form-group">
                                                    <label class="control-label col-md-4 col-sm-4" for="email">Item Name :</label>
                                                    <div class="col-md-6 col-sm-6">
                                                        <input class="form-control" type="text" id="email" name="Name" data-parsley-required="true" required value="<%= iName%>" />
                                                        <input type="hidden" name="itemId" value="<%= id%>">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-4 col-sm-4" for="website">Category Type :</label>
                                                    <div class="col-md-6 col-sm-6">
                                                        <select class="form-control" id="city" name="cat" required>
                                                            <%
                                                                ResultSet rs4;
                                                                String sql4 = "SELECT * FROM category ";
                                                                rs4 = getCon().createStatement().executeQuery(sql4);
                                                                while (rs4.next()) {
                                                                    if (rs4.getString("catId") == catId) {%>
                                                            <option selected value="<%= rs4.getString("catId")%>"> <%= rs4.getString("catName")%></option>
                                                            <% } else {%>
                                                            <option value="<%= rs4.getString("catId")%>" ><%= rs4.getString("catName")%></option>
                                                            <% }

                                                            %>

                                                            <%	}
                                                            %>
                                                        </select>


                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-4 col-sm-4" for="email">Price (LKR) :</label>
                                                    <div class="col-md-6 col-sm-6">
                                                        <input class="form-control" type="text" id="rate" name="price" placeholder="1000.00" data-parsley-required="true" required value="<%= price%>" /> 
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-4 col-sm-4" for="email">Tag :</label>
                                                    <div class="col-md-6 col-sm-6">
                                                        <input class="form-control" type="text" id="rate" name="tag" placeholder="10% discount" data-parsley-required="true" required value="<%= tag%>" /> 
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-4 col-sm-4" for="email">Description :</label>
                                                    <div class="col-md-6 col-sm-6">
                                                        <textarea class="form-control" cols="5" rows="10" name="desc" ><%= desc%></textarea>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-4 col-sm-4" for="website">Supplier :</label>
                                                    <div class="col-md-6 col-sm-6">
                                                        <select class="form-control" id="city" name="supp" required>
                                                            <%
                                                                ResultSet rsSupp2;
                                                                String sqlSupp2 = "SELECT * FROM `supplier` ";
                                                                rsSupp2 = getCon().createStatement().executeQuery(sqlSupp2);
                                                                while (rsSupp2.next()) {
                                                                    String ff = rsSupp2.getString("sId");
                                                                    if (ff == supp) {%>
                                                            <option selected value="<%= rsSupp2.getString("sId")%>" ><%= rsSupp2.getString("sName")%></option>
                                                            <% }
                                                                if (ff != supp) {%>
                                                            <option value="<%= rsSupp2.getString("sId")%>" ><%= rsSupp2.getString("sName")%></option>
                                                            <% }

                                                            %>


                                                            <%	}
                                                            %>
                                                        </select>


                                                    </div>
                                                </div>        
                                                <div class="form-group">
                                                    <label class="control-label col-md-4 col-sm-4" for="email">Brand :</label>
                                                    <div class="col-md-6 col-sm-6">
                                                        <input class="form-control" type="text" id="rate" name="brand" placeholder="" data-parsley-required="true" required value="<%= brand%>" /> 
                                                    </div>
                                                    <label class="control-label col-md-4 col-sm-4" for="email">Weight :</label>
                                                    <div class="col-md-6 col-sm-6">
                                                        <input class="form-control" type="text" id="rate" name="weight" placeholder="150g" data-parsley-required="true" required value="<%= weight%>" /> 
                                                    </div>
                                                    <label class="control-label col-md-4 col-sm-4" for="email">Size :</label>
                                                    <div class="col-md-6 col-sm-6">
                                                        <input class="form-control" type="text" id="rate" name="size" placeholder="" data-parsley-required="true" required value="<%= size%>" /> 
                                                    </div>
                                                    <label class="control-label col-md-4 col-sm-4" for="email">Color :</label>
                                                    <div class="col-md-6 col-sm-6">
                                                        <input class="form-control" type="text" id="rate" name="color" placeholder="" data-parsley-required="true" required value="<%= color%>" /> 
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-4 col-sm-4" for="email">Stock :</label>
                                                    <div class="col-md-6 col-sm-6">
                                                        <input class="form-control" type="text" id="rate" name="stock" placeholder="No of Items" data-parsley-required="true" required value="<%= stock%>" /> 
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-4 col-sm-4" for="email">Re Order Level :</label>
                                                    <div class="col-md-6 col-sm-6">
                                                        <input class="form-control" type="number" id="rate" name="reOrder" placeholder="5" data-parsley-required="true" required value="<%= reOrder%>"/> 
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-4 col-sm-4" for="message">Image :</label> 
                                                    <div class="col-md-3 col-sm-3">
                                                        <input type="file" name="file" id="file"  accept="image/*">
                                                        <input type="hidden" name="filex" value="<%= img%>"  />

                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="control-label col-md-4 col-sm-4"></label>
                                                    <div class="col-md-6 col-sm-6">
                                                        <button type="submit" name="updateItem"  class="btn btn-primary">Update Item</button> 
                                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                                                    </div>
                                                </div>

                                        </div>
                                        </form>
                                    </div>
                                    <!-- end panel -->
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>    
        <%    }

            if (request.getParameter("Pur") != null) {

                String iName = "";
                String price = "";
                String tag = "";
                String desc = "";
                String brand = "";
                String weight = "";
                String size = "";
                String color = "";
                String img = "";
                String catId = "";
                String stock = "";
                String reOrder = "";
                String supp = "";

                ResultSet rs3 = getCon().createStatement().executeQuery("Select * from items where itemId = '" + id + "'");
                while (rs3.next()) {
                    iName = rs3.getString("itemName");
                    price = rs3.getString("price");
                    tag = rs3.getString("tag");
                    desc = rs3.getString("desc");
                    brand = rs3.getString("brand");
                    weight = rs3.getString("weight");
                    size = rs3.getString("size");
                    color = rs3.getString("color");
                    img = rs3.getString("img");
                    catId = rs3.getString("catId");
                    stock = rs3.getString("stock");
                    reOrder = rs3.getString("margin");
                    supp = rs3.getString("supId");
                }

        %>


        <div class="modal fade" id="myModal3" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Purchase Order</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <!-- begin col-6 -->
                            <div class="col-md-12">
                                <!-- begin panel -->
                                <div class="panel panel-inverse" data-sortable-id="form-validation-1">
                                    <div class="panel-body panel-form">
                                        <form class="form-horizontal form-bordered" action="../controllers/online_store/insertPur.jsp" method="get" enctype="multipart/form-data"  data-parsley-validate="true" name="demo-form1" >
                                            <div class="form-group">
                                                <label class="control-label col-md-4 col-sm-4" for="email">Item Name :</label>
                                                <div class="col-md-6 col-sm-6">
                                                    <input class="form-control" type="text" id="email" name="Name" readonly data-parsley-required="true" required value=" <%=iName%>" />
                                                    <input type="hidden" name="itemId" value="<%= id%>">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-4 col-sm-4" for="email">Re Order Stock :</label>
                                                <div class="col-md-6 col-sm-6">
                                                    <input class="form-control" type="number" id="rate" name="reOrder" placeholder="5" data-parsley-required="true" required value="<%= reOrder%>" /> 
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-4 col-sm-4"></label>
                                                <div class="col-md-6 col-sm-6">
                                                    <button type="submit" name="addStock"  class="btn btn-primary">Send the Order</button> 
                                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                                                </div>
                                            </div>


                                        </form>
                                    </div>
                                </div>
                                <!-- end panel -->
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>    
    <%    }

            if (request.getParameter("delCat") != null) {

                Statement stx = getCon().createStatement();
                int i2 = stx.executeUpdate("delete from items where itemId = '" + id + "'");

                if (i2 == 1) {
                    out.print("<script>swal({  title: 'Item Deleted!', text: '', type: 'success', confirmButtonText: 'Done!'}, function(){ window.location.href='item.jsp'; });</script>");

                } else {
                    response.sendRedirect("../admin/error.jsp");
                }

            }

        }


    %>






    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->
</div>
<!-- end page container -->

<!-- ================== BEGIN BASE JS ================== -->
<script src="assets/plugins/jquery/jquery-1.9.1.min.js"></script>
<script src="assets/plugins/jquery/jquery-migrate-1.1.0.min.js"></script>
<script src="assets/plugins/jquery-ui/ui/minified/jquery-ui.min.js"></script>
<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!--[if lt IE 9]>
        <script src="assets/crossbrowserjs/html5shiv.js"></script>
        <script src="assets/crossbrowserjs/respond.min.js"></script>
        <script src="assets/crossbrowserjs/excanvas.min.js"></script>
<![endif]-->
<script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="assets/plugins/jquery-cookie/jquery.cookie.js"></script>
<!-- ================== END BASE JS ================== -->

<!-- ================== BEGIN PAGE LEVEL JS ================== -->
<script src="assets/plugins/DataTables/media/js/jquery.dataTables.js"></script>
<script src="assets/plugins/DataTables/media/js/dataTables.bootstrap.min.js"></script>
<script src="assets/plugins/DataTables/extensions/Responsive/js/dataTables.responsive.min.js"></script>
<script src="assets/js/table-manage-default.demo.min.js"></script>
<script src="assets/js/apps.min.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->

<script>
                                                            $(document).ready(function () {
                                                                App.init();
                                                                TableManageDefault.init();
                                                            });
                                                            $('#myModal1').modal({
                                                                show: true
                                                            });
                                                            $('#myModal3').modal({
                                                                show: true
                                                            });


                                                            function xxx()
                                                            {
                                                                var form = $('#form_upload')[0];
                                                                var formData = new FormData(form);
                                                                $.ajax({
                                                                    type: "post",
                                                                    url: "../controllers/online_store/uploadItemImg.jsp",
                                                                    data: formData,
                                                                    contentType: false,
                                                                    processData: false,
                                                                    success: function (msg) {
                                                                        return false;
                                                                    },
                                                                    error: function (error) {
                                                                        return false;

                                                                    }
                                                                });



                                                            }




</script>


<script>
    (function (i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r;
        i[r] = i[r] || function () {
            (i[r].q = i[r].q || []).push(arguments)
        }, i[r].l = 1 * new Date();
        a = s.createElement(o),
                m = s.getElementsByTagName(o)[0];
        a.async = 1;
        a.src = g;
        m.parentNode.insertBefore(a, m)
    })(window, document, 'script', '../../../../www.google-analytics.com/analytics.js', 'ga');

    ga('create', 'UA-53034621-1', 'auto');
    ga('send', 'pageview');
</script>
</body>

<!-- Mirrored from seantheme.com/color-admin-v1.9/admin/html/table_manage.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 19 Oct 2015 11:23:32 GMT -->
</html>

