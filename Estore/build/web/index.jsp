<%@page import="com.leapfrog.estore.util.Product"%>
<%@page import="com.leapfrog.estore.dao.impl.ProductDAOImpl"%>
<%@page import="com.leapfrog.estore.dao.ProductDAO"%>
<%@include file="header.jsp" %>
<div>
    <p>
    <h2>Mero Liquor Shop</h2>
</p>
</div>
<div class="pull-right">
        <a href="addproduct.jsp" class="btn btn-primary btn-xs"><span class="glyphicon glyphicon-plus">ADD</span></a>
</div>
<table class="table table-hover"  >
    <tr>
        <th>ID</th>
        <th>Product Name</th>
        <th>Description</th>
        <th>Price(NRs)</th>
        <th>Status</th>
        <th>Action</th>
    </tr>
    <%
        ProductDAO productDAO = new ProductDAOImpl();
        for (Product product : productDAO.getAll()) {
    %>
    <tr class="<% out.println(!(product.isStatus()) ? "danger" : "");%>">
        <td><%=product.getId()%></td>
        <td><%=product.getName()%></td>
        <td><%=product.getDescription()%></td>
        <td><%=product.getPrice()%></td>
        <td><%=product.isStatus()%></td>
        <td>
            <a href="editproduct.jsp?id=<%=product.getId()%>" class="btn btn-info btn-xs"><span class="glyphicon glyphicon-pencil"></span></a>
            <a href="deleteproduct.jsp?id=<%=product.getId()%>" class="btn btn-danger btn-xs" onclick="return confirm('Are you sure to delete?')"><span class="glyphicon glyphicon-trash"></span></a>
        </td>
    </tr>
    <%}%>
</table>
<%@include file="footer.jsp" %>
