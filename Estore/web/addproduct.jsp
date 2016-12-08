<%@page import="com.leapfrog.estore.util.Product"%>
<%@page import="com.leapfrog.estore.dao.impl.ProductDAOImpl"%>
<%@page import="com.leapfrog.estore.dao.ProductDAO"%>
<%
    ProductDAO productDAO = new ProductDAOImpl();
    if (request.getMethod().equalsIgnoreCase("post")) {
        Product product = new Product();
        product.setName(request.getParameter("name"));
        product.setDescription(request.getParameter("description"));
        product.setPrice(Double.parseDouble(request.getParameter("price")));
        product.setStatus(request.getParameter("status")!=null);

        if (productDAO.insert(product) > 0) {
            response.sendRedirect("index.jsp?success");
        }
    }
%>
<%@include file="header.jsp" %>
<div>
    <p>
    <h2>ADD Product</h2>
</p>
</div>
<form method="post">
    <div class="form-group">
        <label>Product Name</label>
        <input type="text" name="name" class="form-control" required="required"/>
    </div>
    <div class="form-group">
        <label>Description</label>
        <textarea name="description" class="form-control" required="required"/></textarea>
    </div>
    <div class="form-group">
        <label>Price(NRs)</label>
        <input type="text" name="price" class="form-control" required="required"/>
    </div>
    <div class="checkbox">
        <label>Status</label>
        <label><input type="checkbox" name="status">Active</label>
    </div>
    <button type="submit" class="btn btn-success">Save</button>
    <a href="index.jsp" class="btn btn-danger">Back</a>
</form>

<%@include file="footer.jsp" %>