<%@ page import="com.mycompany.integradorpa2.logica.Veterinario" %>
<%
    Veterinario vet = (Veterinario) session.getAttribute("usuarioLogueado");
    if (vet == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Panel Veterinario</title>
</head>
<body>

<h1>Bienvenido, <%= vet.getNombre() %></h1>

<ul>
    <li><a href="VeterinarioConsultaServlet">Generar consulta médica</a></li>
    <li><a href="VeterinarioHistorialServlet">Consultar historial médico</a></li>
</ul>

<a href="login.jsp">Salir</a>

</body>
</html>
