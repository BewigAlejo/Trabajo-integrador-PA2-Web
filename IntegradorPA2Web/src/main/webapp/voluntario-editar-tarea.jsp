<%@ page import="com.mycompany.integradorpa2.logica.Tarea" %>
<%@ page import="com.mycompany.integradorpa2.logica.enums.EstadoTarea" %>

<%
    Tarea t = (Tarea) request.getAttribute("tarea");
    EstadoTarea[] estados = (EstadoTarea[]) request.getAttribute("estados");
%>

<h2>Actualizar Tarea</h2>

<table border="1">
    <tr><th>ID</th><td><%= t.getId() %></td></tr>
    <tr><th>Fecha</th><td><%= t.getFecha() %></td></tr>
    <tr><th>Tipo</th><td><%= t.getTipoTarea().name() %></td></tr>
    <tr><th>Estado actual</th><td><%= t.getEstadoTarea().name() %></td></tr>
    <tr><th>Gato</th><td><%= t.getGato() != null ? t.getGato().getNombre() : "-" %></td></tr>
</table>

<br>

<h3>Descripción + Observaciones previas</h3>
<textarea rows="6" cols="60" readonly>
<%= t.getDescripcion() != null ? t.getDescripcion() : "" %>

<%= t.getObservacion() != null ? ("\nObservaciones previas:\n" + t.getObservacion()) : "" %>
</textarea>

<br><br>

<form action="VoluntarioEditarTareaServlet" method="post">
    <input type="hidden" name="id" value="<%= t.getId() %>">

    <label>Agregar observación:</label><br>
    <textarea name="observacion" rows="4" cols="60"></textarea>

    <br><br>

    <label>Nuevo estado:</label>
    <select name="estado">
        <% for (EstadoTarea et : estados) { %>
            <option value="<%= et.name() %>"
                <%= et == t.getEstadoTarea() ? "selected" : "" %>>
                <%= et.name() %>
            </option>
        <% } %>
    </select>

    <br><br>

    <button type="submit">Guardar cambios</button>
</form>

<br>
<a href="VoluntarioTareasServlet?action=menu">Volver</a>
