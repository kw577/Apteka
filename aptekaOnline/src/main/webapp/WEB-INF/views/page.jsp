<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
			<div id="topbarL">
				<img src="${images}/mainPage_image.png" class="imageLogo"/>
			</div>
			<div id="topbarC">
				
				
			</div>	
			
			<div id="topbarR">
				<div class="button">Logowanie</div>
				<div class="button">Rejestracja</div>
			</div>
			<div style="clear:both;"></div> 
		</div>
		
		
		
		<div class="menu">
		
		
				<div class="search">
						
						<input type="text" id="name" placeholder="Szukaj...">
						<button type="submit"><i class="fa fa-search"></i></button>
					
				</div>
		
	
			
				<div class="option">LEKI</div>
				<div class="option">SUPLEMENTY</div>
				<div class="option">KOSMETYKI</div>
				<div class="option">ART. HIGIENICZNE</div>
				<div class="option">KONTAKT</div>
				
				
				<div style="clear:both;"></div> 
			
			
		</div>
		
		
		
		
		<div class="row">
			
			<div id="content">
			
				
					<div class="offer">
					
						<div class="photo">
								
								<img src="${images}/produkt1.png" class="produkt"/>		
					
						</div>	
						
						<div class="opis">
					
							</br>
							Pasta Sensodyne
							</br>
							</br>
							Cena: 10zl
							</br>
							</br>
							<div style="color: red;">-20%</div>
					
						</div>	
					</div>
				
					<div class="offer">
					
						<div class="photo">
								
								<img src="${images}/produkt2.png" class="produkt"/>		
					
						</div>	
						
						<div class="opis">
					
							</br>
							Zestaw witamin
							</br>
							</br>
							Cena: 15zl
							</br>
							</br>
							<div style="color: red;">-15%</div>
					
						</div>	
					</div>
				
				
								
					<div class="offer">
					
						<div class="photo">
								
								<img src="${images}/produkt3.png" class="produkt"/>		
					
						</div>	
						
						<div class="opis">
					
							</br>
							Magnez B6
							</br>
							</br>
							Cena: 20zl
							</br>
							</br>
							
							<div style="color: red;">-15%</div>
							
					
						</div>	
					</div>
				
				
				
				<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
				
				<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
								<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
				
				<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
			</div>	
		</div>	
		<div id="footer">
			Projekt w ramach przedmiotu Technologie Internetowe &copy; 
		</div>
	
	</div>
	

	
	<script src="${js}/jquery-1.11.3.min.js"></script>
	
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
	
	
	
</body>
</html>