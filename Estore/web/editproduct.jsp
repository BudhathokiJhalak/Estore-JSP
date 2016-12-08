<%@page import="com.leapfrog.estore.dao.impl.ProductDAOImpl"%>
<%@page import="com.leapfrog.estore.dao.ProductDAO"%>
<%@page import="com.leapfrog.estore.util.Product"%>
<%@include file="header.jsp" %>
<%
    ProductDAO productDAO = new ProductDAOImpl();
    Product product = new Product();
    if (request.getMethod().equalsIgnoreCase("post")) {
        product = new Product();
        product.setId(Integer.parseInt(request.getParameter("id")));
        product.setName(request.getParameter("name"));
        product.setDescription(request.getParameter("description"));
        product.setPrice(Double.parseDouble(request.getParameter("price")));
        product.setStatus(request.getParameter("status")!=null);
        
        if(productDAO.update(product)>0){
            response.sendRedirect("index.jsp?success");
        }
    }
    if (request.getParameter("id") != null && !request.getParameter("id").isEmpty()) {
        int id=Integer.parseInt(request.getParameter("id"));
        product = productDAO.getById(id);
    } else {
        response.sendRedirect("index.jsp?error");
    }
%>
<div>
    <p>
    <h2>EDIT Product</h2>
</p>
</div>
<form method="post">
    <div class="form-group">
        <label>Product Name</label>
        <input type="text" name="name" class="form-control" required="required" value="<%=product.getName()%>"/>
    </div>
    <div class="form-group">
        <label>Description</label>
        <textarea name="description" class="form-control" required="required"/><%=product.getDescription()%></textarea>
    </div>
    <div class="form-group">
        <label>Price(NRs)</label>
        <input type="text" name="price" class="form-control" required="required" value="<%=product.getPrice()%>"/>
    </div>
    <div class="checkbox">
        <label>Status</label>
        <label><input type="checkbox" name="status"<% out.println((product.isStatus())?"checked='checked'":""); %>>Active</label>
    </div>
    <button type="submit" class="btn btn-success">Save</button>
    <a href="index.jsp" class="btn btn-danger">Back</a>
</form>
<%@include file="footer.jsp" %>