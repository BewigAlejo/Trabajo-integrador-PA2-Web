<%@ page import="java.util.*, com.mycompany.integradorpa2.logica.*" %>

<h1>Reporte de Gatos Esterilizados</h1>

<table border="1">
<tr>
    <th>ID</th><th>Nombre</th><th>Raza</th><th>Zona</th>
</tr>

<%
List<Gato> lista = (List<Gato>) request.getAttribute("gatos");
int total = lista.size();

for (Gato g : lista) {
%>
<tr>
    <td><%= g.getId() %></td>
    <td><%= g.getNombre() %></td>
    <td><%= g.getRaza() %></td>
    <td><%= g.getZona() != null ? g.getZona().getNombreZona() : "-" %></td>
</tr>
<% } %>
</table>

<br>

<form method="GET" action="ReportesServlet">
    <input type="hidden" name="action" value="esterilizados">
    <button name="reporte" value="1">Generar reporte</button>
</form>

<%
if (request.getParameter("reporte") != null) {
%>
<h3>Resultado:</h3>
<p>Hay <%= total %> gatos esterilizados en total.</p>
<% } %>

<br>
<a href="panel-reportes.jsp">Volver</a>
