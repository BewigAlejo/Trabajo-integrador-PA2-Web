<%@ page import="com.mycompany.integradorpa2.logica.enums.TipoTarea" %>

<h1>Registrar Tarea</h1>

<form action="VoluntarioTareasServlet" method="post">

    <input type="hidden" name="action" value="guardarTarea">
    <input type="hidden" name="gatoId" value="<%= request.getParameter("gatoId") %>">

    <label>Tipo de tarea:</label>
    <select name="tipo">
        <%
            for (TipoTarea t : TipoTarea.values()) {
        %>
            <option value="<%= t.name() %>"><%= t.name() %></option>
        <%
            }
        %>
    </select>
    <br><br>

    <label>Descripción:</label><br>
    <textarea name="descripcion" rows="4" cols="40"></textarea>

    <br><br>
    <button type="submit">Guardar</button>
</form>

<a href="VoluntarioTareasServlet?action=menu">Cancelar</a>
