<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.mycompany.integradorpa2.logica.Voluntario" %>
<%@ page import="com.mycompany.integradorpa2.logica.Tarea" %>
<%@ page import="com.mycompany.integradorpa2.logica.enums.EstadoTarea" %>

<%
    Voluntario vol = (Voluntario) session.getAttribute("usuarioLogueado");
    if (vol == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    Tarea t = (Tarea) request.getAttribute("tarea");
    EstadoTarea[] estados = (EstadoTarea[]) request.getAttribute("estados");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Tarea</title>

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

            <h1 class="mt-4">Editar Tarea</h1>

            <div class="card mt-4">
                <div class="card-header">
                    Información de la tarea
                </div>

                <div class="card-body">

                    <table class="table table-bordered">
                        <tr><th>ID</th><td><%= t.getId() %></td></tr>
                        <tr><th>Fecha</th><td><%= t.getFecha() %></td></tr>
                        <tr><th>Tipo</th><td><%= t.getTipoTarea().name() %></td></tr>
                        <tr><th>Estado actual</th><td><%= t.getEstadoTarea().name() %></td></tr>
                        <tr><th>Gato</th><td><%= t.getGato() != null ? t.getGato().getNombre() : "-" %></td></tr>
                    </table>

                    <h5>Descripción y observaciones previas</h5>
                    <textarea class="form-control" rows="5" readonly>
<%= t.getDescripcion() != null ? t.getDescripcion() : "" %>
<%= t.getObservacion() != null ? ("\nObservaciones previas:\n" + t.getObservacion()) : "" %>
                    </textarea>

                    <form action="VoluntarioEditarTareaServlet" method="post" class="mt-4">
                        <input type="hidden" name="id" value="<%= t.getId() %>">

                        <label class="form-label">Agregar observación:</label>
                        <textarea name="observacion" class="form-control" rows="4"></textarea>

                        <label class="form-label mt-3">Cambiar estado:</label>
                        <select class="form-select" name="estado">
                            <% for (EstadoTarea et : estados) { %>
                                <option value="<%= et.name() %>"
                                    <%= et == t.getEstadoTarea() ? "selected" : "" %>>
                                    <%= et.name() %>
                                </option>
                            <% } %>
                        </select>

                        <button type="submit" class="btn btn-success mt-3">
                            Guardar cambios
                        </button>

                        <a href="VoluntarioTareasServlet?action=menu" class="btn btn-secondary mt-3">
                            Volver
                        </a>
                    </form>

                </div>
            </div>

        </main>
    </div>
</div>

</body>
</html>
