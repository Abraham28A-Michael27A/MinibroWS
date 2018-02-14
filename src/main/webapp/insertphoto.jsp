<%-- 
    Document   : insertphoto
    Created on : 9 févr. 2018, 10:53:51
    Author     : user
--%>


<%@page import="DAO.PhotoDAO"%>
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
    String avatar = request.getParameter("avatar");
    String description = request.getParameter("description");
    
    
    
    PhotoDAO avt=new PhotoDAO();

    try {
           
        avt.insertPhoto(avatar, description);
        
    } catch (MongoException e) {
        e.getMessage();
    }
%>