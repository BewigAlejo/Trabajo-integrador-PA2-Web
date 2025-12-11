<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.mycompany.integradorpa2.logica.Veterinario" %>

<%
    Veterinario vet = (Veterinario) session.getAttribute("usuarioLogueado");
%>

<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">

    <a class="navbar-brand ps-3">Colonia de Gatos - Veterinario</a>

    <button class="btn btn-link btn-sm" id="sidebarToggle">
        <i class="fas fa-bars"></i>
    </button>

    <ul class="navbar-nav ms-auto me-3 me-lg-4">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                <i class="fas fa-user-md"></i> &nbsp;<%= vet.getNombre() %>
            </a>

            <ul class="dropdown-menu dropdown-menu-end">
                <li><a href="logout.jsp" class="dropdown-item">Salir</a></li>
            </ul>
        </li>
    </ul>

</nav>
