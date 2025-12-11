<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.mycompany.integradorpa2.logica.Voluntario" %>

<%
    Voluntario vol = (Voluntario) session.getAttribute("usuarioLogueado");
%>

<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">

    <!-- Logo / Home -->
    <a class="navbar-brand ps-3" href="panel-voluntario.jsp">
        Colonia de Gatos
    </a>

    <!-- Sidebar toggle -->
    <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle">
        <i class="fas fa-bars"></i>
    </button>

    <!-- Right user menu -->
    <ul class="navbar-nav ms-auto me-3 me-lg-4">
        <li class="nav-item dropdown">

            <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button"
               data-bs-toggle="dropdown" aria-expanded="false">

                <i class="fas fa-user fa-fw"></i>

                <% if (vol != null) { %>
                    &nbsp; <%= vol.getNombre() %>
                <% } %>

            </a>

            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                <li>
                    <a class="dropdown-item" href="panel-voluntario.jsp">
                        Panel
                    </a>
                </li>
                <li><hr class="dropdown-divider" /></li>
                <li>
                    <a class="dropdown-item text-danger" href="LogoutServlet">
                        <i class="fas fa-sign-out-alt"></i> Salir
                    </a>
                </li>
            </ul>

        </li>
    </ul>

</nav>
