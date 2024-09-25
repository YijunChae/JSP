<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String id = (String)session.getAttribute("id");
    int no = Integer.parseInt(request.getParameter("no"));

    if(id == null) {
        response.sendRedirect("../login.jsp");
        return;
    }

    BoardDAO dao = new BoardDAO();
    BoardVO board = dao.selectBoard(no);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 삭제</title>
</head>
<body>
    <h2>게시글 삭제</h2>
    <p>게시글을 삭제하시겠습니까?</p>
    <form action="deleteBoard.jsp" method="post">
        <input type="hidden" name="no" value="<%= no %>">
        <input type="submit" value="삭제">
    </form>
</body>
</html>
<%
	String role = (String)session.getAttribute("role");
	if(board.getWriter().equals(id) || "admin".equals(role)) {
        dao.deleteBoard(no);
        response.sendRedirect("boardList.jsp");
    } else {
        response.sendRedirect("boardDetail.jsp?no=" + no);
    }
%>
