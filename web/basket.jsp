<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="by.tms.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
    <title>Basket</title>
    <script>
        function removeFromBasket (elemenId) {
            var date = new Date(0);
            document.cookie = "produce_" + elemenId + "=; path=/; expires=" + date.toUTCString();
            window.location.replace("/basketmain");
        }
    </script>
</head>
<body>
Basket
<br>
<a href="/shopmain">Return to shop</a>
<br><hr>
<% List products = (ArrayList)request.getServletContext().getAttribute("products");%>
<table>
    <%
        for(int i=0; i<products.size();i++){ if(!((Product)products.get(i)).getAtBasket()) continue; %>
    <tr>
        <td><b><%= ((Product)products.get(i)).getType() %></b></td>
        <td><input type="button" id="<%= i %>" onclick="removeFromBasket('<%= i %>')" value="-" /></td>
    </tr>
    <tr>
        <td><%= ((Product)products.get(i)).getProductName() %><b> Price: </b><%= ((Product)products.get(i)).getPrice() %></td>
    </tr>
    <tr>
        <td><%= ((Product)products.get(i)).getOverview() %></td>
    </tr>
    <tr>
        <td><hr></td>
    </tr>
    <%}%>
</table>
</body>
</html>
