/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.integradorpa2.controller;

import com.mycompany.integradorpa2.logica.Familia;
import com.mycompany.integradorpa2.logica.Gato;
import com.mycompany.integradorpa2.logica.enums.TipoAdopcion;
import com.mycompany.integradorpa2.service.AdopcionService;
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
@WebServlet("/familia/adoptar")
public class FamiliaAdoptarServlet extends HttpServlet {

    private final AdopcionService adopcionService = new AdopcionService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            List<Gato> gatos = adopcionService.listarGatosDisponibles();
            req.setAttribute("listaGatos", gatos);
        } catch (Exception e) {
            req.setAttribute("error", e.getMessage());
        }

        req.getRequestDispatcher("/familia-adoptar.jsp").forward(req, resp);
    }
}

