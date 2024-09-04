<form action="${pageContext.request.contextPath}/servlet/ajout" method="post">
    <ul>
        <li><label for="nom">Nom</label><input type="text" id="nom" name="nom"></li>
        <li><label for="prenom">Prenom</label><input type="text" id="prenom" name="prenom"></li>
        <li><label for="naissance">Date de naissance</label><input type="date" id="naissance" name="naissance"></li>
        <li><button type="submit">Ajouter</button></li>
    </ul>
</form>