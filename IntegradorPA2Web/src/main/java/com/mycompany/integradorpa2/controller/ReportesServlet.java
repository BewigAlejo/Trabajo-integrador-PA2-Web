/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.integradorpa2.controller;

import com.mycompany.integradorpa2.dao.AdopcionDAO;
import com.mycompany.integradorpa2.dao.AdopcionDAOJpa;
import com.mycompany.integradorpa2.dao.GatoDAO;
import com.mycompany.integradorpa2.dao.GatoDAOJpa;
import com.mycompany.integradorpa2.dao.ZonaDAO;
import com.mycompany.integradorpa2.dao.ZonaDAOJpa;
import com.mycompany.integradorpa2.logica.Adopcion;
import com.mycompany.integradorpa2.logica.Gato;
import com.mycompany.integradorpa2.logica.enums.EstadoAdopcion;
import com.mycompany.integradorpa2.logica.enums.EstadoSalud;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Usuario
 */
@WebServlet("/ReportesServlet")
public class ReportesServlet extends HttpServlet {

    private final GatoDAO gatoDao = new GatoDAOJpa();
    private final AdopcionDAO adopcionDao = new AdopcionDAOJpa();
    private final ZonaDAO zonaDao = new ZonaDAOJpa();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        switch (action) {

            case "porZona": {
                req.setAttribute("zonas", zonaDao.listarTodos());
                req.setAttribute("gatos", gatoDao.listarTodos());
                req.getRequestDispatcher("rep-gatos-por-zona.jsp").forward(req, resp);
                break;
            }

            case "adoptados": {
                List<Adopcion> lista = adopcionDao.listarTodos().stream()
                        .filter(a -> a.getEstado() == EstadoAdopcion.APROBADA)
                        .toList();

                req.setAttribute("adoptados", lista);
                req.getRequestDispatcher("rep-gatos-adoptados.jsp").forward(req, resp);
                break;
            }

            case "esterilizados": {
                List<Gato> lista = gatoDao.listarTodos().stream()
                        .filter(g -> g.getEstadoDeSalud() == EstadoSalud.ESTERILIZADO)
                        .toList();

                req.setAttribute("gatos", lista);
                req.getRequestDispatcher("rep-gatos-esterilizados.jsp").forward(req, resp);
                break;
            }

            default:
                resp.sendRedirect("panel-voluntario.jsp");
        }
    }
}

