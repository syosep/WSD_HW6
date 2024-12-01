<%--
  Created by IntelliJ IDEA.
  User: sim-yosep
  Date: 2024. 12. 1.
  Time: 오전 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ include file="/WEB-INF/views/common/top.jsp" %>
<html>
<head>
    <title>게시글 수정</title>
</head>
<body>
<h2>게시글 수정</h2>
<form action="${pageContext.request.contextPath}/board/editok" method="post">
    <input type="hidden" name="seq" value="${boardVO.seq}" />
    <table>
        <tr>
            <td>제목</td>
            <td><input type="text" name="title" value="${boardVO.title}" required/></td>
        </tr>
        <tr>
            <td>작성자</td>
            <td><input type="text" name="writer" value="${boardVO.writer}" required/></td>
        </tr>
        <tr>
            <td>내용</td>
            <td><textarea cols="50" rows="5" name="content" required>${boardVO.content}</textarea></td>
        </tr>
    </table>
    <button type="submit">수정하기</button>
    <button type="button" onclick="location.href='${pageContext.request.contextPath}/board/list'">목록으로</button>
</form>
</body>
<%@ include file="/WEB-INF/views/common/bottom.jsp" %>
</html>
