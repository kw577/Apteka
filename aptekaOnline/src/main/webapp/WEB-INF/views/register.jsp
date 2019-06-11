<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sform" uri="http://www.springframework.org/tags/form" %>

<%
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");
%>
	
	
	
	
	
	<div class="registerContainer">
		<h2>Rejestracja konta</h2>
		<h5>Zarejestruj się i zacznij zakupy w naszej aptece</h5></br></br>
		<sform:form id="registerForm" modelAttribute="newUser" action="${contextRoot}/register" name="registerForm" method="post">

			<div class="dane">Dane nowego użytkownika:</br>
				<h6>(Pola oznaczone * muszą zostać wypełnione)</h6>
			</div>
			<table class="table">
				<tr><td>Imię:</td> <td> <sform:input type="text" path="name" id="name"/>*</td></tr>
				<tr><td>Nazwisko:</td> <td> <sform:input type="text" path="surname" id="surname"/>*</td></tr>
				
				<tr><td>e-mail:</td> <td> <sform:input type="email" path="email" id="email"/>*</td></tr>
				<tr><td>Adres:</td> <td> <sform:input type="text" path="address" id="address"/>*</td></tr>
				<tr><td>Hasło:</td> <td> <sform:input type="password" path="password" id="password"/>*</td></tr>
				<tr><td>Powtórz hasło:</td> <td> <input type="password" name="repeatPassword" id="repeatPassword">*</td></tr>
				
				<tr><td><input type="checkbox" name="acceptTerms" id="acceptTerms" value="">Akceptuję warunki <a href="${contextRoot}/terms" style="text-decoration: underline;color:blue; ">Regulaminu</a></br><tr><td>
			

				<!---<tr><td>Data urodzenia:</td> <td><input type="date" name="dataUrodzenia">*</td></tr>-->
				<tr><td></td><td align="center"><input type="submit" class="registerButton" name="zarejestruj" value="Zarejestruj"></td></tr>
			</table>
			
			<!-- Pozostale atrubuty klasy User.java ustawione jako "hidden" -->
			<sform:hidden path="id"/>
			<sform:hidden path="role"/>
			
		</sform:form>

	</div>
	
	
	