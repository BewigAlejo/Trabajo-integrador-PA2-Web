<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, com.mycompany.integradorpa2.logica.Veterinario" %>

<%
    List<Veterinario> vets = (List<Veterinario>) request.getAttribute("veterinarios");
    if (vets == null) vets = new ArrayList<>();
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Veterinarios Activos</title>
    <link href="css/styles.css" rel="stylesheet" />
</head>

<body class="sb-nav-fixed">

<jsp:include page="partials/navbar-veterinario.jsp" />

<div id="layoutSidenav">

    <jsp:include page="partials/sidebar-veterinario.jsp" />

    <div id="layoutSidenav_content">

        <main class="container-fluid px-4">

            <h1 class="mt-4">Veterinarios Activos</h1>

            <div class="card shadow-sm mt-3">
                <div class="card-header bg-danger text-white">
                    Profesionales Disponibles
                </div>

                <div class="card-body">

                    <table class="table table-bordered table-striped">
                        <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Especialidad</th>
                            <th>Matrícula</th>
                        </tr>
                        </thead>

                        <tbody>
                        <% for (Veterinario v : vets) { %>
                        <tr>
                            <td><%= v.getId() %></td>
                            <td><%= v.getNombre() %></td>
                            <td><%= v.getEspecialidad() %></td>
                            <td><%= v.getMatricula() %></td>
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
