<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String id = (String)session.getAttribute("id");

    if(id == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록</title>
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
    table {
        width: 100%;
    }
    th {
        background-color: #87CEFA;
        padding: 15px;
        text-align: center;
        border: 1px solid #ddd;
    }
    td {
        padding: 15px;
        text-align: left;
        border: 1px solid #ddd;
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
    #submitBtn {
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
    #submitBtn:hover {
        background-color: #00688B;
    }
</style>
</head>
<body>
    <h2>게시글 등록</h2>
    <form action="writeProcess.jsp" method="post">
        <table>
            <tr>
                <th>제목</th>
                <td>
                    <input type="text" name="title">
                </td>
            </tr>
            <tr>
                <th>내용</th>
                <td>
                    <textarea name="content" rows="7"></textarea>
                </td>
            </tr>
        </table>
        <input id="submitBtn" type="submit" value="등록">
    </form>
</body>
</html>


