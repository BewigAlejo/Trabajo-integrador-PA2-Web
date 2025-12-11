<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.integradorpa2.logica.Tarea" %>

<h1>Gestionar Tareas</h1>

<a href="VoluntarioTareasServlet?action=seleccionarGato">Crear nueva tarea</a>

<h2>Tareas asignadas / pendientes</h2>

<table border="1">
<tr>
    <th>ID</th>
    <th>Fecha</th>
    <th>Tipo</th>
    <th>Estado</th>
    <th>Gato</th>
    <th>Acción</th>
</tr>

<%
List<Tarea> tareas = (List<Tarea>) request.getAttribute("tareas");

if (tareas != null) {
    for (Tarea t : tareas) {
%>
<tr>
    <td><%= t.getId() %></td>
    <td><%= t.getFecha() %></td>
    <td><%= t.getTipoTarea() %></td>
    <td><%= t.getEstadoTarea() %></td>
    <td><%= t.getGato() != null ? t.getGato().getNombre() : "-" %></td>
    <td>
        <a href="VoluntarioEditarTareaServlet?id=<%= t.getId() %>">
            Tomar / Editar
        </a>
    </td>

</tr>
<%
    }
}
%>

</table>
