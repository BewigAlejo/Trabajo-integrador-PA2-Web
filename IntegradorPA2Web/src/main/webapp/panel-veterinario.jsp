<%@ page import="com.mycompany.integradorpa2.logica.Veterinario" %>

<%
    Veterinario vet = (Veterinario) session.getAttribute("usuarioLogueado");
    if (vet == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Panel Veterinario</title>

    <link href="css/styles.css" rel="stylesheet">
</head>

<body class="sb-nav-fixed">

<jsp:include page="partials/navbar-veterinario.jsp"/>
<div id="layoutSidenav">

    <jsp:include page="partials/sidebar-veterinario.jsp"/>

    <div id="layoutSidenav_content">
        <main class="container-fluid px-4 text-center">

            <h1 class="mt-4">Bienvenido, <%= vet.getNombre() %></h1>
            <p class="lead">Panel de gestión veterinaria</p>

            <img src="<%= request.getContextPath() %>/img/gatito3.jpg"
            alt="gatito"
            class="img-fluid rounded shadow mb-4"
            style="max-width:500px;">


            <div class="d-flex justify-content-center gap-4">

                <a href="VeterinarioConsultaServlet" class="btn btn-primary btn-lg">
                    <i class="fas fa-stethoscope"></i> Generar consulta médica
                </a>

                <a href="VeterinarioHistorialServlet" class="btn btn-secondary btn-lg">
                    <i class="fas fa-notes-medical"></i> Ver historial médico
                </a>

            </div>

        </main>

        <footer class="py-4 bg-light mt-auto text-center">Colonia de Gatos © 2025</footer>
    </div>

</div>

</body>
</html>
