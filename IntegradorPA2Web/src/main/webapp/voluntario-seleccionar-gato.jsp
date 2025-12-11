<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.integradorpa2.logica.Gato" %>

<h1>Seleccionar Gato</h1>

<form action="VoluntarioTareasServlet" method="get">
    <input type="hidden" name="action" value="nueva">
    <select name="gatoId">
        <%
            List<Gato> gatos = (List<Gato>) request.getAttribute("gatos");
            for (Gato g : gatos) {
        %>
            <option value="<%= g.getId() %>"><%= g.getNombre() %></option>
        <%
            }
        %>
    </select>

    <button type="submit">Continuar</button>
</form>

<a href="VoluntarioTareasServlet?action=menu">Volver</a>
