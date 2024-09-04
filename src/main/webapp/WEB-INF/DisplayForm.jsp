<form action="${pageContext.request.contextPath}/servlet/ajout" method="post">
    <table>
        <tr><td class="borderless"><label for="nom">Nom</label></td><td class="borderless"><input type="text" id="nom" name="nom"></td></tr>
        <tr><td class="borderless"><label for="prenom">Prenom</label></td><td class="borderless"><input type="text" id="prenom" name="prenom"></td></tr>
        <tr><td class="borderless"><label for="naissance">Date de naissance</label></td><td class="borderless"><input type="date" id="naissance" name="naissance"></td></tr>
        <tr><td class="borderless" colspan="2"><button type="submit">Ajouter</button></td></tr>
    </table>
</form>