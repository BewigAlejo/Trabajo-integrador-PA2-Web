<%@ page import="com.mycompany.integradorpa2.logica.Gato" %>

<%
    Gato g = (Gato) request.getAttribute("gato");
%>

<h2>Generar Tratamiento</h2>

<p>Gato seleccionado: <b><%= g.getNombre() %></b></p>

<form action="VeterinarioGenerarEntradaServlet" method="post">
    <input type="hidden" name="gatoId" value="<%= g.getId() %>">

    Diagnóstico:<br>
    <textarea name="diagnostico" required></textarea><br><br>

    Tratamiento:<br>
    <textarea name="tratamiento" required></textarea><br><br>

    <button type="submit">Guardar</button>
</form>

<br>
<a href="VeterinarioConsultaServlet">Volver</a>
