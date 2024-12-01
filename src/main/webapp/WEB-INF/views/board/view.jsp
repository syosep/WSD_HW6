<%--
  Created by IntelliJ IDEA.
  User: sim-yosep
  Date: 2024. 12. 1.
  Time: 오전 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시글 보기</title>
    <script>
        function delete_ok(seq) {
            if (confirm("정말로 삭제하시겠습니까?")) {
                location.href = "/board/delete/" + seq;
            }
        }
    </script>
</head>
<body>
<h2>게시글 보기</h2>
<table border="1" width="100%">
    <tr>
        <th>제목</th>
        <td>${boardVO.title}</td>
    </tr>
    <tr>
        <th>작성자</th>
        <td>${boardVO.writer}</td>
    </tr>
    <tr>
        <th>내용</th>
        <td>${boardVO.content}</td>
    </tr>
    <tr>
        <th>등록일</th>
        <td>${boardVO.regdate}</td>
    </tr>
    <tr>
        <th>조회수</th>
        <td>${boardVO.cnt}</td>
    </tr>
</table>
<br/>
<div>
    <button type="button" onclick="location.href='/board/list'">목록으로</button>
    <button type="button" onclick="location.href='/board/edit/${boardVO.seq}'">수정하기</button>
    <button type="button" onclick="delete_ok(${boardVO.seq})">삭제하기</button>
</div>
</body>
</html>
