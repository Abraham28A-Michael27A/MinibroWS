<%-- 
    Document   : verificationlogin
    Created on : Feb 11, 2018, 5:59:30 PM
    Author     : abraham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.json.JSONObject"%>
<%@page import="functions.JsonReader"%>

<%
    String p = request.getParameter("pseudo");
    String m = request.getParameter("mdp");
    JSONObject jsn= JsonReader.readJsonFromUrl("http://localhost:8084/minibrotest/getuserconnex.jsp?pseudo="+p+"&mdp="+m);
    if(jsn.isNull("Pseudo") && jsn.isNull("Motdepasse")){
        response.sendRedirect("index.jsp?err=1");
    }
    else{
        session.setAttribute("userref",p);
        response.sendRedirect("MenuAvatar.jsp");        
    }
%>
