<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.integradorpa2.logica.Adopcion" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Tus Adopciones</title>
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"></script>
</head>

<body class="sb-nav-fixed">

    <!-- NAVBAR -->
    <jsp:include page="/partials/navbar-familia.jsp" />

    <div id="layoutSidenav">

        <!-- SIDEBAR -->
        <jsp:include page="/partials/sidebar-familia.jsp" />

        <!-- CONTENIDO -->
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">

                    <h1 class="mt-4">Mis Adopciones</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item active">Historial de Adopciones</li>
                    </ol>

                    <!-- TABLA -->
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-cat me-1"></i>
                            Adopciones Registradas
                        </div>

                        <div class="card-body">
                            <table class="table table-bordered">

                                <thead class="table-dark">
                                    <tr>
                                        <th>ID</th>
                                        <th>Gato</th>
                                        <th>Tipo</th>
                                        <th>Fecha</th>
                                        <th>Estado</th>
                                        <th>Observación</th>
                                    </tr>
                                </thead>

                                <tbody>
                                <%
                                    List<Adopcion> lista = (List<Adopcion>) request.getAttribute("listaAdopciones");
                                    if (lista != null) {
                                        for (Adopcion a : lista) {
                                %>
                                    <tr>
                                        <td><%= a.getId() %></td>
                                        <td><%= a.getGato().getNombre() %></td>
                                        <td><%= a.getTipoAdopcion() %></td>
                                        <td><%= a.getFechaAdopcion() %></td>
                                        <td><%= a.getEstado() %></td>
                                        <td><%= a.getObservacion() %></td>
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
