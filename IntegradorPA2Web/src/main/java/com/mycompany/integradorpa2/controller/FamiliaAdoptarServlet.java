/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.integradorpa2.controller;

import com.mycompany.integradorpa2.logica.Familia;
import com.mycompany.integradorpa2.service.AdopcionService;
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
@WebServlet("/familia/adoptar")
public class FamiliaAdoptarServlet extends HttpServlet {

    private final AdopcionService adopcionService = new AdopcionService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtener familia logueada
        Familia f = (Familia) request.getSession().getAttribute("usuarioLogueado");

        if (f == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Lista de gatos disponibles
        request.setAttribute("listaGatos", adopcionService.listarGatosDisponibles());

        // Enviar al JSP
        request.getRequestDispatcher("/familia-adoptar.jsp")
                .forward(request, response);
    }
}
