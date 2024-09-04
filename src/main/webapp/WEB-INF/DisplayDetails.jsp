<jsp:useBean id="id" type="java.lang.String" scope="request"/>
<jsp:useBean id="nom" type="java.lang.String" scope="request"/>
<jsp:useBean id="prenom" type="java.lang.String" scope="request"/>
<jsp:useBean id="naissance" type="java.lang.String" scope="request"/>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body>

<table>
    <tr><th>id</th><th>Nom</th><th>Prenom</th><th>Date de naissance</th></tr>
    <tr><td>${id}</td><td>${nom}</td><td>${prenom}</td><td>${naissance}</td></tr>
</table>

<a href="${pageContext.request.contextPath}/servlet/liste-patients" class="button">Retour</a>

</body>
</html>