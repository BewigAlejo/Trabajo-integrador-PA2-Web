/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.integradorpa2.controller;

import com.mycompany.integradorpa2.dao.GatoDAO;
import com.mycompany.integradorpa2.dao.GatoDAOJpa;
import com.mycompany.integradorpa2.logica.EntradaHistorial;
import com.mycompany.integradorpa2.logica.Gato;
import com.mycompany.integradorpa2.service.SeguimientoVeterinarioService;
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
@WebServlet("/VeterinarioHistorialServlet")
public class VeterinarioHistorialServlet extends HttpServlet {

    private final GatoDAO gatoDao = new GatoDAOJpa();
    private final SeguimientoVeterinarioService historialService = new SeguimientoVeterinarioService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String id = req.getParameter("gatoId");

        if (id == null) {
            List<Gato> gatos = gatoDao.listarTodos();
            req.setAttribute("gatos", gatos);
            req.getRequestDispatcher("veterinario-historial.jsp").forward(req, resp);
            return;
        }

        Long gatoId = Long.parseLong(id);
        List<EntradaHistorial> entradas = historialService.listarEntradasPorGato(gatoId);

        req.setAttribute("listaEntradas", entradas);
        req.setAttribute("gatoId", gatoId);

        req.getRequestDispatcher("veterinario-historial-entradas.jsp").forward(req, resp);
    }
}

