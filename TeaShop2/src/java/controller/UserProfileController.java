/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import dal.AdminDAO;
import entity.Accounts;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.HashMap;

/**
 *
 * @author Huyen Tranq
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50
)
public class UserProfileController extends HttpServlet {

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
            String service = request.getParameter("service");
            if (service == null) {
                service = "ViewProfile";
            }
            switch (service) {
                case "ViewProfile": {
                    AdminDAO dao = new AdminDAO();
                    String email = request.getParameter("email");
                    Accounts a = dao.getUserInfor(email);
                    request.setAttribute("a", a);
                    request.getRequestDispatcher("UserProfile.jsp").forward(request, response);
                }
                break;
                case "UpdateProfile": {
                    AccountDAO accountDAO = new AccountDAO();
                    String fullName = request.getParameter("fullName");
                    String phoneNumber = request.getParameter("phoneNumber");
                    String email = request.getParameter("email");
                    String address = request.getParameter("address");
                    int check = accountDAO.updateProfile(fullName, phoneNumber, email, address);
                    if (check > 0) {
                        AdminDAO dao = new AdminDAO();
                        Accounts a = dao.getUserInfor(email);
                        request.setAttribute("a", a);
                        request.setAttribute("message", "Update Successfully");
                        request.getRequestDispatcher("UserProfile.jsp").forward(request, response);
                    } else {
                        AdminDAO dao = new AdminDAO();
                        Accounts a = dao.getUserInfor(email);
                        request.setAttribute("a", a);
                        request.setAttribute("message", "Update Failed");
                        request.getRequestDispatcher("UserProfile.jsp").forward(request, response);
                    }
                }
                break;
                case "UpdateAvatar": {
                    AdminDAO dao = new AdminDAO();
                    String email = request.getParameter("email");
                    Accounts a = dao.getUserInfor(email);
                    String uploadedFilePath = null;

                    try {
                        Part filePart = request.getPart("img");
                        if (filePart != null && filePart.getSize() > 0) {
                            String fileName = getFileName(filePart);
                            if (!fileName.equals("unknown.jpg") && !fileName.isEmpty()) {
                                String savePath = getServletContext().getRealPath("/") + "img/";
                                File fileSaveDir = new File(savePath);
                                if (!fileSaveDir.exists()) {
                                    fileSaveDir.mkdirs(); // Tạo các thư mục con nếu chưa tồn tại
                                }
                                File file = new File(savePath + fileName);
                                try (InputStream fileContent = filePart.getInputStream()) {
                                    Files.copy(fileContent, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
                                    uploadedFilePath = "/img/" + fileName; // Đường dẫn để lưu vào cơ sở dữ liệu
                                    AccountDAO accountDAO = new AccountDAO();
                                    int rowsUpdated = accountDAO.updateAvatar(uploadedFilePath, email);
                                    if (rowsUpdated > 0) {
                                        request.setAttribute("a", a);
                                        request.setAttribute("updateAvtSuccess", "Update Avatar Successfully!");
                                    } else {
                                        request.setAttribute("a", a);
                                        request.setAttribute("updateAvtFailed", "Update Avatar Failed!");
                                    }

                                    request.getRequestDispatcher("UserProfile.jsp").forward(request, response);
                                } catch (IOException ex) {
                                    ex.printStackTrace();
                                }
                            }
                        }
                    } catch (IOException | ServletException ex) {
                        ex.printStackTrace();
                    }
                }
                break;

                case "UpdatePassword": {
                    HashMap<String, String> errorsList = new HashMap<>();
                    AdminDAO dao = new AdminDAO();
                    AccountDAO accountDAO = new AccountDAO();
                    String email = request.getParameter("email");
                    Accounts a = dao.getUserInfor(email);
                    if (a == null) {
                        errorsList.put("userNotFound", "User not found with email: " + email);
                        request.setAttribute("errorsList", errorsList);
                        request.getRequestDispatcher("UserProfile.jsp").forward(request, response);
                        return;
                    }
                    String oldPassword = request.getParameter("oldpass");
                    String newPassword = request.getParameter("newpass");
                    String reNewPassword = request.getParameter("re_newpass");
                    if (!oldPassword.equals(a.getPass_word())) {
                        errorsList.put("wrongOldPass", "You Input Wrong Password !");
                    }
                    if (!newPassword.equals(reNewPassword)) {
                        errorsList.put("wrongNewPass", "Re-password is different with new password");
                    }
                    if (!errorsList.isEmpty()) {
                        request.setAttribute("errorsList", errorsList);
                        request.setAttribute("a", a);
                        request.getRequestDispatcher("UserProfile.jsp").forward(request, response);
                    } else {
                        int check = accountDAO.updatePassword(newPassword, email);
                        System.out.println(check);
                        if (check > 0) {
                            request.setAttribute("updateSuccess", "Update Password Successfully!");
                            request.setAttribute("a", a);
                            request.getRequestDispatcher("UserProfile.jsp").forward(request, response);
                        } else {
                            request.setAttribute("updateFailed", "Update Password Failed!");
                            request.setAttribute("a", a);
                            request.getRequestDispatcher("UserProfile.jsp").forward(request, response);
                        }
                    }
                }
                break;

            }
        }

    }

    private String getFileName(final Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
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