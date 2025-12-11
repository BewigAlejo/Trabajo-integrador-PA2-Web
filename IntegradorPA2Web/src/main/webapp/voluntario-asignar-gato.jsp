<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List, java.util.Map" %>
<%@ page import="com.mycompany.integradorpa2.logica.Voluntario" %>
<%@ page import="com.mycompany.integradorpa2.logica.Gato" %>

<%
    Voluntario vol = (Voluntario) session.getAttribute("usuarioLogueado");
    if (vol == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Gato> gatos = (List<Gato>) request.getAttribute("gatos");
    Map<Long, Long> solicitudes = (Map<Long, Long>) request.getAttribute("solicitudesPorGato");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Asignar Gato</title>
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
</head>

<body class="sb-nav-fixed">

<jsp:include page="partials/navbar-voluntario.jsp" />

<div id="layoutSidenav">
    <jsp:include page="partials/sidebar-voluntario.jsp" />

    <div id="layoutSidenav_content">
        <main class="container-fluid px-4">

            <h1 class="mt-4">Asignar Gato a Familias</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item active">Lista de gatos y solicitudes</li>
            </ol>

            <div class="card shadow-sm">
                <div class="card-header">
                    <i class="fas fa-cat me-1"></i> Gatos con postulaciones
                </div>

                <div class="card-body">

                    <table class="table table-bordered table-striped">
                        <thead class="table-dark">
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Zona</th>
                                <th>Solicitudes</th>
                                <th>Acción</th>
                            </tr>
                        </thead>

                        <tbody>
                        <% for (Gato g : gatos) { %>
                            <tr>
                                <td><%= g.getId() %></td>
                                <td><%= g.getNombre() %></td>
                                <td><%= g.getZona() != null ? g.getZona().getNombreZona() : "-" %></td>
                                <td><%= solicitudes.get(g.getId()) %></td>
                                <td>
                                    <a class="btn btn-primary btn-sm"
                                       href="VoluntarioAsignarGatoServlet?idGato=<%= g.getId() %>">
                                        Ver familias
                                    </a>
                                </td>
                            </tr>
                        <% } %>
                        </tbody>
                    </table>

                </div>
            </div>

        </main>

        <footer class="py-4 bg-light mt-auto text-center">
            Colonia de Gatos © 2025
        </footer>
    </div>

</div>

</body>
</html>
