<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Registro de Familia</title>

    <link href="css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="bg-primary">

<div id="layoutAuthentication">
    <div id="layoutAuthentication_content">
        <main>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-6">

                        <div class="card shadow-lg border-0 rounded-lg mt-5">

                            <div class="card-header">
                                <h3 class="text-center my-3">Registro de Familia</h3>
                            </div>

                            <div class="card-body">

                                <% if (request.getAttribute("error") != null) { %>
                                    <div class="alert alert-danger text-center">
                                        <%= request.getAttribute("error") %>
                                    </div>
                                <% } %>

                                <form action="RegistroFamiliaServlet" method="POST">

                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="inputDireccion" name="direccion"
                                               type="text" placeholder="Dirección" required>
                                        <label for="inputDireccion">Dirección</label>
                                    </div>

                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="inputCoord" name="coordenadas"
                                               type="text" placeholder="Coordenadas" required>
                                        <label for="inputCoord">Coordenadas</label>
                                    </div>

                                    <div class="d-grid mt-4">
                                        <button class="btn btn-primary btn-block" type="submit">Registrarse</button>
                                    </div>

                                </form>

                            </div>

                            <div class="card-footer text-center py-3">
                                <a class="small" href="login.jsp">Volver al login</a>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
