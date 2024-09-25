<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String id = (String)session.getAttribute("id");

    if(id == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
    
    request.setCharacterEncoding("UTF-8");

    String title = request.getParameter("title");
    String content = request.getParameter("content");

    BoardDAO dao = new BoardDAO();
    dao.insertBoard(title, id, content);
%>

<script>
    alert('새글등록이 완료되었습니다')
    location.href = "boardList.jsp"
</script>
