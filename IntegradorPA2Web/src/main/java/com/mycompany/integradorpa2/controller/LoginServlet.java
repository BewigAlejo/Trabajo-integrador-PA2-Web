package com.mycompany.integradorpa2.controller;

import com.mycompany.integradorpa2.dao.FamiliaDAOJpa;
import com.mycompany.integradorpa2.dao.VeterinarioDAOJpa;
import com.mycompany.integradorpa2.dao.VoluntarioDAOJpa;
import com.mycompany.integradorpa2.logica.Familia;
import com.mycompany.integradorpa2.logica.Veterinario;
import com.mycompany.integradorpa2.logica.Voluntario;
import java.io.IOException;
import java.util.Optional;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Cuando entren directo al servlet por GET, los mando al login
        response.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        // 1) Leer parámetros del formulario
        String usuario = request.getParameter("usuario");
        String pass    = request.getParameter("password");
        String rol     = request.getParameter("rol"); // VETERINARIO / VOLUNTARIO / FAMILIA
        
        
        
        // 2) Validaciones básicas (equivalente a los JOptionPane)
        if (usuario == null || usuario.trim().isEmpty()
                || pass == null || pass.trim().isEmpty()) {

            request.setAttribute("error", "Completá usuario y contraseña.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        if (rol == null || rol.isEmpty()) {
            request.setAttribute("error", "Seleccioná un rol (Veterinario / Voluntario / Familia).");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        usuario = usuario.trim();
;

        try {
            boolean loginOk = false;
            String destino = "login.jsp";  // por defecto, si algo falla

            HttpSession sesion = request.getSession();

            switch (rol) {
                case "VETERINARIO": {
                    VeterinarioDAOJpa dao = new VeterinarioDAOJpa();
                    Optional<Veterinario> opt = dao.buscarPorUsuarioYPassword(usuario, pass);

                    if (opt.isPresent()) {
                        Veterinario v = opt.get();
                        // guardamos en sesión para usarlo en los paneles
                        sesion.setAttribute("usuarioLogueado", v);
                        sesion.setAttribute("rol", "VETERINARIO");
                        destino = "panel-veterinario.jsp";  // JSP que vos crees
                        loginOk = true;
                    } else {
                        request.setAttribute("error", "Credenciales inválidas para Veterinario.");
                    }
                    break;
                }

                case "VOLUNTARIO": {
                    VoluntarioDAOJpa dao = new VoluntarioDAOJpa();
                    Optional<Voluntario> opt = dao.buscarPorUsuarioYPassword(usuario, pass);

                    if (opt.isPresent()) {
                        Voluntario vol = opt.get();
                        sesion.setAttribute("usuarioLogueado", vol);
                        sesion.setAttribute("rol", "VOLUNTARIO");
                        destino = "panel-voluntario.jsp";
                        loginOk = true;
                    } else {
                        request.setAttribute("error", "Credenciales inválidas para Voluntario.");
                    }
                    break;
                }

                case "FAMILIA": {
                    FamiliaDAOJpa dao = new FamiliaDAOJpa();
                    Optional<Familia> opt = dao.buscarPorUsuarioYPassword(usuario, pass);

                    if (opt.isPresent()) {
                        Familia f = opt.get();
                        sesion.setAttribute("usuarioLogueado", f);
                        sesion.setAttribute("rol", "FAMILIA");

                        destino = "panel-familia.jsp";  // 🚀 ACÁ y nada más
                        loginOk = true;
                    } else {
                        request.setAttribute("error", "Credenciales inválidas para Familia.");
                    }
                    break;
                }


                default:
                    request.setAttribute("error", "Rol no reconocido.");
            }

            // 3) Navegación: si login OK redirigimos, si no volvemos al login
            if (loginOk) {
                // redirect para cambiar de URL en el navegador
                response.sendRedirect(destino);
            } else {
                // volvemos al login mostrando el mensaje de error
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("error",
                    "Ocurrió un error al iniciar sesión: " + ex.getMessage());
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
