<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, com.mycompany.integradorpa2.logica.*" %>

<%
    Voluntario vol = (Voluntario) session.getAttribute("usuarioLogueado");
    if (vol == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Zona> zonas = (List<Zona>) request.getAttribute("zonas");
    List<Gato> lista = (List<Gato>) request.getAttribute("gatos");

    String zonaParam = request.getParameter("zonaId");
    Long zonaFiltrar = null;

    if (zonaParam != null && !zonaParam.equals("0") && !zonaParam.equals("") && !zonaParam.equalsIgnoreCase("null")) {
        try { zonaFiltrar = Long.parseLong(zonaParam); }
        catch (Exception e) { zonaFiltrar = null; }
    }

    long total = 0;
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reporte: Gatos por Zona</title>
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
</head>

<body class="sb-nav-fixed">

<jsp:include page="partials/navbar-voluntario.jsp" />
<div id="layoutSidenav">

    <jsp:include page="partials/sidebar-voluntario.jsp" />

    <div id="layoutSidenav_content">

        <main class="container-fluid px-4">

            <h1 class="mt-4">Gatos por Zona</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item">Reportes</li>
                <li class="breadcrumb-item active">Por zona</li>
            </ol>

            <!-- FILTRO -->
            <div class="card mb-4 shadow-sm">
                <div class="card-header">
                    <i class="fas fa-filter"></i> Seleccionar zona
                </div>

                <div class="card-body">
                    <form method="GET" action="ReportesServlet" class="row g-3">
                        <input type="hidden" name="action" value="porZona">

                        <div class="col-md-6">
                            <select name="zonaId" class="form-select">
                                <option value="0">Todas</option>
                                <% for (Zona z : zonas) { %>
                                    <option value="<%= z.getId() %>"
                                        <%= (zonaFiltrar != null && zonaFiltrar.equals(z.getId()) ? "selected" : "") %>>
                                        <%= z.getNombreZona() %>
                                    </option>
                                <% } %>
                            </select>
                        </div>

                        <div class="col-md-3">
                            <button class="btn btn-primary w-100">Filtrar</button>
                        </div>
                    </form>
                </div>
            </div>

            <!-- TABLA -->
            <div class="card shadow-sm">
                <div class="card-header bg-dark text-white">
                    <i class="fas fa-cat"></i> Resultados
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
                            <th>Zona</th>
                        </tr>
                        </thead>

                        <tbody>
                        <% for (Gato g : lista) {
                               if (zonaFiltrar == null ||
                                   (g.getZona() != null && Objects.equals(g.getZona().getId(), zonaFiltrar))) {

                                   total++;
                        %>
                            <tr>
                                <td><%= g.getId() %></td>
                                <td><%= g.getNombre() %></td>
                                <td><%= g.getRaza() %></td>
                                <td><%= g.getEdad() %></td>
                                <td><%= g.getEstadoDeSalud() %></td>
                                <td><%= g.getZona() != null ? g.getZona().getNombreZona() : "-" %></td>
                            </tr>
                        <% }} %>
                        </tbody>
                    </table>
                </div>
            </div>

            <br>

            <!-- BOTÓN DE REPORTE -->
            <form method="GET" action="ReportesServlet" class="mt-3">
                <input type="hidden" name="action" value="porZona">
                <input type="hidden" name="zonaId" value="<%= zonaParam %>">

                <button name="reporte" value="1" class="btn btn-success">
                    Generar reporte
                </button>
            </form>

            <% if (request.getParameter("reporte") != null) { %>
                <div class="alert alert-info mt-3">
                    Hay <strong><%= total %></strong> gatos en la zona seleccionada.
                </div>
            <% } %>

            <a href="panel-reportes.jsp" class="btn btn-secondary mt-3">Volver</a>

        </main>

        <footer class="py-4 bg-light mt-auto text-center">Colonia de Gatos © 2025</footer>
    </div>

</div>

</body>
</html>
