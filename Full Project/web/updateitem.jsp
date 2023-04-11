<%-- 
    Document   : updateitem
    Created on : Mar 21, 2023, 2:38:37 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:set var="i" value="${requestScope.item}"/>
        <h1>Update item</h1>
        <form action="updateitem" method="post">
            <table>
                <tr>
                    <td>item_id:</td>
                    <td><input type="text" name="item_id" value="${i.item_id}"></td>
                </tr>
                <tr>
                    <td>item_name:</td>
                    <td><input type="text" name="item_name" value="${i.item_name}"></td>
                </tr>
                <tr>
                    <td>description:</td>
                    <td><input type="text" name="description" value="${i.description}"></td>
                </tr>
                <tr>
                    <td>price:</td>
                    <td><input type="number" name="price" value="${i.price}"></td>
                </tr>
                <tr>
                    <td>stock:</td>
                    <td><input type="number" name="stock" value="${i.stock}"></td>
                </tr>
                <tr>
                    <td>category_id:</td>
                    <td><input type="number" name="category_id" value="${i.category.category_id}"></td>
                </tr>
                <tr>
                    <td>image:</td>
                    <td><input type="text" name="image" value="${i.image}"></td>
                </tr>
            </table>
                <input type="hidden" name="item_id_origin" value="${i.item_id}">
                <input type="submit" value="UPDATE">
        </form>
    </body>
</html>
