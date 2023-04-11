<%-- 
    Document   : listitems
    Created on : Mar 16, 2023, 8:08:58 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List of all Products</title>
    </head>
    <body>
        <h1>List of Products</h1>
        <h4><a href="additems.jsp">Add new</a></h4>
        <table border="1">
            <tr>
                <th>Item ID</th>
                <th>Name</th>
                <th>Description</th>
                <th>Price</th>
                <th>Stock</th>
                <th>Category</th>
                <th>Image</th>
                <th>Action</th>
            </tr>
            <c:forEach items="${requestScope.data}" var="o">
                <tr>
                    <td>${o.item_id}</td>
                    <td>${o.item_name}</td>
                    <td>${o.description}</td>
                    <td>${o.price}</td>
                    <td>${o.stock}</td>
                    <td>${o.category.category_id}</td>
                    <td>${o.image}</td>
                    <td>
                        <a href="updateitem?item_id=${o.item_id}">Update</a>&nbsp;&nbsp;&nbsp;
                        <a href="deleteitem?item_id=${o.item_id}">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <h4><a href="home"><- Back home</a></h4>
    </body>
</html>
