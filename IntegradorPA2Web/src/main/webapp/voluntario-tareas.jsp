<%@page import="java.util.List"%>
<%@page import="com.mycompany.integradorpa2.logica.Tarea"%>

<h1>Gestionar Tareas</h1>

<ul>
    <li><a href="voluntario-seleccionar-gato.jsp">Crear nueva tarea</a></li>
</ul>

<h2>Tareas asignadas</h2>

<table border="1">
<tr>
    <th>ID</th><th>Fecha</th><th>Tipo</th><th>Estado</th><th>Gato</th>
</tr>

<%
    List<Tarea> lista = (List<Tarea>) request.getAttribute("tareas");
    if (lista != null) {
        for (Tarea t : lista) {
%>
<tr>
    <td><%=t.getId()%></td>
    <td><%=t.getFecha()%></td>
    <td><%=t.getTipoTarea()%></td>
    <td><%=t.getEstadoTarea()%></td>
    <td><%= t.getGato()!=null ? t.getGato().getNombre() : "" %></td>
</tr>
<%      }
    }
%>

</table>

<a href="panel-voluntario.jsp">Volver</a>
