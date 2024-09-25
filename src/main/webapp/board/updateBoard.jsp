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
<title>게시글 수정</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #d3d3d3;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
    }
    h2 {
        color: #009ACD;
        text-align: center;
        padding: 20px 0;
    }
    form {
        width: 80%;
        background-color: #FFFFFF;
        padding: 20px;
        margin-bottom: 20px;
    }
    label {
        display: block;
        font-weight: bold;
        margin-top: 20px;
    }
    input[type="text"], textarea {
        width: 100%;
        padding: 10px;
        border: 1px solid #ddd;
        font-size: 20px;
    }
    textarea {
        height: 200px;
    }
    input[type="submit"] {
        display: block;
        width: 200px;
        height: 50px;
        margin: 20px auto;
        background-color: #009ACD;
        color: #fff;
        border-radius: 5px;
        text-align: center;
        line-height: 50px;
        font-size: 20px;
        transition: all 0.3s;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #00688B;
    }
</style>
</head>
<body>
    <h2>게시글 수정</h2>
    <form action="updateBoard.jsp" method="post">
        <input type="hidden" name="no" value="<%= no %>">
        <label for="title">제목</label>
        <input type="text" id="title" name="title" value="<%=board.getTitle()%>">
        <label for="content">내용</label>
        <textarea id="content" name="content"><%= board.getContent() %></textarea>
        <input type="submit" value="수정">
    </form>
</body>
</html>
<%
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String role = (String)session.getAttribute("role");

    if(board.getWriter().equals(id) || "admin".equals(role)) {
        if(title != null && content != null) {
            board.setTitle(title);
            board.setContent(content);
            dao.updateBoard(board);

            response.sendRedirect("boardDetail.jsp?no=" + no);
        }
    } else {
        response.sendRedirect("boardList.jsp");
    }
%>

