/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.integradorpa2.controller;

import com.mycompany.integradorpa2.dao.GatoDAO;
import com.mycompany.integradorpa2.dao.GatoDAOJpa;
import com.mycompany.integradorpa2.logica.Gato;
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
@WebServlet("/VeterinarioConsultaServlet")
public class VeterinarioConsultaServlet extends HttpServlet {

    private final GatoDAO gatoDao = new GatoDAOJpa();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<Gato> gatos = gatoDao.listarTodos();
        req.setAttribute("gatos", gatos);
        req.getRequestDispatcher("veterinario-consulta.jsp").forward(req, resp);
    }
}

