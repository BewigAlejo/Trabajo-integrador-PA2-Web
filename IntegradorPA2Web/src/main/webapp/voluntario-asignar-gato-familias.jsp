<%@page import="com.mycompany.integradorpa2.logica.Familia"%>
<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.integradorpa2.logica.Adopcion" %>

<h2>Familias postuladas</h2>

<%
    List<Adopcion> lista = (List<Adopcion>) request.getAttribute("familias");
    Long gatoId = (Long) request.getAttribute("gatoId");
%>

<table border="1">
    <tr>
        <th>ID Adopción</th>
        <th>Familia</th>
        <th>Reputación</th>
        <th>Tipo adopción</th>
        <th>Acción</th>
    </tr>

<% for (Adopcion a : lista) { 
       Familia f = a.getFamilia();
%>
    <tr>
        <td><%= a.getId() %></td>
        <td><%= f.getNombre() %></td>
        <td><%= f.getReputacion() %></td>
        <td><%= a.getTipoAdopcion() %></td>

        <td>
            <form action="VoluntarioAsignarGatoServlet" method="post">
                <input type="hidden" name="adopcionId" value="<%= a.getId() %>">
                <input type="hidden" name="gatoId" value="<%= gatoId %>">
                <button type="submit">Aprobar</button>
            </form>
        </td>
    </tr>
<% } %>
</table>


<br>
<a href="AsignarGatoServlet">Volver a lista de gatos</a>
