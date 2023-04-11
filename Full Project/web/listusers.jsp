<%-- 
    Document   : listusers
    Created on : Mar 16, 2023, 2:57:10 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Users</title>
    </head>
    <body>
        <h1>List Users</h1>
        <h3><a href="addaccount.jsp">Add new</a></h3>
        <table border="1">
            <tr>
                <th>user_id</th>
                <th>username</th>
                <th>password</th>
                <th>email</th>
                <th>address</th>
                <th>phone num</th>
                <th>isSell</th>
                <th>isAdmin</th>
                <th>Action</th>
            </tr>
            <c:forEach items="${requestScope.data}" var="u">
                <tr>
                    <td>${u.user_id}</td>
                    <td>${u.username}</td>
                    <td>${u.password}</td>
                    <td>${u.email}</td>
                    <td>${u.address}</td>
                    <td>${u.phone_number}</td>
                    <td>${u.isSell}</td>
                    <td>${u.isAdmin}</td>
                    <td>
                        <a href="update?id=${u.user_id}">Update</a> &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="deleteaccount?id=${u.user_id}">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <h4><a href="home"><- Back to home</a></h4>
    </body>
</html>
