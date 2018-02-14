<%-- 
    Document   : insertphotob
    Created on : 9 févr. 2018, 11:07:52
    Author     : user
--%>

<%@page import="DAO.PhotobDAO"%>
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
    
    
    
    PhotobDAO avt=new PhotobDAO();

    try {
           
        avt.insertPhotob(avatar, description);
        
    } catch (MongoException e) {
        e.getMessage();
    }
%>
