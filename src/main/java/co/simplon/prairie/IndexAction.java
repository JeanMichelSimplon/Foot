package co.simplon.prairie;

import jodd.madvoc.meta.Action;
import jodd.madvoc.meta.MadvocAction;
import jodd.madvoc.meta.Out;

import java.util.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import oracle.jdbc.OracleDriver;
@MadvocAction
public class IndexAction
{
    static String databaseUrl = "jdbc:oracle:thin:simplon/simplon@localhost:1521:xe"; 
    static String requeteSql1 = "select NAME from TEAMS where CITY = 'San Francisco'";
   @Out
   String nom;
   @Action("/")
   public String view() throws Exception
   {
        DriverManager.registerDriver(new OracleDriver());
        Connection connexion = DriverManager.getConnection(databaseUrl);
        Statement requete = connexion.createStatement();
        ResultSet resultat = requete.executeQuery(requeteSql1);
        while (resultat.next())
        {
            nom = resultat.getString("NAME");
        }
        resultat.close();        
        requete.close();        
        return "/index";      
   }
}   