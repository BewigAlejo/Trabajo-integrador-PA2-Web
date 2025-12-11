<%@ page contentType="text/html; charset=UTF-8" %>

<div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">

        <div class="sb-sidenav-menu">

            <div class="nav">

                <div class="sb-sidenav-menu-heading">Panel</div>

                <!-- Inicio -->
                <a class="nav-link" href="${pageContext.request.contextPath}/panel-familia.jsp">
                    <div class="sb-nav-link-icon"><i class="fas fa-home"></i></div>
                    Inicio
                </a>

                <div class="sb-sidenav-menu-heading">Adopciones</div>

                <!-- Adoptar -->
                <a class="nav-link" href="${pageContext.request.contextPath}/familia/adoptar">
                    <div class="sb-nav-link-icon"><i class="fas fa-cat"></i></div>
                    Adoptar Gatos
                </a>

                <!-- Mis Adopciones -->
                <a class="nav-link" href="${pageContext.request.contextPath}/familia/adopciones">
                    <div class="sb-nav-link-icon"><i class="fas fa-heart"></i></div>
                    Mis Adopciones
                </a>

                <div class="sb-sidenav-menu-heading">Cuenta</div>

                <!-- Logout -->
                <a class="nav-link" href="${pageContext.request.contextPath}/logout.jsp">
                    <div class="sb-nav-link-icon"><i class="fas fa-sign-out-alt"></i></div>
                    Cerrar Sesión
                </a>

            </div>

        </div>

        <div class="sb-sidenav-footer">
            <div class="small">Conectado como:</div>
            ${usuarioLogueado != null ? usuarioLogueado.nombre : "Familia"}
        </div>

    </nav>
</div>
