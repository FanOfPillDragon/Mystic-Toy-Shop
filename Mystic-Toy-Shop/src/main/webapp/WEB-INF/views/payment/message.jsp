<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<c:choose>
    <c:when test="${not empty msg}">
        <script type="text/javascript">
            alert('${msg}');
            location.href = 'main.do';
            // productId 가진 상품 상세 페이지로 다시 돌아가도록 수정 필요
        </script>

    </c:when>
</c:choose>