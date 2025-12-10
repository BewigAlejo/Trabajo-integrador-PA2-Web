<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registro de Familia</title>
</head>
<body>
<h1>Registro de Familia</h1>

<% 
    String error = (String) request.getAttribute("error");
    if (error != null) {
%>
    <p style="color:red;"><%= error %></p>
<%
    }
%>

<form action="RegistroFamiliaServlet" method="post">

    Dirección:  
    <input type="text" name="direccion" required><br><br>

    Coordenadas:  
    <input type="text" name="coordenadas" required><br><br>

    <button type="submit">Registrarse</button>
</form>

<br>
<a href="login.jsp">Volver al login</a>

</body>
</html>
