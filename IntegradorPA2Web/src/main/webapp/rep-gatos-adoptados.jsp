<%@ page import="java.util.*, com.mycompany.integradorpa2.logica.*" %>

<h1>Reporte de Gatos Adoptados</h1>

<table border="1">
<tr>
    <th>ID Gato</th><th>Nombre</th><th>Tipo adopción</th><th>Familia</th><th>Fecha</th>
</tr>

<%
List<Adopcion> lista = (List<Adopcion>) request.getAttribute("adoptados");
int total = lista.size();

for (Adopcion a : lista) {
%>
<tr>
    <td><%= a.getGato().getId() %></td>
    <td><%= a.getGato().getNombre() %></td>
    <td><%= a.getTipoAdopcion() %></td>
    <td><%= a.getFamilia().getNombre() %></td>
    <td><%= a.getFechaAdopcion() %></td>
</tr>
<% } %>
</table>

<br>

<form method="GET" action="ReportesServlet">
    <input type="hidden" name="action" value="adoptados">
    <button name="reporte" value="1">Generar reporte</button>
</form>

<%
if (request.getParameter("reporte") != null) {
%>
<h3>Resultado:</h3>
<p>Hay <%= total %> gatos con adopción aprobada.</p>
<% } %>

<br>
<a href="panel-reportes.jsp">Volver</a>
