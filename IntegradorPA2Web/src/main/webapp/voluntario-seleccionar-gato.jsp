<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.integradorpa2.logica.Voluntario" %>
<%@ page import="com.mycompany.integradorpa2.logica.Gato" %>

<%
    Voluntario vol = (Voluntario) session.getAttribute("usuarioLogueado");
    if (vol == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Gato> gatos = (List<Gato>) request.getAttribute("gatos");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <title>Seleccionar Gato</title>

    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"></script>
</head>

<body class="sb-nav-fixed">

<!-- NAVBAR -->
<jsp:include page="partials/navbar-voluntario.jsp" />

<div id="layoutSidenav">

    <!-- SIDEBAR -->
    <jsp:include page="partials/sidebar-voluntario.jsp" />

    <!-- CONTENIDO PRINCIPAL -->
    <div id="layoutSidenav_content">

        <main class="container-fluid px-4">

            <h1 class="mt-4">Crear Nueva Tarea</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item active">Seleccionar gato</li>
            </ol>

            <div class="card shadow-sm">
                <div class="card-header">
                    <i class="fas fa-cat me-1"></i> Elegí un gato
                </div>

                <div class="card-body">

                    <form action="VoluntarioTareasServlet" method="get" class="mt-3">

                        <input type="hidden" name="action" value="nueva">

                        <div class="mb-3">
                            <label class="form-label">Gato:</label>
                            <select name="gatoId" class="form-select">
                                <% for (Gato g : gatos) { %>
                                    <option value="<%= g.getId() %>">
                                        <%= g.getNombre() %> — <%= g.getRaza() %> — Zona: 
                                        <%= g.getZona() != null ? g.getZona().getNombreZona() : "-" %>
                                    </option>
                                <% } %>
                            </select>
                        </div>

                        <button type="submit" class="btn btn-primary">
                            Continuar <i class="fas fa-arrow-right"></i>
                        </button>

                        <a href="VoluntarioTareasServlet?action=menu" class="btn btn-secondary ms-2">
                            Cancelar
                        </a>

                    </form>

                </div>
            </div>

        </main>

        <footer class="py-4 bg-light mt-auto">
            <div class="container-fluid px-4 text-center">
                Colonia de Gatos © 2025
            </div>
        </footer>
    </div>

</div>

</body>
</html>
