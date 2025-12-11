/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.integradorpa2.controller;

import com.mycompany.integradorpa2.dao.GatoDAO;
import com.mycompany.integradorpa2.dao.GatoDAOJpa;
import com.mycompany.integradorpa2.logica.Gato;
import com.mycompany.integradorpa2.logica.Veterinario;
import com.mycompany.integradorpa2.service.SeguimientoVeterinarioService;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Usuario
 */
@WebServlet("/VeterinarioGenerarEntradaServlet")
public class VeterinarioGenerarEntradaServlet extends HttpServlet {

    private final SeguimientoVeterinarioService historialService = new SeguimientoVeterinarioService();
    private final GatoDAO gatoDao = new GatoDAOJpa();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        Long idGato = Long.parseLong(req.getParameter("idGato"));
        Gato g = gatoDao.buscarPorId(idGato).orElse(null);

        req.setAttribute("gato", g);
        req.getRequestDispatcher("veterinario-generar-entrada.jsp").forward(req, resp);
    }

        @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            Long gatoId = Long.parseLong(req.getParameter("gatoId"));
            String diag = req.getParameter("diagnostico");
            String trat = req.getParameter("tratamiento");

            // obtener veterinario logueado
            Veterinario vet = (Veterinario) req.getSession().getAttribute("usuarioLogueado");
            if (vet == null) {
                throw new IllegalStateException("No hay veterinario logueado.");
            }

            // llamar al service correctamente
            historialService.registrarEntrada(
                    gatoId,
                    vet.getId(),
                    diag,
                    trat,
                    null,         // estudios (en desktop no se usa)
                    false         // aptoAdopcion (solo certificado usa true)
            );

            resp.sendRedirect("panel-veterinario.jsp");

        } catch (Exception ex) {
            ex.printStackTrace();
            req.setAttribute("error", ex.getMessage());
            req.getRequestDispatcher("veterinario-generar-entrada.jsp").forward(req, resp);
        }
    }

}

