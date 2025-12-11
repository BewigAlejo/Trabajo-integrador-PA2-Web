<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mycompany.integradorpa2.logica.Voluntario" %>

<%
    Voluntario vol = (Voluntario) session.getAttribute("usuarioLogueado");

    if (vol == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Panel Voluntario</title>
</head>

<body>
<h1>Panel del Voluntario</h1>
<p>Bienvenido, <%= vol.getNombre() %></p>

<ul>
    <li><a href="VoluntarioRegistrarGatoServlet">Registrar gato</a></li>
    <li><a href="VoluntarioTareasServlet?action=menu">Gestionar tareas</a></li>
    <li><a href="VoluntarioAsignarGatoServlet">Asignar gatos</a></li>
    <li><a href="panel-reportes.jsp">Reportes</a></li>
    <li><a href="LogoutServlet">Salir</a></li>
</ul>

</body>
</html>
