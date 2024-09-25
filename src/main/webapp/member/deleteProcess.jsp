<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.ac.kopo.member.dao.MemberDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String id = request.getParameter("id");
    MemberDAO dao = new MemberDAO();
    int result = dao.deleteMember(id);
    request.setAttribute("result", result);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>deleteProcess</title>
    <script>
        let result = ${ result };
        if (result > 0) {
            alert("회원 탈퇴가 완료되었습니다. 안녕히 가세요");
        } else {
            alert("회원 탈퇴에 실패했습니다. 다시 시도해주세요");
        }
        location.href = "../index.jsp";
    </script>
</head>
<body>
</body>
</html>
