/**
 * 생년월일 함수
 * (월 선택시 자동으로 일의 마지막 날이 바뀜)
 */
var start_year="1970";// 시작할 년도 
var today = new Date(); 
var today_year= today.getFullYear(); 
var index=1; 
var memberBirth = "";

document.getElementById('select_year').options[0] = new Option("년", "0");
document.getElementById('select_month').options[0] = new Option("월", "0");
document.getElementById('select_day').options[0] = new Option("일", "0");

for(var y=today_year; y>=start_year; y--){ //start_year ~ 현재 년도 
	document.getElementById('select_year').options[index] = new Option(y, y); //<option value="1970">1970</option>
	index++; 
} 
index=1; 
for(var m=1; m<=12; m++){ 
	document.getElementById('select_month').options[index] = new Option(m, m); index++; 
} 

lastday();

function lastday(){
	var year=document.getElementById('select_year').value;
	var month=document.getElementById('select_month').value;
	var day=new Date(new Date(year,month,1)-86400000).getDate();
	/* = new Date(new Date(Year,Month,0)).getDate(); */
	let dayIndex_len=document.getElementById('select_day').length-1;
	if(day>dayIndex_len){ 
		for(var i=(dayIndex_len+1); i<=day; i++){ 
	  		document.getElementById('select_day').options[i] = new Option(i, i);
	  	} 
	} else if(day<dayIndex_len){ 
		for(var i=dayIndex_len; i>=day; i--){ 
			document.getElementById('select_day').options[i+1]=null; 
		}
	}
	
}

function onBirth(){
	var year=document.getElementById('select_year').value;
	var month=document.getElementById('select_month').value;
	var day=document.getElementById('select_day').value;
	
	document.getElementById('memberBirth').value = year + "/" + month + "/" + day;
}