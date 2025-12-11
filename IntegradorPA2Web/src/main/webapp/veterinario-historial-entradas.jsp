<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.integradorpa2.logica.EntradaHistorial" %>
<%@ page import="com.mycompany.integradorpa2.logica.Veterinario" %>

<%
    Veterinario vet = (Veterinario) session.getAttribute("usuarioLogueado");
    if (vet == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<EntradaHistorial> lista = (List<EntradaHistorial>) request.getAttribute("listaEntradas");
    Long gatoId = (Long) request.getAttribute("gatoId");
    String ctx = request.getContextPath();
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Entradas Historial Médico</title>

    <link href="<%=ctx%>/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"></script>
</head>
<body class="sb-nav-fixed">

<!-- NAVBAR -->
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <a class="navbar-brand ps-3" href="<%=ctx%>/panel-veterinario.jsp">Colonia de Gatos - Veterinario</a>
    <button class="btn btn-link btn-sm" id="sidebarToggle"><i class="fas fa-bars"></i></button>

    <ul class="navbar-nav ms-auto me-3 me-lg-4">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                <i class="fas fa-user fa-fw"></i> &nbsp;<%= vet.getNombre() %>
            </a>
            <ul class="dropdown-menu dropdown-menu-end">
                <li><a class="dropdown-item" href="<%=ctx%>/LogoutServlet">Salir</a></li>
            </ul>
        </li>
    </ul>
</nav>

<div id="layoutSidenav">
    <!-- SIDEBAR -->
    <div id="layoutSidenav_nav">
        <nav class="sb-sidenav accordion sb-sidenav-dark">
            <div class="sb-sidenav-menu">
                <div class="nav">
                    <div class="sb-sidenav-menu-heading">Panel</div>
                    <a class="nav-link" href="<%=ctx%>/panel-veterinario.jsp">
                        <div class="sb-nav-link-icon"><i class="fas fa-home"></i></div>
                        Inicio
                    </a>

                    <div class="sb-sidenav-menu-heading">Consultas</div>
                    <a class="nav-link" href="<%=ctx%>/VeterinarioConsultaServlet">
                        <div class="sb-nav-link-icon"><i class="fas fa-stethoscope"></i></div>
                        Generar consulta
                    </a>
                    <a class="nav-link" href="<%=ctx%>/VeterinarioHistorialServlet">
                        <div class="sb-nav-link-icon"><i class="fas fa-notes-medical"></i></div>
                        Ver historiales
                    </a>

                    <a class="nav-link" href="<%=ctx%>/LogoutServlet">
                        <div class="sb-nav-link-icon"><i class="fas fa-sign-out-alt"></i></div>
                        Salir
                    </a>
                </div>
            </div>
            <div class="sb-sidenav-footer">
                Veterinario
            </div>
        </nav>
    </div>

    <!-- CONTENIDO -->
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4 mt-4">
                <h1 class="mb-3">Historial Médico del Gato</h1>

                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-notes-medical me-1"></i>
                        Entradas del historial
                        <% if (gatoId != null) { %>
                            (ID gato: <%= gatoId %>)
                        <% } %>
                    </div>
                    <div class="card-body">
                        <table class="table table-striped table-hover">
                            <thead class="table-dark">
                            <tr>
                                <th>Fecha</th>
                                <th>Diagnóstico</th>
                                <th>Tratamiento</th>
                                <th>Veterinario</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                if (lista != null && !lista.isEmpty()) {
                                    for (EntradaHistorial e : lista) {
                            %>
                            <tr>
                                <td><%= e.getFecha() %></td>
                                <td><%= e.getDiagnostico() %></td>
                                <td><%= e.getTratamiento() %></td>
                                <td><%= e.getVeterinario() != null ? e.getVeterinario().getNombre() : "-" %></td>
                            </tr>
                            <%
                                    }
                                } else {
                            %>
                            <tr>
                                <td colspan="4" class="text-center">No hay entradas para este gato.</td>
                            </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>

                        <a href="<%=ctx%>/VeterinarioHistorialServlet" class="btn btn-secondary mt-3">
                            Volver a selección de gato
                        </a>
                    </div>
                </div>
            </div>
        </main>

        <footer class="py-4 bg-light mt-auto">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted">Colonia de Gatos © 2025</div>
                </div>
            </div>
        </footer>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="<%=ctx%>/js/scripts.js"></script>
</body>
</html>
