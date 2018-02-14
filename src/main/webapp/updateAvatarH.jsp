<%-- 
    Document   : updateAvatarH
    Created on : 10 févr. 2018, 12:05:13
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
    Double humeur = Double.parseDouble(request.getParameter("humeur"));
    Double pa = Double.parseDouble(request.getParameter("pa"));
    
    AvatarDAO avt=new AvatarDAO();

    try {
           
        avt.updateAvatarH(nom, humeur, pa);
        
    } catch (MongoException e) {
        e.getMessage();
    }
    if(request.getParameter("web")!=null){
        response.sendRedirect("http://localhost:8084/Minibrofrontoffice0/GestionAvatar.jsp");
    }
%>
