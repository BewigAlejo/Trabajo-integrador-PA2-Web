<%@ page contentType="text/html; charset=UTF-8" %>

<div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">

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

                <a class="nav-link text-danger" href="LogoutServlet">
                    <div class="sb-nav-link-icon"><i class="fas fa-sign-out-alt"></i></div>
                    Salir
                </a>

            </div>
        </div>

        <div class="sb-sidenav-footer">
            <div class="small">Voluntario</div>
        </div>

    </nav>
</div>
