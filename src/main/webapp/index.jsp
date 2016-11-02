<%@ page import="java.util.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="oracle.jdbc.OracleDriver" %>
<%@ page import="java.sql.*" %>
<html>
<h1>Mon application Web en Java</h1>
<body>
Nom de l'Equipe de San fransisco :<BR><BR><table border="1"><tr><td>${nom}</td></tr></table><br><br>
Joueurs de l'équipe de ${nom} trié par date de naissance, jouant en position de "Catcher" et ayant un poids >= à 220 :<BR>

          <% String databaseUrl = "jdbc:oracle:thin:simplon/simplon@localhost:1521:xe"; %>
          <% String requeteSql = "select FNAME,LNAME from players where team_id = (select id from TEAMS where CITY = 'San Francisco') And POSITION ='Catcher' AND WEIGHT >= 220 order by DOB"; %>
	      <% DriverManager.registerDriver(new OracleDriver()); %>
	      <% Connection connexion = DriverManager.getConnection(databaseUrl); %>
	      <% Statement requete = connexion.createStatement(); %>
	      <% ResultSet resultat = requete.executeQuery(requeteSql); %>
	      <BR>
	      	<table border="1">
	      	<tr><td align="center"><b>Prénom</b></td><td align="center"><b>Nom</b></td></tr>
		      <%while(resultat.next()) {
		          String fnom = resultat.getString("FNAME");
		          String lnom = resultat.getString("LNAME");%>
	           	<tr><td><%out.println(fnom);%></td><td><%out.println(lnom);%></td></tr>
		       <%
		   }
		   %>
	       </table>
</body>
</html>