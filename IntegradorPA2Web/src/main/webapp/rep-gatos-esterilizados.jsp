<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, com.mycompany.integradorpa2.logica.*" %>

<%
    Voluntario vol = (Voluntario) session.getAttribute("usuarioLogueado");
    if (vol == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Gato> lista = (List<Gato>) request.getAttribute("gatos");
    int total = lista.size();
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Reporte: Gatos Esterilizados</title>
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
</head>

<body class="sb-nav-fixed">

<jsp:include page="partials/navbar-voluntario.jsp" />
<div id="layoutSidenav">

    <jsp:include page="partials/sidebar-voluntario.jsp" />

    <div id="layoutSidenav_content">

        <main class="container-fluid px-4">

            <h1 class="mt-4">Gatos Esterilizados</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item">Reportes</li>
                <li class="breadcrumb-item active">Esterilizados</li>
            </ol>

            <div class="card shadow-sm">
                <div class="card-header bg-warning text-white">
                    <i class="fas fa-cut"></i> Lista de gatos esterilizados
                </div>

                <div class="card-body">

                    <table class="table table-bordered table-striped">
                        <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Raza</th>
                            <th>Zona</th>
                        </tr>
                        </thead>

                        <tbody>
                        <% for (Gato g : lista) { %>
                            <tr>
                                <td><%= g.getId() %></td>
                                <td><%= g.getNombre() %></td>
                                <td><%= g.getRaza() %></td>
                                <td><%= g.getZona() != null ? g.getZona().getNombreZona() : "-" %></td>
                            </tr>
                        <% } %>
                        </tbody>
                    </table>

                </div>
            </div>

            <!-- REPORTE -->
            <form method="GET" action="ReportesServlet" class="mt-3">
                <input type="hidden" name="action" value="esterilizados">
                <button name="reporte" value="1" class="btn btn-success">Generar reporte</button>
            </form>

            <% if (request.getParameter("reporte") != null) { %>
                <div class="alert alert-info mt-3">
                    Hay <strong><%= total %></strong> gatos esterilizados en total.
                </div>
            <% } %>

            <a href="panel-reportes.jsp" class="btn btn-secondary mt-3">Volver</a>

        </main>

        <footer class="py-4 bg-light mt-auto text-center">Colonia de Gatos © 2025</footer>
    </div>

</div>

</body>
</html>
