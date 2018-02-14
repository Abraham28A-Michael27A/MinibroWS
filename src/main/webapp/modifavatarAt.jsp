<%-- 
    Document   : modifavatarAt
    Created on : 14 févr. 2018, 09:09:59
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
    Double humeur = Double.parseDouble(request.getParameter("attention"));
    Double pa = Double.parseDouble(request.getParameter("pa"));
    Double ppa = Double.parseDouble(request.getParameter("ppa"));
    Double ppp=humeur-ppa;
    pa = pa-1;
    
    AvatarDAO avt=new AvatarDAO();

    try {
           
        avt.updateAvatarA(nom, ppp, pa);
        
    } catch (MongoException e) {
        e.getMessage();
    }
    
response.setHeader("Access-Control-Allow-Origin", "*");
    
%>
