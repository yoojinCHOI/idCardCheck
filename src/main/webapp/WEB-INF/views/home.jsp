<%@ page session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"> <!--datePicker-->
<script src="//code.jquery.com/jquery.min.js"></script>									   <!--datePicker-->
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>					   <!--datePicker-->

 <!--local-->
<script	src="resources/js/jquery.smint.js" type="text/javascript" ></script>  <!--bootstrap-->
<link rel="stylesheet" type="text/css" href="resources/css/demo.css" />


<script type="text/javascript">
$(document).ready( function() {
    
	$('.subMenu').smint({
    	'scrollSpeed' : 1000
    });
    
   
	$.ajax(
			{
				type:'POST',
				url:"<s:url value='/addSelect.do'/>",	
				datatype: 'json',
				timeout:20000,
				success:function(data)
				{
				addSelect(data);
					
				},
				error:function(req, stat, err)
				{
					alert("error ");
					console.log(req);
					console.log(stat);
					console.log(err);
				}
			});
   
});

$(function() {  
    $('#startDate').datepicker({  
        changeMonth: true,  
        changeYear: true,  
        yearRange: '2009:2020' , 
        dateFormat: "yymmdd",
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] ,
        autoSize: true, 
        
    });  
    $('#startDate').val($.datepicker.formatDate('yymmdd', new Date()));
});

$(function() {  
    $('#endDate').datepicker({  
        changeMonth: true,  
        changeYear: true,  
        yearRange: '2009:2020' , 
        dateFormat: "yymmdd",
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] ,
        autoSize: true
    });    
    $('#endDate').val($.datepicker.formatDate('yymmdd', new Date()));
});






function addSelect(data){
	
	for(var i = 0 ; i< data.addSelect.length; i++){
		$("#selectPart").append("<option>"+data.addSelect[i].part_NM+"</option>");
	}
	
}
function makeTable(data){

	
	var tbody =  document.getElementById("tbody");
	
	var str = "";
	
	for(var i=0; i < data.searchCard.length; i++){
		
		
		str  = str +"<tr class='data'> <td>"+(i+1)+"</td><td>"+data.searchCard[i].part_NM+"</td><td>"+data.searchCard[i].card_NO+"</td><td>"+data.searchCard[i].issue_DATE+"</td><td>"+data.searchCard[i].take_OVER+"</td></tr>";
		tbody.innerHTML = str;
	
	}

}
function searchCard(){
	var partNm;
	if( $("#selectPart option:selected").text() == "부서명"){
		partNm = null;
	}
	else{
		partNm =$("#selectPart option:selected").text();
	}
	
	$.ajax(
			{
				type:'POST',
				url:"<s:url value='/searchCard.do'/>",	//ajax 로 data를 가져올 url
				datatype: 'json',
				data: {cardNo: $("#cardNo").val(),  startDate: $("#startDate").val(),endDate: $("#endDate").val(), partNm: partNm },
			
				timeout:20000,
				success:function(data)
				{
				console.log(data);
				
				makeTable(data);
		
			
						
					
				},
				error:function(req, stat, err)
				{
					alert("에러 ");
					console.log(req);
					console.log(stat);
					console.log(err);
				}
			});
}

</script>
</head>

<body>
<div class="wrap">
	<div class="section sTop">
		<div class="inner">
			<h1 class="title">ID CARD MANAGEMENT PROGRAM</h1>
			
		</div>
	</div>

	<div class="subMenu" >
	 	<div class="inner">
	 		<a href="#sTop" class="subNavBtn">Home</a>
	 		<a href="#s1" class="subNavBtn">ID 카드 조회</a> 
			<a href="#s2" class="subNavBtn">발급 확인서</a>
			<a href="#s3" class="subNavBtn">ID 카드 반납</a>
			
			
		</div>
	</div>

	<div class="section s1" style="height:500">
		<div class="inner" >
			부서 : <select id="selectPart">
				<option selected>부서명</option>
				</select> 
		날짜 : <input type="text" id="startDate" /> - <input type="text" id="endDate" />
	<br><br>
		카드번호 : <input type="text" size="10" id="cardNo" /> <input type="button" value="조회" onclick="searchCard()"/>
	<br><br><br><br>
	
      <form id="form1">
        <table id="table" style="width: 800px" class="table table-striped">
          <tr>
            <th>No. </th>
            <th>부서 </th>
            <th>카드번호 </th>
            <th>발금날짜</th>
            <th>인수자</th>
          </tr>
          <tbody id="tbody">

			</tbody>
			</table>
       
        <div class="paging-container" id="tablePaging" style ="color:white; text-align:center"> </div>
      </form>
      


<!-- 

<table id ="table">
<tr>
	<th>No.</th>
    <th>부서</th>
    <th>카드번호</th>
    <th>발급날짜</th>
    <th>인수자</th>
</tr>
<tbody id="tbody">

</tbody>
</table>
 -->
  <div class="paging-container" id="tablePaging"> </div>
       
	</div>

	<div class="section s2">
		<div class="inner" >
			<h1>ID카드 발급확인서</h1>
			<p><a href="#s4" class="intLink">Internal Link: Jump to Section 4</a></p>
			<p><a href="#sTop" class="intLink">Internal Link: Back to Top</a></p>
		</div>
	</div>



	<div class="section s3">
		<div class="inner">
			<h1>Section 3</h1>
		</div>
	</div>



	</div>
</div>

</body>
</html>