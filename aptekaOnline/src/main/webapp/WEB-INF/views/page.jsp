<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags" %>
<%
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");
%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>


<spring:url var="images" value="/resources/images"/>
<spring:url var="css" value="/resources/css"/>
<spring:url var="js" value="/resources/js"/>

<!DOCTYPE HTML>
<html lang="pl">
<head>
	<meta charset="utf-8" />
	<title>Apteka Online</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	
	<link rel="stylesheet" href="style.css" type="text/css" />
	<link href="https://fonts.googleapis.com/css?family=PT+Sans&display=swap" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css?fbclid=IwAR2Je0S0_sgfQW3Z9dNoWNsJ-IW1AVMWcVpvU-SOPLNoqbBjQerCkccNnQ4" rel="stylesheet">
	
	<!-- plik CSS -->
    <link href="${css}/style.css" rel="stylesheet">
	
	
</head>

<body>
	
	<div id="container">
			

		
		<div id="topbar">
		
			<a href="${contextRoot}/home" class="buttonlink">
			<div id="topbarL">
				
					<img src="${images}/mainPage_image.png" class="imageLogo"/>
				
			</div>
			</a>
			
			<div id="topbarC">
				
				
			</div>	
			
			<div id="topbarR">
				<div class="button">Logowanie</div>
				
				<a href="${contextRoot}/register" class="buttonlink2"><div class="button">Rejestracja</div></a>
				
			</div>
			<div style="clear:both;"></div> 
		</div>
		
		
		
		<div class="menu">
		
		
				<div class="search">
					<form action="<sf:url value="http://localhost:8080/aptekaOnline/offer/search"/>">
					
						<input type="text" id="name" name="searchPhrase" value="${param.searchPhrase}" placeholder="Szukaj...">

						<button type="submit"><i class="fa fa-search"></i></button>
					</form>
				</div>
		
					
				<!-- wczytanie listy kategorii ktore maja byc na pasku nawigacji - atrybut onNavbar w bazie danych -->
				<c:forEach items="${categoriesList}" var="category">

										
				<a href="${contextRoot}/show/category/${category.id}/offer" class="buttonlink">
						<div class="option">${category.name}</div>
					</a>
					
				</c:forEach>
				
				
				
				
				<a href="${contextRoot}/terms" class="buttonlink">
					<div class="option">REGULAMIN</div>
				</a>
				
				
				<div style="clear:both;"></div> 
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
		</div>
		
		
	<!-- Strona startowa - opis aktualnych promocji -->	
	<c:if test="${isStartPage == true }"> 
		<%@include file="startPage.jsp"%>
	</c:if>	
		
		
	<!-- Strona z regulaminem apteki -->	
	<c:if test="${isTermsPage == true }"> 
		<%@include file="termsPage.jsp"%>
	</c:if>	
		
		
	<!-- Strona lista produktow wg kryteriow wyszukiwania -->	
	<c:if test="${isShowOfferPage == true }"> 
		<%@include file="offerPage.jsp"%>
	</c:if>		
		
		
	<!-- Strona z wynikami wyszukiwania wg wyszukiwanej frazy-->	
	<c:if test="${isSearchOfferPage == true }"> 
		<%@include file="searchOfferPage.jsp"%>
	</c:if>	
		
	<!-- Strona podgladu produktu -->
	<c:if
		test="${productDetailsPage == true}">
		<%@include file="detailedOffer.jsp"%>
	</c:if>	
		
		
	<!-- Rejestracja nowego uzytkownika -->
	<c:if
		test="${isRegisterPage == true}">
		<%@include file="register.jsp"%>
	</c:if>	

	<div id="footer">
			Projekt w ramach przedmiotu Technologie Internetowe &copy; 
		</div>
	
	</div>
	

	
	<script src="${js}/jquery-1.11.3.min.js"></script>
	
	<!-- jQuery validator -->
	<script src="${js}/jquery.validate.js"></script>
	
	<script>
		$(document).ready(function() {
		var NavY = $('.menu').offset().top;
		 
		var stickyNav = function(){
		var ScrollY = $(window).scrollTop();
			  
		if (ScrollY > NavY) { 
			$('.menu').addClass('sticky');
		} else {
			$('.menu').removeClass('sticky'); 
		}
		};
		 
		
		stickyNav();
		 
		$(window).scroll(function() {
			stickyNav();
		});
		});
	
	</script>
	
	
	
<script>
$registerForm = $('#registerForm'); 
if($registerForm.length) {
	$registerForm.validate({			
			rules: {
				name: {
					required: true,
					minlength: 3
				},
				surname: {
					required: true,
					minlength: 3
				},
				email: { 
					required: true,
					minlength: 5					
				},
				address: { 
					required: true,
					minlength: 3					
				},
				password: { 
					required: true,
					minlength: 5					
				},
				repeatPassword: { 
					equalTo: "#password"				
				},
				acceptTerms: { 
					required: true					
				}
			},
			messages: {					
				name: {
					required: 'Podaj swoje imię!',
					minlength: 'Imię musi mieć co najmniej 3 znaki'
				},
				surname: {
					required: 'Podaj swoje nazwisko!',
					minlength: 'Nazwisko musi mieć co najmniej 3 znaki'
				},
				email: {
					required: 'Podaj swój adres email!',
					minlength: 'Pole musi mieć co najmniej 5 znaków'
				},	
				address: {
					required: 'Podaj swój adres!'
				},
				password: {
					required: 'Podaj swoje hasło!',
					minlength: 'Hosło musi mieć długośc co najmniej 5 znaków'
				},
				repeatPassword: {
					equalTo: 'Podane hasła nie są zgodne!'
			
				},
				acceptTerms: {
					equalTo: 'Musisz zaakceptować warunki regulaminu!'
			
				}	
				
				
				
			},
			errorElement : "em",
			errorPlacement : function(error, element) {
				error.addClass('help-block');
				
				error.insertAfter(element);
				
			}				
		}
	);
}
</script>

	
</body>
</html>