<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List, com.mycompany.integradorpa2.logica.Zona" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registrar Gato</title>

    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"></script>

    <style>
        .form-box {
            max-width: 600px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            margin-top: 40px;
        }
    </style>
</head>

<body class="sb-nav-fixed">

<jsp:include page="partials/navbar-voluntario.jsp"/>

<div id="layoutSidenav">

    <jsp:include page="partials/sidebar-voluntario.jsp"/>

    <div id="layoutSidenav_content">
        <main>
            <div class="container">

                <div class="form-box shadow">

                    <h2 class="text-center mb-4">Registrar Nuevo Gato</h2>

                    <% if(request.getAttribute("msg") != null){ %>
                        <div class="alert alert-success"><%= request.getAttribute("msg") %></div>
                    <% } %>

                    <% if(request.getAttribute("error") != null){ %>
                        <div class="alert alert-danger"><%= request.getAttribute("error") %></div>
                    <% } %>

                    <form action="VoluntarioRegistrarGatoServlet" method="post">

                        <label class="form-label">Nombre</label>
                        <input class="form-control" type="text" name="nombre" required>

                        <label class="form-label mt-3">Raza</label>
                        <input class="form-control" type="text" name="raza">

                        <label class="form-label mt-3">Edad</label>
                        <input class="form-control" type="number" name="edad">

                        <label class="form-label mt-3">Estado de Salud</label>
                        <select class="form-select" name="salud">
                            <option value="SANO">SANO</option>
                            <option value="ENFERMO">ENFERMO</option>
                        </select>

                        <label class="form-label mt-3">Adoptado</label>
                        <select class="form-select" name="adoptado">
                            <option value="false">No</option>
                            <option value="true">Sí</option>
                        </select>

                        <label class="form-label mt-3">Zona</label>
                        <select class="form-select" name="zona">
                            <%
                                List<Zona> zonas = (List<Zona>) request.getAttribute("zonas");
                                for (Zona z : zonas) {
                            %>
                                <option value="<%= z.getId() %>"><%= z.getNombreZona() %></option>
                            <% } %>
                        </select>

                        <button class="btn btn-primary w-100 mt-4" type="submit">Registrar</button>
                    </form>

                    <a href="panel-voluntario.jsp" class="btn btn-secondary w-100 mt-3">Volver</a>

                </div>

            </div>
        </main>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/scripts.js"></script>
</body>
</html>
