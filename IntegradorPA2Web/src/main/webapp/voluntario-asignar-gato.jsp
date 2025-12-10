<%@page import="java.util.Map"%>
<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.integradorpa2.logica.Gato" %>

<h2>Asignar Gato a Familia</h2>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Zona</th>
        <th>Cant. solicitudes</th>
        <th>Acción</th>
    </tr>

<%
    List<Gato> gatos = (List<Gato>) request.getAttribute("gatos");
    Map<Long, Long> solicitudes = (Map<Long, Long>) request.getAttribute("solicitudesPorGato");

    for (Gato g : gatos) {
%>
    <tr>
        <td><%= g.getId() %></td>
        <td><%= g.getNombre() %></td>
        <td><%= g.getZona() != null ? g.getZona().getNombreZona() : "-" %></td>
        <td><%= solicitudes.get(g.getId()) %></td>

        <td>
            <a href="VoluntarioAsignarGatoServlet?idGato=<%= g.getId() %>">Ver familias interesadas</a>
        </td>
    </tr>
<% } %>
</table>

<br>
<a href="panel-voluntario.jsp">Volver</a>
