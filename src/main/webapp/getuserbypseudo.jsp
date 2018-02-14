<%-- 
    Document   : getuser
    Created on : 8 févr. 2018, 22:46:56
    Author     : user
--%>

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
    JSONObject obj = new JSONObject();
    JSONArray arr = new JSONArray();
    ConnectionDBM mon = new ConnectionDBM();
    DBCursor cursor = null;
    String p = request.getParameter("pseudo");
    try {
            DB db = mon.getcon();
            DBCollection table = db.getCollection("User");
            BasicDBObject searchQuery = new BasicDBObject();
            DBObject query =QueryBuilder.start("pseudo").is(p).get();
            //DBObject query =QueryBuilder.start("mail").is(m).get();

             /*QueryBuilder.start().or(
                    QueryBuilder.start("pseudo").regex(Pattern.compile(u)).get(),
                    QueryBuilder.start("mdp").regex(Pattern.compile(m)).get()
            ).get();*/

            
            cursor = table.find(query);
        while (cursor.hasNext()) {
            DBObject obje = cursor.next();
            obj.put("Nom", obje.get("nom"));
            obj.put("Prenom", obje.get("prenom"));
            obj.put("Mail", obje.get("mail"));
            obj.put("Pseudo", obje.get("pseudo"));
            obj.put("Motdepasse", obje.get("mdp"));
            obj.put("Q1", obje.get("q1"));
            obj.put("R1", obje.get("r1"));
            arr.put(obj);
            obj = new JSONObject();
        }
        out.println(arr);
        response.setHeader("Access-Control-Allow-Origin", "*");

    } catch (MongoException e) {
        e.getMessage();
    }

%>
