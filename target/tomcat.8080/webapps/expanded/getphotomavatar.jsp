<%-- 
    Document   : getphotomavatar
    Created on : 8 f�vr. 2018, 22:20:13
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
    String cat = request.getParameter("avatar");
    try {
            DB db = mon.getcon();
            DBCollection table = db.getCollection("Photom");
            BasicDBObject searchQuery = new BasicDBObject();
            BasicDBObject searchQuery1 = new BasicDBObject();
              DBObject query =
            QueryBuilder.start().or(
                    QueryBuilder.start("avatar").regex(Pattern.compile(cat)).get()
            ).get();

            
            cursor = table.find(query);
        while (cursor.hasNext()) {
            DBObject obje = cursor.next();
            obj.put("Avatar", obje.get("avatar"));
            obj.put("Description", obje.get("description"));
            arr.put(obj);
            obj = new JSONObject();
        }
        out.println(arr);
        response.setHeader("Access-Control-Allow-Origin", "*");

    } catch (MongoException e) {
        e.getMessage();
    }

%>
