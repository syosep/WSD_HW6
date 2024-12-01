<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: sim-yosep
  Date: 2024. 11. 29.
  Time: 오전 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ include file="/WEB-INF/views/common/top.jsp" %>
<html>
<head>
    <title>게시글 목록</title>
    <script>
        function delete_ok(seq) {
            if (confirm("정말로 삭제하시겠습니까?")) {
                location.href = '${pageContext.request.contextPath}/board/delete/' + seq;
            }
        }
    </script>
</head>
<body>
<h2>게시글 목록</h2>
<form action="${pageContext.request.contextPath}/board/search" method="get">
    <input type="text" name="keyword" placeholder="검색어를 입력하세요" style="width: 300px;" />
    <button type="submit" class="button">검색</button>
</form>
<br/>

<table>
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
            <td><a href="${pageContext.request.contextPath}/board/view/${u.seq}">${u.title}</a></td>
            <td>${u.writer}</td>
            <td>${u.regdate}</td>
            <td>${u.cnt}</td>
            <td><a href="${pageContext.request.contextPath}/board/edit/${u.seq}">수정</a></td>
            <td><button type="button" onclick="delete_ok(${u.seq})">삭제</button></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<br/>
<button type="button" onclick="location.href='${pageContext.request.contextPath}/board/add'">새글쓰기</button>

<script>
    function delete_ok(seq) {
        if (confirm("정말로 삭제하시겠습니까?")) {
            location.href = '${pageContext.request.contextPath}/board/delete/' + seq;
        }
    }
</script>
</body>
<%@ include file="/WEB-INF/views/common/bottom.jsp" %>
</html>