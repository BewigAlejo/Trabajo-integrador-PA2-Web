<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.mycompany.integradorpa2.logica.Voluntario" %>
<%@ page import="com.mycompany.integradorpa2.logica.enums.TipoTarea" %>

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
    <title>Registrar Tarea</title>

    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
</head>

<body class="sb-nav-fixed">

<!-- NAVBAR -->
<jsp:include page="partials/navbar-voluntario.jsp" />

<div id="layoutSidenav">

    <!-- SIDEBAR -->
    <jsp:include page="partials/sidebar-voluntario.jsp" />

    <!-- CONTENIDO -->
    <div id="layoutSidenav_content">
        <main class="container-fluid px-4">

            <h1 class="mt-4">Registrar Tarea</h1>

            <div class="card mt-4">
                <div class="card-body">

                    <form action="VoluntarioTareasServlet" method="post">
                        <input type="hidden" name="action" value="guardarTarea">
                        <input type="hidden" name="gatoId" value="<%= request.getParameter("gatoId") %>">

                        <div class="mb-3">
                            <label class="form-label">Tipo de tarea:</label>
                            <select class="form-select" name="tipo">
                                <% for (TipoTarea t : TipoTarea.values()) { %>
                                    <option value="<%= t.name() %>"><%= t.name() %></option>
                                <% } %>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Descripción:</label>
                            <textarea class="form-control" name="descripcion" rows="4"></textarea>
                        </div>

                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-save"></i> Guardar
                        </button>

                        <a href="VoluntarioTareasServlet?action=menu" class="btn btn-secondary">
                            Cancelar
                        </a>
                    </form>

                </div>
            </div>

        </main>
    </div>

</div>

</body>
</html>
