<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/common.jsp" %>
<%@ include file="/WEB-INF/views/common/nav.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test</title>
</head>
<body>
<form name="myForm">
	<!--  구구단 셀렉트 박스 -->
	<select name="dan" size="1" >
		<option value ="">선택</option>
		<option value ="1">1단</option>
		<option value ="2">2단</option>
		<option value ="3">3단</option>
		<option value ="4">4단</option>
		<option value ="5">5단</option>
		<option value ="6">6단</option>
		<option value ="7">7단</option>
		<option value ="8">8단</option>
		<option value ="9">9단</option>
	</select>
	<input type="button" value="출력" onclick="Gugodan()">
	<br/><textarea name="txtarea" id="box-1" rows="10" cols="9"></textarea>
</form>

<form name="colorForm">
	<div id="ordinal">
		<p id="first">첫번째</p>
		<p id="second">두번째</p>
		<p id="third">세번째</p>
		<p id="fourth">네번째</p>
	</div>		
	<!--  컬러 셀렉트 박스 -->
	<select id="ordinal-number" size="1" >
		<option value ="">선택</option>
		<option value ="전체">전체</option>
		<option value ="0">첫번째</option>
		<option value ="1">두번째</option>
		<option value ="2">세번째</option>
		<option value ="3">네번째</option>
	</select>
	<select id="fontColor" size="1" >
		<option value ="">선택</option>
		<option value ="red">빨강</option>
		<option value ="blue">파랑</option>
		<option value ="yellow">노랑</option>
		<option value ="green">초록</option>
	</select>
	<input type="button" value="변경" onclick="colorChange()">
</form>

<form name="test6">
	<input type="text" name="num" id="num" size=2 maxlength=4 onKeyup="this.value=this.value.replace(/[^0-9]/g,'')">
	<input type="button" value="선택" onclick="resultNum()">
		<table id="table" border="1" style="border-collapse:collapse; border:1px gray solid;">
    	</table>
</form>
</body>
<script type="text/javascript">
	// 구구단 계산
	function Gugodan(){
      
    	dan = document.myForm.dan.value;
		if (!dan) {
			alert("단을 선택해주세요.");
			return false;
		}
		$('#box-1').val('')
    	var result = "";
   		for(var i =1; i <= 9 ; i++){
   			var out = dan * i;
     			result += +dan+ 'X' +i+ '=' +out+ '\n';
   		}
     		document.myForm.txtarea.value += result;
	}

	// 색깔 변경
	function colorChange(){
		var idx = $('#ordinal-number').val();
		var color = $('#fontColor').val();
		// 색상 유효성 검사
		if (!color) {
			alert("변경할 색상을 선택해주세요.");
			return false;
		}
		// style 초기화
		$('#ordinal').find('p').removeAttr("style");
		// 색상 변경
		if(idx == "전체") {
			$('#ordinal').find('p').css('color', color);
		}else{
			$('#ordinal').find('p').eq(idx).css('color', color);
		}
	}
	
	// 숫자계산
	function resultNum(){
		var v = 0;
		v = $("#num").val();
		var v4 = 0;
		if((4-v%4) != 4){
			v4 = 4-v%4;
		}
		v = Number(v) + Number(v4);
		var html = "";
		for(var i = 1; i<=v; i++){
			if(i%4 == 1){
				html += "<tr>";
			}
			if((v-v4) < i){
				console.log("x값"+i)
				html += "<td>x</td>";
			}else{
				html += "<td>"+i+"</td>";
			}
			if(i%4 == 0){
				html += "</tr>";
			}
		}
		$('#table').html(html);
	}
    
</script>
</html>