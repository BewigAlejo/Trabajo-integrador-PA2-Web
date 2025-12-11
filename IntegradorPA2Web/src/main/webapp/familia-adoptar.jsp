<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.integradorpa2.logica.Gato" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Adoptar Gatos</title>
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"></script>
</head>

<body class="sb-nav-fixed">

    <!-- NAV -->
    <jsp:include page="/partials/navbar-familia.jsp" />

    <div id="layoutSidenav">

        <!-- SIDEBAR -->
        <jsp:include page="/partials/sidebar-familia.jsp" />

        <!-- CONTENIDO -->
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">

                    <h1 class="mt-4">Gatos Disponibles</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item active">Seleccioná un gato para adoptar</li>
                    </ol>

                    <!-- MENSAJES -->
                    <% if (request.getAttribute("msg") != null) { %>
                        <div class="alert alert-success"><%= request.getAttribute("msg") %></div>
                    <% } %>

                    <% if (request.getAttribute("error") != null) { %>
                        <div class="alert alert-danger"><%= request.getAttribute("error") %></div>
                    <% } %>

                    <!-- TABLA -->
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-cat me-1"></i>
                            Gatos en Adopción
                        </div>

                        <div class="card-body">

                            <table class="table table-striped table-bordered">
                                <thead class="table-dark">
                                    <tr>
                                        <th>ID</th>
                                        <th>Nombre</th>
                                        <th>Raza</th>
                                        <th>Edad</th>
                                        <th>Estado de Salud</th>
                                        <th>Zona</th>
                                        <th>Acción</th>
                                    </tr>
                                </thead>

                                <tbody>
                                <%
                                    List<Gato> lista = (List<Gato>) request.getAttribute("listaGatos");
                                    if (lista != null) {
                                        for (Gato g : lista) {
                                %>
                                    <tr>
                                        <td><%= g.getId() %></td>
                                        <td><%= g.getNombre() %></td>
                                        <td><%= g.getRaza() %></td>
                                        <td><%= g.getEdad() %></td>
                                        <td><%= g.getEstadoDeSalud() %></td>
                                        <td><%= g.getZona() != null ? g.getZona().getNombreZona() : "-" %></td>

                                        <td>
                                            <a class="btn btn-primary btn-sm"
                                               href="postular?id=<%= g.getId() %>">
                                                Postularse
                                            </a>
                                        </td>
                                    </tr>
                                <%
                                        }
                                    }
                                %>
                                </tbody>

                            </table>

                        </div>
                    </div>

                </div>
            </main>

            <footer class="py-4 bg-light mt-auto">
                <div class="container-fluid px-4">
                    <div class="d-flex align-items-center justify-content-between small">
                        <div class="text-muted">Colonia de Gatos © 2025</div>
                    </div>
                </div>
            </footer>

        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/scripts.js"></script>

</body>
</html>
