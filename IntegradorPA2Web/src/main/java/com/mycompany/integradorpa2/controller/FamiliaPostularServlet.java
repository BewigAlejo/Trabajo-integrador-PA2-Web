package com.mycompany.integradorpa2.controller;

import com.mycompany.integradorpa2.logica.Familia;
import com.mycompany.integradorpa2.logica.enums.TipoAdopcion;
import com.mycompany.integradorpa2.service.AdopcionService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;



@WebServlet("/familia/postular")
public class FamiliaPostularServlet extends HttpServlet {

    private final AdopcionService adopcionService = new AdopcionService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            Long gatoId = Long.parseLong(req.getParameter("id"));

            Familia familia = (Familia) req.getSession().getAttribute("usuarioLogueado");
            if (familia == null) {
                resp.sendRedirect("../login.jsp");
                return;
            }

            adopcionService.postularFamiliaAGato(
                    gatoId,
                    familia.getId(),
                    TipoAdopcion.DEFINITIVA,
                    "Postulación desde web"
            );

            req.setAttribute("msg", "Te postulaste correctamente.");

        } catch (Exception e) {
            req.setAttribute("error", "Error al postularse: " + e.getMessage());
        }

        
        req.setAttribute("listaGatos", adopcionService.listarGatosDisponibles());

        req.getRequestDispatcher("/familia-adoptar.jsp").forward(req, resp);
    }
}

