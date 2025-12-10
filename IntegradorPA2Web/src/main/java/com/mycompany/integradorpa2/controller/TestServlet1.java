/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.integradorpa2.controller;

import com.mycompany.integradorpa2.logica.Gato;
import com.mycompany.integradorpa2.service.GatoService;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Usuario
 */
@WebServlet("/TestServlet")
public class TestServlet1 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        resp.setContentType("text/plain;charset=UTF-8");
        PrintWriter out = resp.getWriter();

        out.println("Probando JPA...");
        
        
        try {
            GatoService service = new GatoService();
            List<Gato> lista = service.listarTodos();

            out.println("Conexión OK!");
            out.println("Cantidad de gatos: " + lista.size());
            
        } catch (Exception ex) {
            out.println("ERROR:");
            ex.printStackTrace(out);
        }
    }
}
