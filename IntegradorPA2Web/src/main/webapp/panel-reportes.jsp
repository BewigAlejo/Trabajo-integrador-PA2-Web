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
    <meta charset="UTF-8">
    <title>Reportes</title>
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
</head>

<body class="sb-nav-fixed">

<jsp:include page="partials/navbar-voluntario.jsp" />

<div id="layoutSidenav">

    <jsp:include page="partials/sidebar-voluntario.jsp" />

    <div id="layoutSidenav_content">

        <main class="container-fluid px-4">

            <h1 class="mt-4">Reportes de la Colonia</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item active">Elegí un tipo de reporte</li>
            </ol>

            <div class="row">

                <div class="col-md-4">
                    <a href="ReportesServlet?action=porZona" class="text-decoration-none">
                        <div class="card bg-primary text-white mb-4">
                            <div class="card-body">Gatos por Zona</div>
                        </div>
                    </a>
                </div>

                <div class="col-md-4">
                    <a href="ReportesServlet?action=adoptados" class="text-decoration-none">
                        <div class="card bg-success text-white mb-4">
                            <div class="card-body">Gatos Adoptados</div>
                        </div>
                    </a>
                </div>

                <div class="col-md-4">
                    <a href="ReportesServlet?action=esterilizados" class="text-decoration-none">
                        <div class="card bg-warning text-white mb-4">
                            <div class="card-body">Gatos Esterilizados</div>
                        </div>
                    </a>
                </div>

            </div>

        </main>

        <footer class="py-4 bg-light mt-auto text-center">
            Colonia de Gatos © 2025
        </footer>

    </div>

</div>

</body>
</html>
