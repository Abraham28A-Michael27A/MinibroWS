<%-- 
    Document   : insertusermobile
    Created on : 13 févr. 2018, 20:39:35
    Author     : user
--%>

<%@page import="DAO.UserDAO"%>
<%@page import="java.sql.*"%>
<%@page import="java.lang.*"%>
<%@page import="java.util.*"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.MongoException"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="com.mongodb.QueryBuilder"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="connectdbm.ConnectionDBM"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="functions.JsonReader"%>

<%
    String nom=request.getParameter("nom");
    String prenom=request.getParameter("prenom");
    String mail=request.getParameter("mail");
    String pseudo=request.getParameter("pseudo");
    String mdp=request.getParameter("mdp");
    String q1=request.getParameter("q1");
    String r1=request.getParameter("r1");
    
    
    UserDAO avt=new UserDAO();

    try {
           
        avt.insertUsers(nom, prenom, mail, pseudo, mdp, q1,  r1);
        
    } catch (MongoException e) {
        e.getMessage();
    }
    response.setHeader("Access-Control-Allow-Origin", "*");
%>
