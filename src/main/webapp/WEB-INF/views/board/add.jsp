<%--
  Created by IntelliJ IDEA.
  User: sim-yosep
  Date: 2024. 11. 29.
  Time: 오전 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시글 작성</title>
</head>
<body>
<h2>게시글 작성</h2>
<form action="board/addok" method="post">
    <table>
        <tr><td>제목</td><td><input type="text" name="title" required/></td></tr>
        <tr><td>작성자</td><td><input type="text" name="writer" required/></td></tr>
        <tr><td>내용</td><td><textarea cols="50" rows="5" name="content" required></textarea></td></tr>
    </table>
    <button type="button" onclick="location.href='/board/list'">목록보기</button>
    <button type="submit">등록하기</button>
</form>
</body>
</html>
