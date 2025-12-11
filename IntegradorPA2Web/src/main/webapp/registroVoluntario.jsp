<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Registro de Voluntario</title>

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
                                <h3 class="text-center my-3">Registro de Voluntario</h3>
                            </div>

                            <div class="card-body">

                                <c:if test="${not empty error}">
                                    <div class="alert alert-danger text-center">${error}</div>
                                </c:if>

                                <form action="RegistroVoluntarioServlet" method="POST">

                                    <!-- Disponibilidad -->
                                    <div class="mb-3">
                                        <label class="form-label">Disponibilidad</label>
                                        <select name="disponibilidad" class="form-control">
                                            <option value="ALTA">Alta</option>
                                            <option value="MEDIA">Media</option>
                                            <option value="BAJA">Baja</option>
                                            <option value="NO_DISPONIBLE">No disponible</option>
                                        </select>
                                    </div>

                                    <!-- Experiencia -->
                                    <div class="mb-3">
                                        <label class="form-label">Experiencia</label>
                                        <select name="experiencia" class="form-control">
                                            <option value="NOVATO">Novato</option>
                                            <option value="INTERMEDIO">Intermedio</option>
                                            <option value="AVANZADO">Avanzado</option>
                                            <option value="EXPERTO">Experto</option>
                                        </select>
                                    </div>

                                    <div class="d-grid mt-4">
                                        <button class="btn btn-primary btn-block" type="submit">Registrarse</button>
                                    </div>

                                </form>

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
