<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.mycompany.integradorpa2.logica.Familia" %>

<%
    Familia fam = (Familia) session.getAttribute("usuarioLogueado");
    if (fam == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <title>Panel de Familia</title>

    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"></script>

    <style>
        .center-content {
            text-align: center;
            padding-top: 50px;
        }
        .family-img {
            width: 350px;
            margin-bottom: 30px;
        }
        .btn-large {
            width: 250px;
            margin: 10px;
            padding: 15px;
            font-size: 18px;
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
                <i class="fas fa-user fa-fw"></i> &nbsp;<%= fam.getNombre() %>
            </a>
            <ul class="dropdown-menu dropdown-menu-end">
                <li><a href="logout.jsp" class="dropdown-item">Salir</a></li>
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

                    <a class="nav-link" href="panel-familia.jsp">
                        <div class="sb-nav-link-icon"><i class="fas fa-home"></i></div>
                        Inicio
                    </a>

                    <a class="nav-link" href="familia/adoptar">
                        <div class="sb-nav-link-icon"><i class="fas fa-cat"></i></div>
                        Adoptar Gatos
                    </a>

                    <a class="nav-link" href="familia/adopciones">
                        <div class="sb-nav-link-icon"><i class="fas fa-list"></i></div>
                        Mis Adopciones
                    </a>

                    <a class="nav-link" href="logout.jsp">
                        <div class="sb-nav-link-icon"><i class="fas fa-sign-out-alt"></i></div>
                        Salir
                    </a>

                </div>
            </div>

            <div class="sb-sidenav-footer">
                <div class="small">Familia: <%= fam.getNombre() %></div>
            </div>
        </nav>
    </div>

    <!-- CONTENIDO -->
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4 center-content">

                <img src="img/gatitos.jpg" class="family-img" alt="Gatitos">

                <h2 class="mb-4">Bienvenido, <%= fam.getNombre() %> 🐾</h2>
                <p class="text-muted mb-4">¿Qué te gustaría hacer hoy?</p>

                <a href="familia/adoptar" class="btn btn-primary btn-large">
                    <i class="fas fa-cat"></i> Adoptar Gatos
                </a>

                <a href="familia/adopciones" class="btn btn-success btn-large">
                    <i class="fas fa-list"></i> Ver Mis Adopciones
                </a>

            </div>
        </main>

        <!-- FOOTER -->
        <footer class="py-4 bg-light mt-auto">
            <div class="container-fluid px-4 text-center text-muted small">
                Colonia de Gatos © 2025
            </div>
        </footer>
    </div>
</div>

<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/js/scripts.js"></script>

</body>
</html>
