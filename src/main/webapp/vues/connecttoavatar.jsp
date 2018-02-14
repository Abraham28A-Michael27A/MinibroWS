<%-- 
    Document   : connecttoavatar
    Created on : Feb 11, 2018, 11:33:29 PM
    Author     : abraham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="functions.JsonReader"%>
<%
    if(session.getAttribute("userref")==null){
    response.sendRedirect("index.jsp");
    }
    String n = request.getParameter("n");
    JSONArray jsn = JsonReader.readJsonArrayFromUrl("http://localhost:8084/minibrotest/getavatarbyuser.jsp?user="+session.getAttribute("userref"));
    if(jsn.length() >0){
    session.setAttribute("minibroref",n);
    response.sendRedirect("GestionAvatar.jsp");
    }
    else{
    response.sendRedirect("index.jsp");
    }
    %>
