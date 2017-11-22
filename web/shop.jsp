<%@ page import="java.util.*" %>
<%@ page import="by.tms.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
    <title>Shop main page</title>
    <script>
        function addToBasket (obj,elemenId) {
            if(obj.value=='+') {
                obj.value='-';
                document.cookie = "produce_" + elemenId + "=inBasket";
            }
            else {
                obj.value='+';
                var date = new Date(0);
                document.cookie = "produce_" + elemenId + "=; path=/; expires=" + date.toUTCString();
            }
        }
    </script>
</head>
<body>
<div>Welcome to the online shop!</div>
<br>
<a id="href" href="/basketmain">Basket</a>
<br>
<hr>
<% List products = (ArrayList)request.getServletContext().getAttribute("products");%>
<table>
    <%
    for(int i=0; i<products.size();i++){%>
        <tr>
            <td><b><%= ((Product)products.get(i)).getType() %></b></td>
            <% if(((Product)products.get(i)).getAtBasket()) { %>
                <td><input type="button" id="<%= i %>" onclick="addToBasket(this,'<%= i %>')" value="-" /></td>
            <%
            }
            else {
            %>
            <td><input type="button" id="<%= i %>" onclick="addToBasket(this,'<%= i %>')" value="+" /></td>
            <% } %>
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
