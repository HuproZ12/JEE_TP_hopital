<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body>

<form action="${pageContext.request.contextPath}/servlet/connexion" method="post">
    <table>
        <tr><td class="borderless"><label for="login">Login : </label></td><td class="borderless"><input type="text" id="login" name="login"></td></tr>
        <tr><td class="borderless"><label for="pwd">Mot de passe : </label></td><td class="borderless"><input type="text" id="pwd" name="pwd"></td></tr>
        <tr><td class="borderless" colspan="2"><button type="submit">Valider</button></td></tr>
    </table>
</form>

<a href="${pageContext.request.contextPath}/servlet/liste-patients" class="button">Retour</a>

</body>
</html>