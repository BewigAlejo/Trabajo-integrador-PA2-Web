<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.*, com.mycompany.integradorpa2.logica.*"%>

<html>
<head>
    <title>Adopciones en proceso</title>
</head>
<body>

<h1>Adopciones en proceso</h1>

<a href="panel-familia.jsp">Volver al panel</a>
<br><br>

<table border="1" cellpadding="6">
    <tr>
        <th>ID Adopción</th>
        <th>Gato</th>
        <th>Tipo</th>
        <th>Fecha</th>
        <th>Estado</th>
        <th>Observación</th>
    </tr>

    <%
        List<Adopcion> lista = (List<Adopcion>) request.getAttribute("adopciones");
        java.text.SimpleDateFormat fmt = new java.text.SimpleDateFormat("dd/MM/yyyy");

        if (lista != null) {
            for (Adopcion a : lista) {
                Gato g = a.getGato();
                String gato = (g != null) ? g.getNombre() + " (ID " + g.getId() + ")" : "-";

                String tipo = (a.getTipoAdopcion() != null ? a.getTipoAdopcion().name() : "");
                String fecha = (a.getFechaAdopcion() != null ? fmt.format(a.getFechaAdopcion()) : "");
                String estado = (a.getEstado() != null ? a.getEstado().name() : "");
                String obs = (a.getObservacion() != null ? a.getObservacion() : "");
    %>

    <tr>
        <td><%= a.getId() %></td>
        <td><%= gato %></td>
        <td><%= tipo %></td>
        <td><%= fecha %></td>
        <td><%= estado %></td>
        <td><%= obs %></td>
    </tr>

    <%
            }
        }
    %>

</table>

</body>
</html>
