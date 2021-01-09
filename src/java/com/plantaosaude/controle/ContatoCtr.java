/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.plantaosaude.controle;

import com.plantaosaude.dao.ContatoDao;
import com.plantaosaude.modelo.Contato;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.mail.SimpleEmail;

/**
 *
 * @author neto
 */
@WebServlet(name = "ContatoCtr", urlPatterns = {"/ContatoCtr"})
public class ContatoCtr extends HttpServlet {

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
        
         try{
            Contato contato = new Contato();
            contato.setNome(request.getParameter("nome"));
            contato.setTelefone(request.getParameter("telefone"));
            contato.setEmail(request.getParameter("email"));
            contato.setMensagem(request.getParameter("mensagem"));
            contato.setData(new Date());
            
            ContatoDao contatoDAO = new ContatoDao();
            contatoDAO.cadastrar(contato);
            
            SimpleEmail enviarEmail = new SimpleEmail();
            enviarEmail.setHostName("server22.integrator.com.br"); // o servidor SMTP para envio do e-mail
            enviarEmail.addTo("i9desenvolvimento@i9desenvolvimento.com", "i9 Desenvolvimento"); //destinatário
            enviarEmail.setFrom("i9desenvolvimento@i9desenvolvimento.com","Plantão Saúde - Contato"); // remetente
            enviarEmail.setSubject("Contato - Plantão Saúde");
            enviarEmail.setMsg("Nome: " + contato.getNome() + "\n" +
                               "Telefone: " + contato.getTelefone() + "\n" +
                               "E-mail: " + contato.getEmail() + "\n" +
                               "Mensagem: " + contato.getMensagem());
            enviarEmail.setAuthentication("i9desenvolvimento@i9desenvolvimento.com", "shelter2013");
            enviarEmail.setSmtpPort(465);
            enviarEmail.setSSL(true);
            enviarEmail.setTLS(true);
            enviarEmail.send();
            
            request.setAttribute("mensagem", "Mensagem enviada!");
            request.getRequestDispatcher("contato.jsp").forward(request, response);
        }catch(Exception e){
            System.out.println("Erro ao enviar e-mail " + e.getMessage());
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
