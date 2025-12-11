<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.integradorpa2.logica.Voluntario" %>
<%@ page import="com.mycompany.integradorpa2.logica.Tarea" %>

<%
    Voluntario vol = (Voluntario) session.getAttribute("usuarioLogueado");
    if (vol == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Tarea> tareas = (List<Tarea>) request.getAttribute("tareas");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <title>Gestionar Tareas</title>

    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"></script>
</head>

<body class="sb-nav-fixed">

<!-- NAVBAR -->
<jsp:include page="partials/navbar-voluntario.jsp" />

<div id="layoutSidenav">

    <!-- SIDEBAR -->
    <jsp:include page="partials/sidebar-voluntario.jsp" />

    <!-- CONTENIDO -->
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">

                <h1 class="mt-4">Gestionar Tareas</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">Tareas asignadas y pendientes</li>
                </ol>

                <div class="mb-3">
                    <a href="VoluntarioTareasServlet?action=seleccionarGato" class="btn btn-primary">
                        <i class="fas fa-plus"></i> Crear nueva tarea
                    </a>
                </div>

                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-tasks me-1"></i>
                        Listado de Tareas
                    </div>

                    <div class="card-body">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Fecha</th>
                                    <th>Tipo</th>
                                    <th>Estado</th>
                                    <th>Gato</th>
                                    <th>Acción</th>
                                </tr>
                            </thead>

                            <tbody>
                                <% if (tareas != null) { 
                                       for (Tarea t : tareas) { %>
                                    <tr>
                                        <td><%= t.getId() %></td>
                                        <td><%= t.getFecha() %></td>
                                        <td><%= t.getTipoTarea() %></td>
                                        <td><%= t.getEstadoTarea() %></td>
                                        <td><%= t.getGato() != null ? t.getGato().getNombre() : "-" %></td>
                                        <td>
                                            <a href="VoluntarioEditarTareaServlet?id=<%= t.getId() %>" 
                                               class="btn btn-warning btn-sm">
                                                <i class="fas fa-edit"></i> Tomar / Editar
                                            </a>
                                        </td>
                                    </tr>
                                <% } 
                                   } %>
                            </tbody>

                        </table>
                    </div>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/scripts.js"></script>

</body>
</html>
