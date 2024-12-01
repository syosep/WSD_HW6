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
    <title>게시글 목록</title>
    <script>
        function delete_ok(seq) {
            if (confirm("정말로 삭제하시겠습니까?")) {
                location.href = "/board/delete/" + seq;
            }
        }
    </script>
</head>
<body>
<h2>게시글 목록</h2>
<table border="1" width="100%">
    <thead>
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>등록일</th>
        <th>조회수</th>
        <th>수정</th>
        <th>삭제</th>
    </tr>
    </thead>
    <tbody>
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
    </tbody>
</table>
<br/><button type="button" onclick="location.href='/board/add'">새글쓰기</button>

</body>
</html>
