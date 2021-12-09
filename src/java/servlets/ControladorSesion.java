/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Adicionales.Encriptacion;
import Adicionales.ValidacionSesion;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.entidad.Usuarios;


public class ControladorSesion extends HttpServlet {

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
            RequestDispatcher despachador = null;
            String pagina = request.getServletPath();
            ValidacionSesion sesion = new ValidacionSesion();
            Usuarios user = new Usuarios();

            if (pagina.equals("/IniciarSesion.do")) {

                String usuario = request.getParameter("username");
                String pass = request.getParameter("pass");
                String encri = Encriptacion.getStringMessageDigest(pass, Encriptacion.MD5);
                out.print(encri);
                if (usuario.isEmpty() && pass.isEmpty()) {
                    despachador = request.getRequestDispatcher("Login.jsp");
                } else {
                    user = sesion.validasesion(usuario, pass);
                    if (user != null) {

                        /*variables de sesion*/
                        HttpSession nueva_sesion = request.getSession();
                        HttpSession nueva_sesion1 = request.getSession();
                        HttpSession nueva_sesion2 = request.getSession();
                        HttpSession nueva_sesion3 = request.getSession();
                        /*datos necesarios del usuario para la sesion de ingreso*/
                        nueva_sesion.setAttribute("user", user.getUsuario());
                        nueva_sesion1.setAttribute("nomuser", (user.getEmpleado().getNombres() + " " + user.getEmpleado().getApellidos()));
                        nueva_sesion2.setAttribute("iduser", user.getEmpleado().getIdempleado());
                        nueva_sesion3.setAttribute("tipo", user.getEmpleado().getCargos().getNombre());

                        despachador = request.getRequestDispatcher("index.jsp");
                    } else {
                        despachador = request.getRequestDispatcher("Login.jsp");
                    }
                }

            }
            despachador.forward(request, response);
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
