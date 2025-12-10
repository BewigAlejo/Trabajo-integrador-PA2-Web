<%@page import="java.util.List"%>
<%@page import="com.mycompany.integradorpa2.logica.Zona"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registrar Gato</title>
</head>
<body>

<h1>Registrar gato</h1>

<% if (request.getAttribute("msg") != null) { %>
    <p style="color:green;"><%= request.getAttribute("msg") %></p>
<% } %>

<% if (request.getAttribute("error") != null) { %>
    <p style="color:red;"><%= request.getAttribute("error") %></p>
<% } %>

<form action="VoluntarioRegistrarGatoServlet" method="post">

Nombre: <input type="text" name="nombre"><br><br>
Raza: <input type="text" name="raza"><br><br>
Edad: <input type="number" name="edad"><br><br>

Estado de salud:
<select name="salud">
    <option value="SANO">SANO</option>
    <option value="ENFERMO">ENFERMO</option>
</select><br><br>

Adoptado:
<select name="adoptado">
    <option value="false">No</option>
    <option value="true">Sí</option>
</select><br><br>

Zona:
<select name="zona">
<%
    List<Zona> zonas = (List<Zona>) request.getAttribute("zonas");
    for (Zona z : zonas) {
%>
<option value="<%=z.getId()%>"><%=z.getNombreZona()%></option>
<% } %>
</select>

<br><br>
<button type="submit">Registrar</button>
</form>

<br><a href="panel-voluntario.jsp">Volver</a>

</body>
</html>
