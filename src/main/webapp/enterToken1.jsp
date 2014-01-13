<%-- 
    Document   : enterToken1
    Created on : Dec 15, 2013, 1:51:04 PM
    Author     : nam
--%>

<%@page import="DataOOD.Token"%>
<%@page import="Controller.Controller"%>
<%
    String strViewPage = "enterToken.jsp";
    //initial
    session.setAttribute("error", null);
    //
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        if (session.getAttribute("submit") == null) {//introduction
            String code = (String) request.getParameter("code");
            if (code == null || code.isEmpty()) {
                session.setAttribute("error", "CODE cannot be blank!");
            } else {
                if (!Controller.isExistedToken(code)) {//not exist
                    session.setAttribute("error", "This CODE does not exist!");
                } else if (Controller.isUsedToken(code)) {// already used
                    session.setAttribute("error", "This CODE is already used!");
                } else {
                    Token token = Controller.getTokenByCode(code);
                    Controller.updateTokenToUsed(token, Controller.getLoginUser().getId());//
                    strViewPage = "brandedQuiz.jsp";
                    session.invalidate();
                    session = request.getSession();
                    session.setAttribute("branded_topic", Controller.getTopicByID(token.getTopic_ID()).getDescription());
                    session.setAttribute("numberQuestion", token.getNumberQuestion());
                }
            }
        }

    }

%>
<%    RequestDispatcher dispatcher = request.getRequestDispatcher(strViewPage);
    if (dispatcher != null) {
        dispatcher.forward(request, response);
    }
%>

