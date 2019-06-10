<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");
%>

<script>
	window.jsonCriteria = '${searchingCriteria}';
</script>


<div id="tableOffer">
	
	<h1>Produkty kryteria wyszukiwania</h1>
	
	
	
	<table id="table1">
	
		<tr>
			<th></th>
		    <th>Produkt</th>
		    <th>Opis</th>
		    <th>Cena[PLN]</th>
		    <th>Promocja</th>
		    <th></th>  
		</tr>
	
	</table>
	
	<!-- jQuery AJAX -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
	
	
	
	
	
	<script>
		$( document ).ready(function() {
		 
			
			var jsonUrl = '';
			jsonUrl = '/json/data/offer/search/'+ window.jsonCriteria;
			
			
		 $.getJSON("${contextRoot}"+jsonUrl, function(data){ 
		     var product_data = '';
		      $.each(data, function(key, value){
		    	  product_data += '<tr>';
		    	  product_data += '<td>'+'<img src="${images}/'+value.image+'" class="dataTableImg"/>'+'</td>';
		    	  product_data += '<td>'+value.name+'</td>';
		    	  product_data += '<td>'+value.description+'</td>';
		    	  product_data += '<td>'+value.price+'</td>';
		    	  
		    	  if(value.discount > 0){
		    		  //product_data += '<td>'+value.discount+'</td>';
		    		  
		    		  product_data += '<td>'+'<div style="color: red; font-size: 28px;">   -'+value.discount+'%   </div>'+'</td>';
		    	  }
		    	  else {
		    		  product_data += '<td>'+'</td>';
		    	  }
		    	  
		    	  product_data += '<td>'+'<a href="${contextRoot}/view/id/'+value.id+'/product">'+'<img src="${images}/icon_view.png" class="iconTableImg"/></a> &#160;'
					  +'<a href="${contextRoot}/cart/add/id/'+value.id+'/product">'+'<img src="${images}/icon_choose.png" class="iconTableImg"/></a>'+'</td>';
		    	  
		    	  
		    	  product_data += '</tr>';
		      });
		      $('#table1').append(product_data);    
		  });
		});
	</script> 
	
	
	</br></br></br></br></br></br></br></br></br></br>
	</br></br></br></br></br></br></br></br></br></br>
</div>
