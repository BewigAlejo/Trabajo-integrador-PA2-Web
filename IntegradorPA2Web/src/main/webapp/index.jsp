<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Dashboard - Colonia de Gatos</title>

    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"></script>

    <style>
        .dash-img {
            width: 100%;
            height: 220px;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 15px;
        }

        .dash-card {
            cursor: pointer;
            border-radius: 10px;
            text-align: center;
        }

        .row-center {
            display: flex;
            justify-content: center;
            gap: 40px;
        }
    </style>
</head>

<body class="sb-nav-fixed">

    <!-- NAVBAR ESPECIAL DEL INDEX -->
    <jsp:include page="partials/navbar-index.jsp" />

    <div id="layoutSidenav">

        <!-- SIDEBAR ORIGINAL -->
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark">
                <div class="sb-sidenav-menu">
                    <div class="nav">

                        <div class="sb-sidenav-menu-heading">Panel</div>
                        <a class="nav-link" href="index.jsp">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            Dashboard
                        </a>

                        <div class="sb-sidenav-menu-heading">Opciones</div>
                        <a class="nav-link" href="LoginServlet">
                            <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
                            Iniciar Sesión
                        </a>

                    </div>
                </div>

                <div class="sb-sidenav-footer">
                    Proyecto Integrador PA2
                </div>
            </nav>
        </div>

        <!-- CONTENIDO PRINCIPAL -->
        <div id="layoutSidenav_content">
            <main class="container-fluid px-4">

                <h1 class="mt-4">Dashboard</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">Panel Principal</li>
                </ol>

                <!-- TARJETAS CENTRADAS -->
                <div class="row row-center">

                    <!-- Gatos Registrados -->
                    <div class="col-xl-3 col-md-4 text-center">
                        <img src="img/gatitos4.jpg" class="dash-img">

                        <div class="card bg-primary text-white mb-4 dash-card"
                             onclick="location.href='<%= request.getContextPath() %>/GatosRegistradosServlet'">
                            <div class="card-body">Gatos Registrados</div>
                        </div>
                    </div>

                    <!-- Adopciones -->
                    <div class="col-xl-3 col-md-4 text-center">
                        <img src="img/gatitos5.jpg" class="dash-img">

                        <div class="card bg-success text-white mb-4 dash-card"
                             onclick="location.href='<%= request.getContextPath() %>/AdopcionesServlet'">
                            <div class="card-body">Adopciones</div>
                        </div>
                    </div>

                    <!-- Veterinarios Activos -->
                    <div class="col-xl-3 col-md-4 text-center">
                        <img src="img/gatitos6.jpg" class="dash-img">

                        <div class="card bg-danger text-white mb-4 dash-card"
                             onclick="location.href='<%= request.getContextPath() %>/VeterinariosActivosServlet'">
                            <div class="card-body">Veterinarios Activos</div>
                        </div>
                    </div>

                </div>

            </main>

            <footer class="py-4 bg-light mt-auto text-center">
                <div class="container-fluid">
                    Colonia de Gatos © 2025
                </div>
            </footer>

        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/scripts.js"></script>

</body>

</html>
