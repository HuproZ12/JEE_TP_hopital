package Temp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "/servlet", value = "/servlet/*")
public class Servlet extends HttpServlet {
    Session session;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        switch(req.getPathInfo()) {
            case "/liste-patients":
                session = Util.getSession();
                List<Patient> patients = session.createQuery("from Patient ").list();
                Util.closeSession(session);
                req.setAttribute("patients", patients);
                if(req.getParameter("recherche") != null){
                    req.setAttribute("recherche", req.getParameter("recherche"));
                }
                req.getRequestDispatcher("/WEB-INF/Display.jsp").forward(req, resp);
                break;
            case "/details":
                String patientObjet = req.getParameter("patient"); // "Patient(id=1, nom=dut, prenom=hug, naissance=2018-07-15)"
                patientObjet = patientObjet.substring(8, patientObjet.length() - 1);
                String[] pairs = patientObjet.split(", ");
                for (String pair : pairs) {
                    String[] cleValeur = pair.split("=");
                    req.setAttribute(cleValeur[0], cleValeur[1]);
                }
                req.getRequestDispatcher("/WEB-INF/DisplayDetails.jsp").forward(req, resp);
                break;
            case "/connexion":
//                req.getSession().setAttribute("isLogged",true);
//                resp.sendRedirect(req.getServletContext().getContextPath() + "/servlet/liste-patients");
                req.getRequestDispatcher("/WEB-INF/Connexion.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        switch(req.getPathInfo()) {
            case "/ajout":
                String nom = req.getParameter("nom");
                String prenom = req.getParameter("prenom");
                String naissance = req.getParameter("naissance");
                session = Util.getSession();
                session.beginTransaction();
                Patient patient = new Patient.PatientBuilder().nom(nom).prenom(prenom).naissance(naissance).build();
                session.save(patient);
                session.getTransaction().commit();
                Util.closeSession(session);
                resp.sendRedirect(req.getServletContext().getContextPath() + "/servlet/liste-patients");
                break;
            case "/recherche":
                String recherche = req.getParameter("recherche");
                resp.sendRedirect(req.getServletContext().getContextPath() + "/servlet/liste-patients?recherche=" + recherche);
                break;
            case "/supprimer":
                int id = Integer.parseInt(req.getParameter("patient"));
                session = Util.getSession();
                session.beginTransaction();
                session.createQuery("DELETE FROM Patient WHERE id = :id").setParameter("id", id).executeUpdate();
                session.getTransaction().commit();
                Util.closeSession(session);
                resp.sendRedirect(req.getServletContext().getContextPath() + "/servlet/liste-patients");
                break;
            case "/connexion":
                req.getSession().setAttribute("isLogged",true);
                resp.sendRedirect(req.getServletContext().getContextPath() + "/servlet/liste-patients");
                break;
        }
    }
}