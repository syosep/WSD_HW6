<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ include file="/WEB-INF/views/common/top.jsp" %>
<html>
<head>
    <title>홈 페이지</title>
</head>
<body>
<h1>22100423 심요셉</h1>
<button type="button" onclick="location.href='${pageContext.request.contextPath}/board/list'">목록</button>
</body>
<%@ include file="/WEB-INF/views/common/bottom.jsp" %>
</html>