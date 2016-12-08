<%@page import="com.leapfrog.estore.dao.impl.ProductDAOImpl"%>
<%@page import="com.leapfrog.estore.dao.ProductDAO"%>
<%
    if (request.getParameter("id") != null && !request.getParameter("id").isEmpty()) {
        ProductDAO productDAO = new ProductDAOImpl();
        if (productDAO.delete(Integer.parseInt(request.getParameter("id"))) > 0) {
            response.sendRedirect("index.jsp?success");
        }
    } else {
        response.sendRedirect("index.jsp?error");
    }
%>