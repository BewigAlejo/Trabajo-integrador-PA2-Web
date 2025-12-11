<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.integradorpa2.logica.Gato" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Seleccionar Gato</title>

    <link href="css/styles.css" rel="stylesheet">
</head>

<body class="sb-nav-fixed">

<jsp:include page="partials/navbar-veterinario.jsp"/>
<div id="layoutSidenav">
<jsp:include page="partials/sidebar-veterinario.jsp"/>

<div id="layoutSidenav_content">
<main class="container-fluid px-4">

    <h1 class="mt-4">Consulta Médica</h1>
    <ol class="breadcrumb mb-4"><li class="breadcrumb-item active">Seleccionar gato</li></ol>

    <div class="card shadow-sm">
        <div class="card-header bg-primary text-white">
            <i class="fas fa-cat"></i> Gatos disponibles
        </div>

        <div class="card-body">

            <table class="table table-bordered table-striped">
                <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Acción</th>
                </tr>
                </thead>

                <tbody>
                <%
                    List<Gato> lista = (List<Gato>) request.getAttribute("gatos");
                    for (Gato g : lista) {
                %>
                <tr>
                    <td><%= g.getId() %></td>
                    <td><%= g.getNombre() %></td>
                    <td>
                        <a href="VeterinarioGenerarEntradaServlet?idGato=<%= g.getId() %>" class="btn btn-sm btn-primary">
                            Seleccionar
                        </a>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>

        </div>
    </div>

    <a href="panel-veterinario.jsp" class="btn btn-secondary mt-3">Volver</a>

</main>

<footer class="py-4 bg-light mt-auto text-center">Colonia de Gatos © 2025</footer>
</div>

</div>

</body>
</html>
