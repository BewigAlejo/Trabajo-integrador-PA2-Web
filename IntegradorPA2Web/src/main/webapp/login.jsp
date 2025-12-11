<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Login</title>
    <link href="css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="bg-primary">
<div id="layoutAuthentication">
    <div id="layoutAuthentication_content">
        <main>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-5">

                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header">
                                <h3 class="text-center my-4">Iniciar sesión</h3>
                            </div>

                            <div class="card-body">

                                <!-- MENSAJE DE ERROR -->
                                <% if (request.getAttribute("error") != null) { %>
                                    <div class="alert alert-danger text-center">
                                        <%= request.getAttribute("error") %>
                                    </div>
                                <% } %>

                                <form method="POST" action="LoginServlet">

                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="inputUser" 
                                               name="usuario" type="text" placeholder="Usuario" />
                                        <label for="inputUser">Usuario</label>
                                    </div>

                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="inputPassword" 
                                               name="password" type="password" placeholder="Contraseña" />
                                        <label for="inputPassword">Contraseña</label>
                                    </div>

                                    <!-- SELECTOR DE ROL -->
                                    <div class="form-floating mb-3">
                                        <select class="form-control" name="rol" id="inputRol">
                                            <option value="">Seleccione un rol</option>
                                            <option value="VETERINARIO">Veterinario</option>
                                            <option value="VOLUNTARIO">Voluntario</option>
                                            <option value="FAMILIA">Familia</option>
                                        </select>
                                        <label for="inputRol">Rol</label>
                                    </div>

                                    <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                        <button class="btn btn-primary" type="submit">Ingresar</button>
                                    </div>

                                </form>

                            </div>

                            <div class="card-footer text-center py-3">
                                <div class="small">
                                    <a href="register.jsp">¿No tenés cuenta? Registrate</a>
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
