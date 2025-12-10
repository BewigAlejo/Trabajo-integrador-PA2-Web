<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.integradorpa2.logica.Gato" %>
<% if (request.getAttribute("msg") != null) { %>
    <p style="color: green"><%= request.getAttribute("msg") %></p>
<% } %>

<% if (request.getAttribute("error") != null) { %>
    <p style="color: red"><%= request.getAttribute("error") %></p>
<% } %>

<h2>Gatos disponibles para adopción</h2>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Raza</th>
        <th>Edad</th>
        <th>Estado</th>
        <th>Zona</th>
        <th>Acción</th>
    </tr>

    <%
        List<Gato> lista = (List<Gato>) request.getAttribute("listaGatos");
        for (Gato g : lista) {
    %>

    <tr>
        <td><%= g.getId() %></td>
        <td><%= g.getNombre() %></td>
        <td><%= g.getRaza() %></td>
        <td><%= g.getEdad() %></td>
        <td><%= g.getEstadoDeSalud() %></td>
        <td><%= (g.getZona() != null ? g.getZona().getNombreZona() : "") %></td>
        <td>
           <a href="postular?id=<%= g.getId() %>">Postularse</a>
        </td>

    </tr>

    <% } %>

</table>
