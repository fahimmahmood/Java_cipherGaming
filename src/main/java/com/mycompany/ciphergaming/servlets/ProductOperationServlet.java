/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.ciphergaming.servlets;

import com.mycompany.ciphergaming.dao.CategoryDao;
import com.mycompany.ciphergaming.dao.ProductDao;
import com.mycompany.ciphergaming.entities.Category;
import com.mycompany.ciphergaming.entities.Product;
import com.mycompany.ciphergaming.helper.FactoryProvider;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {

            String op = request.getParameter("operation");

            if (op.trim().equals("addCategory")) {

                String title = request.getParameter("catTitle");
                String description = request.getParameter("catDescription");

                Category category = new Category();
                category.setCategoryTitle(title);
                category.setCategoryDescription(description);

                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                int catId = -1;
                catId = categoryDao.saveCategory(category);
                if (catId != -1) {
                    HttpSession httpsession = request.getSession();
                    httpsession.setAttribute("message", title + " added to Categories successfully");
                    response.sendRedirect("admin.jsp");
                    return;
                }
            } else if (op.trim().equals("addProduct")) {
                String pName = request.getParameter("pName");
                String pDesc = request.getParameter("pDesc");
                int pPrice = Integer.parseInt(request.getParameter("pPrice"));
                int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
                int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
                int catId = Integer.parseInt(request.getParameter("catId"));
                Part part = request.getPart("pPic");

                Product p = new Product();

                p.setpName(pName);
                p.setpDesc(pDesc);
                p.setpDiscount(pDiscount);
                p.setpPrice(pPrice);
                p.setpQuantity(pQuantity);
                p.setpPhoto(part.getSubmittedFileName());

                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                Category category = cdao.getCategoryById(catId);
                p.setCategory(category);

//              
                ProductDao pDao = new ProductDao(FactoryProvider.getFactory());
                int pId = -1;
                pId = pDao.saveProduct(p);

                if (pId != -1) {
                    HttpSession httpsession = request.getSession();
                    httpsession.setAttribute("message", pName + " added as a product to " + category.getCategoryTitle() + " category successfully");
                    response.sendRedirect("admin.jsp");
                    return;
                }

            }

        }
    }

    public ProductOperationServlet() {
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