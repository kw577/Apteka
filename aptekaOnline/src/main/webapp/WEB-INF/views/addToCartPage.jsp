<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<%
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");
%>	
	
	
	<div class="row2">

			<div class="summary">
				<div class="summaryLeft">
						<img src="${images}/${product.image}" class="detailedViewPhoto"/>

				</div>

				<div class="summaryRight">
					<div class="specificationTitle">${product.name}</div>
					<div class="specification">Cena: ${product.price} PLN/szt.</div>
					<div class="specification">${product.description}</div>


				</div>

				<div style="clear:both;"></div> <!--div dodany zostal aby wyczyscic formtaowanie float: left; - rozmieszczenie szeregowe div'ow-->

			</div>	

			<div class="reservationForm">

				<form action="" method="post">
					<div class="reservationFormInput">		
						Wybierz ilość:
						</br>
						
						<input type="number" id="amount" name="amount" min=1 max=${product.quantity} onchange="calculateCost()" placeholder="Ilość szt.">	
						
					
					</div>
					<div class="reservationFormInput">
						<h3 id="calculationResult"></h3>
					</div>
					
					

					
					<div class="reservationFormInput">
						<input type="submit" value="Reservation">
					</div>
					<div class="reservationFormInput">

						<a href="${contextRoot}/home" class="cancelButton">Cancel</a>

					</div>

					<div style="clear:both;"></div>
				</form>

			</div>	


	</div>	
	
	
	
	<script>
		function calculateCost(){
			var amount = document.getElementById('amount').value;
			
			var wynik = amount * ${product.price};
			
			document.getElementById('calculationResult').innerHTML = "Cena całkowita wynosi: " + wynik + "PLN";
		
			
		}
	   
	
	</script>
