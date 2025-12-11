<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, com.mycompany.integradorpa2.logica.*" %>

<%
    Voluntario vol = (Voluntario) session.getAttribute("usuarioLogueado");
    if (vol == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Adopcion> lista = (List<Adopcion>) request.getAttribute("adoptados");
    int total = lista.size();
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Reporte: Gatos Adoptados</title>
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
</head>

<body class="sb-nav-fixed">

<jsp:include page="partials/navbar-voluntario.jsp" />

<div id="layoutSidenav">

    <jsp:include page="partials/sidebar-voluntario.jsp" />

    <div id="layoutSidenav_content">

        <main class="container-fluid px-4">

            <h1 class="mt-4">Gatos Adoptados</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item">Reportes</li>
                <li class="breadcrumb-item active">Adoptados</li>
            </ol>

            <div class="card shadow-sm">
                <div class="card-header bg-success text-white">
                    <i class="fas fa-heart"></i> Lista de adopciones aprobadas
                </div>

                <div class="card-body">

                    <table class="table table-bordered table-striped">
                        <thead class="table-dark">
                        <tr>
                            <th>ID Gato</th>
                            <th>Nombre</th>
                            <th>Tipo Adopción</th>
                            <th>Familia</th>
                            <th>Fecha</th>
                        </tr>
                        </thead>

                        <tbody>
                        <% for (Adopcion a : lista) { %>
                            <tr>
                                <td><%= a.getGato().getId() %></td>
                                <td><%= a.getGato().getNombre() %></td>
                                <td><%= a.getTipoAdopcion() %></td>
                                <td><%= a.getFamilia().getNombre() %></td>
                                <td><%= a.getFechaAdopcion() %></td>
                            </tr>
                        <% } %>
                        </tbody>
                    </table>

                </div>
            </div>

            <!-- REPORTE -->
            <form method="GET" action="ReportesServlet" class="mt-3">
                <input type="hidden" name="action" value="adoptados">
                <button name="reporte" value="1" class="btn btn-success">Generar reporte</button>
            </form>

            <% if (request.getParameter("reporte") != null) { %>
                <div class="alert alert-info mt-3">
                    Hay <strong><%= total %></strong> gatos con adopción aprobada.
                </div>
            <% } %>

            <a href="panel-reportes.jsp" class="btn btn-secondary mt-3">Volver</a>

        </main>

        <footer class="py-4 bg-light mt-auto text-center">Colonia de Gatos © 2025</footer>
    </div>

</div>

</body>
</html>
