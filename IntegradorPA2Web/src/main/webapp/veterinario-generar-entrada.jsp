<%@ page import="com.mycompany.integradorpa2.logica.Gato" %>

<%
    Gato g = (Gato) request.getAttribute("gato");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Generar Consulta Médica</title>
    <link href="css/styles.css" rel="stylesheet">
</head>

<body class="sb-nav-fixed">

<jsp:include page="partials/navbar-veterinario.jsp"/>
<div id="layoutSidenav">
<jsp:include page="partials/sidebar-veterinario.jsp"/>

<div id="layoutSidenav_content">
<main class="container-fluid px-4">

    <h1 class="mt-4">Consulta Médica</h1>
    <p class="lead">Gato seleccionado: <strong><%= g.getNombre() %></strong></p>

    <div class="card shadow-sm col-md-8 mx-auto">
        <div class="card-header bg-info text-white">
            <i class="fas fa-file-medical"></i> Registrar diagnóstico
        </div>

        <div class="card-body">

            <form action="VeterinarioGenerarEntradaServlet" method="post">
                <input type="hidden" name="gatoId" value="<%= g.getId() %>">

                <label class="form-label">Diagnóstico:</label>
                <textarea name="diagnostico" class="form-control" required></textarea>

                <label class="form-label mt-3">Tratamiento:</label>
                <textarea name="tratamiento" class="form-control" required></textarea>

                <button class="btn btn-success mt-4 w-100">Guardar</button>
            </form>

        </div>
    </div>

    <a href="VeterinarioConsultaServlet" class="btn btn-secondary mt-3">Volver</a>

</main>

<footer class="py-4 bg-light mt-auto text-center">Colonia de Gatos © 2025</footer>
</div>

</div>

</body>
</html>
