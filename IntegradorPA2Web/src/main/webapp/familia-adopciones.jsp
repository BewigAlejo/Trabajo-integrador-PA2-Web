<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.integradorpa2.logica.Adopcion" %>

<h2>Tus adopciones</h2>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Gato</th>
        <th>Tipo</th>
        <th>Fecha</th>
        <th>Estado</th>
        <th>Observación</th>
    </tr>

    <%
        List<Adopcion> lista = (List<Adopcion>) request.getAttribute("listaAdopciones");
        for (Adopcion a : lista) {
    %>

    <tr>
        <td><%= a.getId() %></td>
        <td><%= a.getGato().getNombre() %></td>
        <td><%= a.getTipoAdopcion() %></td>
        <td><%= a.getFechaAdopcion() %></td>
        <td><%= a.getEstado() %></td>
        <td><%= a.getObservacion() %></td>
    </tr>

    <% } %>

</table>
