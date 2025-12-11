<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.integradorpa2.logica.Voluntario,
                 com.mycompany.integradorpa2.logica.Adopcion,
                 com.mycompany.integradorpa2.logica.Familia" %>

<%
    Voluntario vol = (Voluntario) session.getAttribute("usuarioLogueado");
    if (vol == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Adopcion> lista = (List<Adopcion>) request.getAttribute("familias");
    Long gatoId = (Long) request.getAttribute("gatoId");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Familias postuladas</title>
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
</head>

<body class="sb-nav-fixed">

<jsp:include page="partials/navbar-voluntario.jsp" />

<div id="layoutSidenav">
    <jsp:include page="partials/sidebar-voluntario.jsp" />

    <div id="layoutSidenav_content">

        <main class="container-fluid px-4">

            <h1 class="mt-4">Familias Postuladas</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item active">Seleccioná quién adopta</li>
            </ol>

            <div class="card shadow-sm">
                <div class="card-header">
                    <i class="fas fa-users me-1"></i> Familias interesadas en el gato
                </div>

                <div class="card-body">

                    <table class="table table-bordered table-striped">
                        <thead class="table-dark">
                            <tr>
                                <th>ID Adopción</th>
                                <th>Familia</th>
                                <th>Reputación</th>
                                <th>Tipo de Adopción</th>
                                <th>Aprobar</th>
                            </tr>
                        </thead>

                        <tbody>
                        <% for (Adopcion a : lista) { 
                               Familia f = a.getFamilia();
                        %>
                            <tr>
                                <td><%= a.getId() %></td>
                                <td><%= f.getNombre() %></td>
                                <td><%= f.getReputacion() %></td>
                                <td><%= a.getTipoAdopcion() %></td>

                                <td>
                                    <form action="VoluntarioAsignarGatoServlet" method="post">
                                        <input type="hidden" name="adopcionId" value="<%= a.getId() %>">
                                        <input type="hidden" name="gatoId" value="<%= gatoId %>">

                                        <button class="btn btn-success btn-sm" type="submit">
                                            Aprobar
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        <% } %>
                        </tbody>
                    </table>

                    <a href="AsignarGatoServlet" class="btn btn-secondary">Volver</a>

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
