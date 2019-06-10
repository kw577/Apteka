<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");
%>


<div class="detailedView1">
	<div class="detailedViewLeft">
		<img src="${images}/${product.image}" class="detailedViewPhoto"/>
	</div>

	<div class="detailedViewRight">
		<div class="specificationTitle">${product.name}</div>
		<div class="specification">Cena 1szt: ${product.price} PLN</div>
		<div class="specification">Dostępność: ${product.quantity} szt.</div>

		<!-- Informacja o promocji -->	
		<c:if test="${product.discount > 0 }"> 
			<div class="specification"><div style="color: red; font-size: 20px;">-${product.discount}%</div></div>
				
		</c:if>	



	</div>

	<div style="clear:both;"></div> 
</div>	



<div class="detailedView2">
	<div class="descripton">
			${product.description}
	</div>

	<div class="actionButtons">

		<a href="${contextRoot}/home" class="backButton">POWRÓT</a>

		<a href="${contextRoot}/cart/add/id/${product.id}/product" class="orderButton">KUPUJĘ</a>

	</div>

	<div style="clear:both;"></div> 

</div>