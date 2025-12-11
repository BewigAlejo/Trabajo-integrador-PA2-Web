<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.integradorpa2.logica.Gato" %>

<h2>Seleccionar gato para consulta médica</h2>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Acción</th>
    </tr>

<%
    List<Gato> lista = (List<Gato>) request.getAttribute("gatos");
    for (Gato g : lista) {
%>
    <tr>
        <td><%= g.getId() %></td>
        <td><%= g.getNombre() %></td>
        <td>
            <a href="VeterinarioGenerarEntradaServlet?idGato=<%= g.getId() %>">Generar consulta</a>
        </td>
    </tr>
<% } %>
</table>

<br>
<a href="panel-veterinario.jsp">Volver</a>
