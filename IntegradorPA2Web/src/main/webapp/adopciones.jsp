<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, com.mycompany.integradorpa2.logica.*" %>

<%
    List<Adopcion> lista = (List<Adopcion>) request.getAttribute("adoptados");
    if (lista == null) lista = new ArrayList<>();
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Adopciones</title>
    <link href="css/styles.css" rel="stylesheet" />
</head>

<body class="sb-nav-fixed">

<jsp:include page="partials/navbar-veterinario.jsp"/>

<div id="layoutSidenav">
    <jsp:include page="partials/sidebar-veterinario.jsp"/>

    <div id="layoutSidenav_content">
        <main class="container-fluid px-4">

            <h1 class="mt-4">Adopciones</h1>

            <div class="card shadow-sm mt-3">
                <div class="card-header bg-success text-white">Gatos Adoptados</div>

                <div class="card-body">
                    <table class="table table-bordered table-striped">
                        <thead class="table-dark">
                        <tr>
                            <th>ID Gato</th>
                            <th>Nombre</th>
                            <th>Familia</th>
                            <th>Tipo</th>
                            <th>Fecha</th>
                        </tr>
                        </thead>

                        <tbody>
                        <% for (Adopcion a : lista) { %>
                        <tr>
                            <td><%= a.getGato().getId() %></td>
                            <td><%= a.getGato().getNombre() %></td>
                            <td><%= a.getFamilia().getNombre() %></td>
                            <td><%= a.getTipoAdopcion() %></td>
                            <td><%= a.getFechaAdopcion() %></td>
                        </tr>
                        <% } %>
                        </tbody>
                    </table>
                </div>
            </div>

        </main>
    </div>
</div>

</body>
</html>
