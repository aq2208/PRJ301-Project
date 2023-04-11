<%-- 
    Document   : additems
    Created on : Mar 16, 2023, 8:16:39 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dal.DAO" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Products</title>
    </head>
    <body>
        <a href="listitems"><= Back</a>
        <h1>Add new item</h1>
        <form action="additems" method="post">
            <table>
                <tr>
                    <td>Item ID:</td>
                    <td><input type="text" name="item_id"></td>
                </tr>
                <tr>
                    <td>Item Name:</td>
                    <td><input type="text" name="item_name"></td>
                </tr>
                <tr>
                    <td>Description:</td>
                    <td><input type="text" name="description"></td>
                </tr>
                <tr>
                    <td>Price:</td>
                    <td><input type="number" name="price"></td>
                </tr>
                <tr>
                    <td>Stock:</td>
                    <td><input type="number" name="stock"></td>
                </tr>
                <tr>
                    <jsp:useBean id="dao" class="dal.DAO"/>
                    <td>Category:</td>
                    <td>
                        <select name="category">
                            <c:forEach items="${dao.listCategories}" var="i">
                                <option value="${i.category_id}">${i.category_name}</option>
                            </c:forEach>     
                        </select>
                    </td>                   
                </tr>
                <tr>
                    <td>Image:</td>
                    <td><input type="text" name="image"></td>
                </tr>
            </table>
            <input type="submit" value="ADD">
        </form>
        <span>${requestScope.error}</span>
    </body>
</html>
