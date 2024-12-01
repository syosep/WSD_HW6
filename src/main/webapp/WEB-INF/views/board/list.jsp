<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: sim-yosep
  Date: 2024. 11. 29.
  Time: 오전 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table>
    <c:forEach items="${list}" var="u">
        <tr>
            <td>${u.seq}</td>
            <td>${u.category}</td>
            <td>${u.title}</td>
            <td>${u.writer}</td>
            <td>${u.content}</td>
            <td>${u.regdate}</td>
            <td><a href="editform/${u.seq}">글수정</a></td>
            <td><a href="javascript:delete_ok('${u.seq}')">글삭제</a></td>
        </tr>
    </c:forEach>
</table>
<br/><button type="button" onclick="location.href='add'">새글쓰기</button>

</body>
</html>
