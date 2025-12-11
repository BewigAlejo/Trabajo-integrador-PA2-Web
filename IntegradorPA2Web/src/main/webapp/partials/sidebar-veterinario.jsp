<%@ page contentType="text/html; charset=UTF-8" %>

<div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark">

        <div class="sb-sidenav-menu">
            <div class="nav">

                <div class="sb-sidenav-menu-heading">Panel</div>

                <a class="nav-link" href="panel-veterinario.jsp">
                    <div class="sb-nav-link-icon"><i class="fas fa-home"></i></div>
                    Inicio
                </a>

                <div class="sb-sidenav-menu-heading">Consultas</div>

                <a class="nav-link" href="VeterinarioConsultaServlet">
                    <div class="sb-nav-link-icon"><i class="fas fa-stethoscope"></i></div>
                    Generar consulta
                </a>

                <a class="nav-link" href="VeterinarioHistorialServlet">
                    <div class="sb-nav-link-icon"><i class="fas fa-notes-medical"></i></div>
                    Ver historiales
                </a>

                <a class="nav-link" href="logout.jsp">
                    <div class="sb-nav-link-icon"><i class="fas fa-sign-out-alt"></i></div>
                    Salir
                </a>

            </div>
        </div>

        <div class="sb-sidenav-footer">
            <div class="small">Veterinario</div>
        </div>

    </nav>
</div>
