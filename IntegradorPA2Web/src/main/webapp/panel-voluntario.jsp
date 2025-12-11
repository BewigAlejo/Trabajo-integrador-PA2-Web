<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.mycompany.integradorpa2.logica.Voluntario" %>

<%
    Voluntario vol = (Voluntario) session.getAttribute("usuarioLogueado");
    if (vol == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <title>Panel Voluntario</title>

    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"></script>

    <style>
        .center-container {
            text-align: center;
            padding-top: 60px;
        }

        .center-img {
            width: 350px;
            border-radius: 12px;
        }

        .big-btn {
            width: 250px;
            margin-top: 20px;
        }
    </style>
</head>

<body class="sb-nav-fixed">

<!-- NAVBAR -->
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <a class="navbar-brand ps-3">Colonia de Gatos</a>
    <button class="btn btn-link btn-sm" id="sidebarToggle">
        <i class="fas fa-bars"></i>
    </button>

    <ul class="navbar-nav ms-auto me-3 me-lg-4">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                <i class="fas fa-user fa-fw"></i> &nbsp;<%= vol.getNombre() %>
            </a>
            <ul class="dropdown-menu dropdown-menu-end">
                <li><a href="LogoutServlet" class="dropdown-item">Salir</a></li>
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

                    <div class="sb-sidenav-menu-heading">Opciones</div>

                    <a class="nav-link" href="panel-voluntario.jsp">
                        <div class="sb-nav-link-icon"><i class="fas fa-home"></i></div>
                        Inicio
                    </a>

                    <a class="nav-link" href="VoluntarioRegistrarGatoServlet">
                        <div class="sb-nav-link-icon"><i class="fas fa-cat"></i></div>
                        Registrar Gato
                    </a>

                    <a class="nav-link" href="VoluntarioTareasServlet?action=menu">
                        <div class="sb-nav-link-icon"><i class="fas fa-tasks"></i></div>
                        Gestionar Tareas
                    </a>

                    <a class="nav-link" href="VoluntarioAsignarGatoServlet">
                        <div class="sb-nav-link-icon"><i class="fas fa-user-plus"></i></div>
                        Asignar Gatos
                    </a>

                    <a class="nav-link" href="panel-reportes.jsp">
                        <div class="sb-nav-link-icon"><i class="fas fa-chart-bar"></i></div>
                        Reportes
                    </a>

                    <a class="nav-link" href="LogoutServlet">
                        <div class="sb-nav-link-icon"><i class="fas fa-sign-out-alt"></i></div>
                        Salir
                    </a>

                </div>
            </div>

            <div class="sb-sidenav-footer">Voluntario</div>
        </nav>
    </div>

    <!-- MAIN -->
    <div id="layoutSidenav_content">
        <main>
            <div class="container center-container">

                <img src="img/gatitos2.jpg" class="center-img">

                <h2 class="mt-4">Bienvenido, <%= vol.getNombre() %> ❤️</h2>

                <a href="VoluntarioRegistrarGatoServlet" class="btn btn-primary big-btn">
                    Registrar Gato
                </a>

                <a href="VoluntarioTareasServlet?action=menu" class="btn btn-warning big-btn">
                    Gestionar Tareas
                </a>

                <a href="VoluntarioAsignarGatoServlet" class="btn btn-success big-btn">
                    Asignar Gatos
                </a>

                <a href="panel-reportes.jsp" class="btn btn-info big-btn">
                    Reportes
                </a>

            </div>
        </main>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/scripts.js"></script>

</body>
</html>
