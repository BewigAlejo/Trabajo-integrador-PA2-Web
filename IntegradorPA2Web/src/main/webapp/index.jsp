<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Happy Paws - Colonia de Gatos Callejeros</title>

    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"></script>

    <style>
        .dash-img {
            width: 100%;
            height: 260px;
            object-fit: cover;
            border-radius: 12px;
            margin-bottom: 25px;
        }

        .row-center {
            display: flex;
            justify-content: center;
            gap: 60px;
            margin-top: 40px;
        }

        .action-btn {
            width: 220px;
            height: 55px;
            font-size: 18px;
            border-radius: 10px;
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
                            <div class="sb-nav-link-icon"><i class="fas fa-paw"></i></div>
                            Inicio
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

                <h1 class="mt-4">Happy Paws</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">Colonia de gatos callejeros</li>
                </ol>

                <!-- IMÁGENES GRANDES -->
                <div class="row row-center">
                    <div class="col-xl-4 col-md-5 text-center">
                        <img src="img/gatitos4.jpg" class="dash-img">
                    </div>

                    <div class="col-xl-4 col-md-5 text-center">
                        <img src="img/gatitos5.jpg" class="dash-img">
                    </div>
                </div>

                <!-- BOTONES PRINCIPALES -->
                <div class="row row-center mt-4">
                    <button class="btn btn-primary action-btn"
                        onclick="location.href='<%= request.getContextPath() %>/LoginServlet'">
                        Iniciar Sesión
                    </button>

                    <button class="btn btn-success action-btn"
                        onclick="location.href='<%= request.getContextPath() %>/RegisterServlet'">
                        Registrarse
                    </button>
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
