/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Carrito;

import java.io.IOException;
import java.io.PrintWriter;
import static java.net.URLDecoder.decode;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;

/**
 *
 * @author mcabsan
 */
@WebServlet(name = "ProcesoCarrito", urlPatterns = {"/ProcesoCarrito"})
public class ProcesoCarrito extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            request.setCharacterEncoding("UTF-8");
            ArrayList<Libro> libros = new ArrayList();
            String[] checkboxes = request.getParameterValues("seleccion");
            String[] titulos = request.getParameterValues("titulo");
            String[] precios = request.getParameterValues("precio");
            String[] cantidades = request.getParameterValues("cantidad");
            
            if(checkboxes != null) {
                for (int i = 0, len = checkboxes.length; i < len; i++) {
                    int indice = Integer.parseInt(checkboxes[i]);
                    float precio = Float.parseFloat(precios[indice]);
                    int cantidad = Integer.parseInt(cantidades[indice]);
                    String titulo = titulos[indice];
                    Libro l = new Libro(indice, titulo, precio, cantidad);
                    libros.add(l);
                }
            }
            if (!libros.isEmpty()) {
                HttpSession session = request.getSession(true);
                session.setAttribute("factura", libros);
            }
            response.sendRedirect("preview.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
