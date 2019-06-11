<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sform" uri="http://www.springframework.org/tags/form" %>
<%
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");
%>
	
		
	<div class="loginContainer">
		<h2>Logowanie</h2>
		<h5>Zaloguj się i zacznij zakupy w naszej aptece</h5></br></br>
		<form id="loginForm" modelAttribute="newUser" action="${contextRoot}/login" name="registerForm" method="POST">

			<div class="dane">Dane swoje dane logowania::</br>
	
			</div>
			<table class="table">
				
				<tr><td>e-mail:</td> <td> <input type="email" name="email" id="email"/></td></tr>

				<tr><td>Hasło:</td> <td> <input type="password" name="password" id="password"/></td></tr>
				


				<tr><td></td><td align="center"><input type="submit" class="registerButton" name="zarejestruj" value="Login"></td></tr>
			</table>

		</form>
	</br>
		Nie mam jeszcze konta. <a href="${contextRoot}/register" style="text-decoration: underline;color:blue; ">Zarejestruj się</a>
	</div>
	
	
	