<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.ac.kopo.member.dao.MemberDAO"%>
<%@ page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    String name = request.getParameter("name");
    String birthDate = request.getParameter("birthDate");
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");

    MemberVO member = new MemberVO();
    member.setId(id);
    member.setPassword(password);
    member.setName(name);
    member.setBirthDate(birthDate);
    member.setPhone(phone);
    member.setEmail(email);

    MemberDAO dao = new MemberDAO();
    int result = dao.updateMember(member);

    request.setAttribute("result", result);
%>

<c:choose>
    <c:when test="${ result > 0 }">
        <c:redirect url="../mypage.jsp"/>
    </c:when>
    <c:otherwise>
        <script>
            alert('회원정보 수정에 실패했습니다. 다시 시도해주세요.');
            history.go(-1);	// 객체 활용
        </script>
    </c:otherwise>
</c:choose>

