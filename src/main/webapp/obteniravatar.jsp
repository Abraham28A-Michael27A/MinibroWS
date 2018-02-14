<%-- 
    Document   : obteniravatar
    Created on : 13 févr. 2018, 23:46:35
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
    //JSONArray arr2 = new JSONArray();

    ConnectionDBM mon = new ConnectionDBM();
    DBCursor cursor = null;
    String cat = request.getParameter("nom");
    //String cc="";


    try {
            DB db = mon.getcon();
            DBCollection table = db.getCollection("Avatar");
            BasicDBObject searchQuery = new BasicDBObject();
            BasicDBObject searchQuery1 = new BasicDBObject();
             DBObject query =
            QueryBuilder.start().or(
                    QueryBuilder.start("nom").regex(Pattern.compile(cat)).get()
            ).get();

            
            cursor = table.find(query);
        while (cursor.hasNext()) {
            DBObject obje = cursor.next();
            //cc=String.valueOf(obje.get("nom"));
            obj.put("Nom", obje.get("nom"));
            obj.put("User", obje.get("user"));
            obj.put("Gout", obje.get("gout"));
            obj.put("Caractere", obje.get("caractere"));
            obj.put("Message", obje.get("message"));
            obj.put("Requete", obje.get("requete"));
            obj.put("Humeur", obje.get("humeur"));
            obj.put("Attention", obje.get("attention"));
            obj.put("Pa", obje.get("pa"));
            obj.put("Img", obje.get("img"));
            

            arr.put(obj);
            obj = new JSONObject();
            
        }
       // if(cc.equals(cat)){
         //    out.println(arr);
       // }

       //else{out.println(arr2);}
       out.println(arr);
       
        response.setHeader("Access-Control-Allow-Origin", "*");

    } catch (MongoException e) {
        e.getMessage();
    }

%>