<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, com.mycompany.integradorpa2.logica.Gato" %>

<%
    List<Gato> gatos = (List<Gato>) request.getAttribute("gatos");
    if (gatos == null) gatos = new ArrayList<>();
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gatos Registrados</title>
    <link href="css/styles.css" rel="stylesheet" />
</head>
<body class="sb-nav-fixed">

<jsp:include page="partials/navbar-veterinario.jsp" />
<div id="layoutSidenav">
<jsp:include page="partials/sidebar-veterinario.jsp" />

<div id="layoutSidenav_content">
<main class="container-fluid px-4">

    <h1 class="mt-4">Gatos Registrados</h1>

    <div class="card shadow-sm mt-3">
        <div class="card-header bg-primary text-white">
            Lista de Gatos del Sistema
        </div>

        <div class="card-body">
            <table class="table table-bordered table-striped">
                <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Raza</th>
                    <th>Edad</th>
                    <th>Estado</th>
                </tr>
                </thead>

                <tbody>
                <% for (Gato g : gatos) { %>
                    <tr>
                        <td><%= g.getId() %></td>
                        <td><%= g.getNombre() %></td>
                        <td><%= g.getRaza() %></td>
                        <td><%= g.getEdad() %></td>
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
