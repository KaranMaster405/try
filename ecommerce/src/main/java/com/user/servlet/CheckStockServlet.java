//import java.io.IOException;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import com.entity.BookDtls;
//import com.DAO.BookDAO;
//import com.DAO.BookDAOImpl;
//import com.DB.DBConnect;
//
//@WebServlet("/CheckStockServlet")
//public class CheckStockServlet extends HttpServlet {
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        
//        try {
//            int id = Integer.parseInt(request.getParameter("book_Id"));
//
//            // Use DAO to get book details
//            BookDAO bookDAO = new BookDAOImpl(DBConnect .getconn());
//            BookDtls b = bookDAO.getBookById(id);
//
//            if (b == null) {
//                response.getWriter().println("Book not found.");
//                return; // Stop further execution
//            }
//
//            request.setAttribute("book", b);
//
//            if (b.isOutOfStock()) {
//                request.getRequestDispatcher("outOfStock.jsp").forward(request, response);
//            } else {
//                request.getRequestDispatcher("bookAvailable.jsp").forward(request, response);
//            }
//        } catch (NumberFormatException e) {
//            response.getWriter().println("Invalid book ID.");
//        } catch (Exception e) {
//            e.printStackTrace();
//            response.getWriter().println("An error occurred while checking stock.");
//        }
//    }
//}
