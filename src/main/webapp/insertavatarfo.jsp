<%-- 
    Document   : insertavatar
    Created on : 9 févr. 2018, 02:39:25
    Author     : user
--%>

<%@page import="objectmini.Avatar"%>
<%@page import="DAO.AvatarDAO"%>
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

<%
    String nom=request.getParameter("nom");
    String user=request.getParameter("user");
    String gout=request.getParameter("gout");
    String caractere=request.getParameter("caractere");
    String message=request.getParameter("message");
    String requete=request.getParameter("requete");
    Double humeur = Double.parseDouble(request.getParameter("humeur"));
    Double attention = Double.parseDouble(request.getParameter("attention"));
    Double pa = Double.parseDouble(request.getParameter("pa"));
    Double img = Double.parseDouble(request.getParameter("img"));
    
    AvatarDAO avt=new AvatarDAO();

    try {
           
        avt.insertAvatar(nom, user, gout, caractere, message, requete, humeur, attention, pa,img);
        
    } catch (MongoException e) {
        e.getMessage();
    }
    
    response.sendRedirect("http://localhost:8084/Minibrofrontoffice0/MenuAvatar.jsp");
%>