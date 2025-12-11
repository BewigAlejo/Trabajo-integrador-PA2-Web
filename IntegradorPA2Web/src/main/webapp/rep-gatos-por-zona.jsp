<%@ page import="java.util.*, com.mycompany.integradorpa2.logica.*" %>

<h1>Reporte de Gatos por Zona</h1>

<form method="GET" action="ReportesServlet">
    <input type="hidden" name="action" value="porZona">

    Seleccione zona:
    <select name="zonaId">
        <option value="0">Todas</option>
        <% 
            List<Zona> zonas = (List<Zona>) request.getAttribute("zonas");
            for (Zona z : zonas) { %>
                <option value="<%= z.getId() %>"><%= z.getNombreZona() %></option>
        <% } %>
    </select>

    <button type="submit">Filtrar</button>
</form>

<br>

<table border="1">
<tr>
    <th>ID</th><th>Nombre</th><th>Raza</th><th>Edad</th><th>Estado</th><th>Zona</th>
</tr>

<%
List<Gato> lista = (List<Gato>) request.getAttribute("gatos");
long total = 0;


String zonaParam = request.getParameter("zonaId");

Long zonaFiltrar = null;
if (zonaParam != null 
        && !zonaParam.equals("0") 
        && !zonaParam.equals("") 
        && !zonaParam.equalsIgnoreCase("null")) {

    try {
        zonaFiltrar = Long.parseLong(zonaParam);
    } catch (Exception e) {
        zonaFiltrar = null;
    }
}


for (Gato g : lista) {
    if (zonaFiltrar == null || 
        (g.getZona() != null && Objects.equals(g.getZona().getId(), zonaFiltrar))) {

        total++;
%>
<tr>
    <td><%= g.getId() %></td>
    <td><%= g.getNombre() %></td>
    <td><%= g.getRaza() %></td>
    <td><%= g.getEdad() %></td>
    <td><%= g.getEstadoDeSalud() %></td>
    <td><%= g.getZona() != null ? g.getZona().getNombreZona() : "-" %></td>
</tr>
<% }} %>
</table>

<br>

<form method="GET" action="ReportesServlet">
    <input type="hidden" name="action" value="porZona">
    <input type="hidden" name="zonaId" value="<%= zonaParam %>">

    <button type="submit" name="reporte" value="1">Generar reporte</button>
</form>

<%
if (request.getParameter("reporte") != null) {
%>
    <h3>Resultado:</h3>
    <p>Hay <%= total %> gatos en la zona seleccionada.</p>
<% } %>

<br>
<a href="panel-reportes.jsp">Volver</a>
