<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.integradorpa2.logica.EntradaHistorial" %>

<h2>Historial médico del gato</h2>

<table border="1">
<tr>
    <th>Fecha</th>
    <th>Diagnóstico</th>
    <th>Tratamiento</th>
    <th>Veterinario</th>
</tr>

<%
    List<EntradaHistorial> lista = (List<EntradaHistorial>) request.getAttribute("listaEntradas");
    for (EntradaHistorial e : lista) {
%>
<tr>
    <td><%= e.getFecha() %></td>
    <td><%= e.getDiagnostico() %></td>
    <td><%= e.getTratamiento() %></td>
    <td><%= e.getVeterinario().getNombre() %></td>
</tr>
<% } %>
</table>

<br>
<a href="VeterinarioHistorialServlet">Volver</a>
