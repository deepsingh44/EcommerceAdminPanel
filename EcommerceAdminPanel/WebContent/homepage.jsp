<%@include file="head.jsp"%>
<p:choose>
	<p:when test="${sessionScope.user ne null}">




	</p:when>
	<p:otherwise>
		<p:redirect url="index.jsp"></p:redirect>
	</p:otherwise>

</p:choose>