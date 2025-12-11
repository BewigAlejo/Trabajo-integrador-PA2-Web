<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registrarse - SB Admin</title>
    <link href="css/styles.css" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="bg-primary">

<div id="layoutAuthentication">
    <div id="layoutAuthentication_content">
        <main>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-7">

                        <div class="card shadow-lg border-0 rounded-lg mt-5">

                            <div class="card-header">
                                <h3 class="text-center my-4">Crear cuenta</h3>
                            </div>

                            <div class="card-body">

                                <!-- MENSAJE DE ERROR -->
                                <% if (request.getAttribute("error") != null) { %>
                                    <div class="alert alert-danger text-center">
                                        <%= request.getAttribute("error") %>
                                    </div>
                                <% } %>

                                <!-- FORMULARIO QUE ENVÍA A RegisterServlet -->
                                <form method="POST" action="RegisterServlet">

                                    <!-- Nombre -->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="inputNombre"
                                               name="nombre" type="text" placeholder="Nombre" />
                                        <label for="inputNombre">Nombre completo</label>
                                    </div>

                                    <!-- Email -->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="inputEmail"
                                               name="email" type="email" placeholder="email@ejemplo.com" />
                                        <label for="inputEmail">Email</label>
                                    </div>

                                    <!-- Usuario -->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="inputUsuario"
                                               name="usuario" type="text" placeholder="Usuario" />
                                        <label for="inputUsuario">Usuario</label>
                                    </div>

                                    <!-- Contraseña -->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="inputPassword"
                                               name="password" type="password" placeholder="Contraseña" />
                                        <label for="inputPassword">Contraseña</label>
                                    </div>

                                    <!-- Selección de Rol -->
                                    <div class="form-floating mb-3">
                                        <select class="form-control" id="inputRol" name="rol">
                                            <option value="">Seleccione un rol</option>
                                            <option value="VOLUNTARIO">Voluntario</option>
                                            <option value="FAMILIA">Familia</option>
                                        </select>
                                        <label for="inputRol">Rol</label>
                                    </div>

                                    <!-- BOTÓN -->
                                    <div class="d-grid mt-4 mb-0">
                                        <button class="btn btn-primary btn-block" type="submit">
                                            Crear cuenta
                                        </button>
                                    </div>

                                </form>

                            </div>

                            <div class="card-footer text-center py-3">
                                <div class="small">
                                    <a href="login.jsp">¿Ya tenés cuenta? Inicia sesión</a>
                                </div>
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
