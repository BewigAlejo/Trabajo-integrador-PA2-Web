<%@page import="java.util.List"%>
<%@page import="com.mycompany.integradorpa2.logica.Gato"%>

<h1>Seleccionar Gato</h1>

<form action="VoluntarioTareasServlet" method="get">
    <input type="hidden" name="action" value="crearTarea">

    <select name="gatoId">
<%
    com.mycompany.integradorpa2.dao.GatoDAO dao = new com.mycompany.integradorpa2.dao.GatoDAOJpa();
    for (Gato g : dao.listarTodos()) {
%>
        <option value="<%=g.getId()%>"><%=g.getNombre()%></option>
<% } %>
    </select>

    <button type="submit">Continuar</button>
</form>

<a href="panel-voluntario.jsp">Volver</a>
