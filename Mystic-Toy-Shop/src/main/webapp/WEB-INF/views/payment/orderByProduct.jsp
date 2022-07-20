<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container">

    <div>
        <div>
            ${prodcutDto.product_name}
        </div>
        <div>${prodcutDto.product_cost} 원</div>
        <div>${quantity}</div>

    </div>
</div>

</body>
</html>
