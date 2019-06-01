<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");
%>
		
		<div class="row">
			
			<div id="content">
			
							
				
				<!-- Lista produktow na promocji -->
				<c:forEach items="${discountsList}" var="discount">
									
					<div class="offer">
					
						<div class="photo">
								
								<img src="${images}/${discount.image}" class="produkt"/>		
					
						</div>	
						
						<div class="opis">
					
							</br>
							${discount.name}
							</br>
							</br>
							Cena: ${discount.price} zł
							</br>
							</br>
							
							<div style="color: red;">-${discount.discount}%</div>
							
					
						</div>	
					</div>
					
				</c:forEach>
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
				
				<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
								<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
				
				<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
			</div>	
		</div>	