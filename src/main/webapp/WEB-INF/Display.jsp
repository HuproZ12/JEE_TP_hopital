<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Temp.Patient" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
List<Patient> patients = (List<Patient>) request.getAttribute("patients");
String recherche = (request.getAttribute("recherche") != null) ? (String) request.getAttribute("recherche") : "";

List<Patient> filteredPatients = new ArrayList();
if (!recherche.isEmpty()) {
    for (Patient patient : patients) {
        if (patient.getNom().toLowerCase().equals(recherche.toLowerCase())) {
//        if (patient.toString().toLowerCase().contains(recherche.toLowerCase())) {
            filteredPatients.add(patient);
        }
    }
}else {
    filteredPatients = patients;
}
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body>

<h1>Liste des patients</h1>

<img src="images/redcross.png" alt="test">

<form action="${pageContext.request.contextPath}/servlet/recherche" method="post">
    <ul>
        <li><label for="recherche">Rechercher un patient : </label><input type="text" id="recherche" name="recherche" value=<%= recherche%>></li>
        <li><button type="submit">Valider</button></li>
    </ul>
</form>

<c:import url="/WEB-INF/DisplayForm.jsp" />

<div>
<%if (filteredPatients == null || filteredPatients.isEmpty()) {
    if (recherche.equals("")){%>
        <p>Aucun patient dans la liste</p>
    <%}else{%>
        <p>Aucun patient ne correspond a la recherche</p>
    <%}
}else{%>
    <table>
        <tr><th class="borderless"/><th>Nom</th><th>Prenom</th><th>Details</th></tr>
        <%for(Patient patient : filteredPatients){%>
            <tr>
                <td class="borderless">
                    <form action="${pageContext.request.contextPath}/servlet/supprimer?patient=<%=patient.getId()%>" method="post">
                        <input type="image" src="images/redcross.png" width="100%" height="100%">
                    </form>
                </td>
                <td><%=patient.getNom()%></td><td><%=patient.getPrenom()%></td><td><a href="${pageContext.request.contextPath}/servlet/details?patient=<%=patient.toString()%>">ici</a></td>
            </tr>
        <%}%>
    </table>
<%}%>
</div>

</body>
</html>