<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티켓챠!::좌석선택</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<link rel="stylesheet" href="css/seat_css.css">

</head>
<body>
	<div class="container2">
		<div class="select-wrapper">
			<div class="select-seats-qty d-block p-2 bg-danger text-white text-center">인원/좌석</div>
			<div class="select-top-container">
				<div class="select-seatsnum-qty-container">
					<div class="select-seatsnum-container">
						<div class="select-seat">
							<div class="select-seat-age">일반</div>
							<div class="select-seat-number">
								<ul class="select-seat-ul select-seat-ul-normal">
									<li class="select-number-normal zero">0</li>
									<li class="select-number-normal">1</li>
									<li class="select-number-normal">2</li>
									<li class="select-number-normal">3</li>
									<li class="select-number-normal">4</li>
									<li class="select-number-normal">5</li>
								
								</ul>
							</div>
						</div>
						<div class="select-seat">
							<div class="select-seat-age">청소년</div>
							<div class="select-seat-number">
								<ul class="select-seat-ul select-seat-ul-teen">
									<li class="select-number-teen zero">0</li>
									<li class="select-number-teen">1</li>
									<li class="select-number-teen">2</li>
									<li class="select-number-teen">3</li>
									<li class="select-number-teen">4</li>
									<li class="select-number-teen">5</li>

								</ul>
							</div>
						</div>
	
					<div class="select-seat">
							<div class="select-seat-age">우대</div>
							<div class="select-seat-number">
								<ul class="select-seat-ul  select-seat-ul-old">
									<li class="select-number-old zero">0</li>
									<li class="select-number-old">1</li>
									<li class="select-number-old">2</li>
									<li class="select-number-old">3</li>
									<li class="select-number-old">4</li>
									<li class="select-number-old">5</li>
									
								</ul>
							</div>
						</div>
					</div>
					
					<div class="reserve-number-wrapper">
						<div class="reserve-number-title">선택된 좌석 수</div>
						<div class="reserve-number">0</div>
					</div>
				</div>
				<div class="select-seat-information">
					<div class="selected-movie">${sessionScope.movie_title}</div>
					<div class="select-seat-information-wrapper">
						<div class="select-theater-place selected-theater-place-info ">${sessionScope.theater_name}</div>
						<div class="select-theater-place selected-theater-place-info ">${sessionScope.theater_no}관</div>
						<div class="select-theater-place">
							<span>남은좌석</span><span class="remain-seats">152</span>/<span
								class="all-seats">172</span>
						</div>

					</div>
					<div class="select-theater-date">
						<div class="theater-date">${sessionScope.showing_date}</div>
						<div class="theater-time">${sessionScope.start_time}~${sessionScope.end_time}</div>
					</div>
					<div class="selected-seats-wrapper">
						<span class="selected-seats-title">좌석번호</span> <span
							class="selected-seats">선택한 좌석이 없습니다.</span>
					</div>
					<div class="ticket-price-wrapper">
						<div class="ticket-price-title">가격</div>
						<div class="ticket-price">0원</div>
					</div>
					
				</div>

			</div>
			<div class="seat-container">

				<div class="seat-wrapper">
					<div class="screen-view-wrapper">
						<div class="screen-view">SCREEN</div>
					</div>
					<%--seatButtonwrapper추가됨--%>
				</div>
			</div>
			<form action="seat.do" class="seatForm" onsubmit="return check()" method="post">
						<!-- 티켓의수(선택한 좌석) -->
						<input type="hidden" class="qty" name="qty">
						<input type="hidden" class="selectedSeat" name="selectedSeat">
						<input type="hidden" class="qty_a" name="qty_a">
						<input type="hidden" class="qty_y" name="qty_y">
						<input type="hidden" class="qty_s" name="qty_s">
						<!-- 결제 정보 -->
						<input type="hidden" class="total_price" name="total_price">
						<div class="reserve-btn-wrapper">
						<input type="submit" class="reserve-button" value="결제하기">

						</div>
					</form>
		</div>
		<input id="seats_num" type="hidden" value="${sessionScope.seats_num}" />
		<input id="seat_list" type="hidden" value="${sessionScope.seat_list}" />
		
	</div>
</body>
<script type="text/javascript">
var seatWrapper = document.querySelector('.seat-wrapper');
var allSeat = document.querySelector('.all-seats');//총좌석수
var remainSeat = document.querySelector('.remain-seats');//남은좌석수
var seat = document.querySelectorAll('.seat'); //좌석 태그
var reserveNumber = document.querySelector('.reserve-number'); //선택된 좌석수를 보여주는 태그
var selectedSeats = document.querySelector('.selected-seats'); //선택된좌석목록을 보여주는 태그
var selectedSeat = document.querySelector('.selectedSeat'); //좌석정보를 넘겨줄 태그
var qty_a = document.querySelector('.qty_a'); 
var qty_y = document.querySelector('.qty_y'); 
var qty_s = document.querySelector('.qty_s'); 
var total_price = document.querySelector('.total_price'); //가격정보를 넘겨줄 태그
var qty = document.querySelector('.qty');//선택한 좌석수를 넘겨줄 태그
var reserve_button=document.querySelector('.reserve-button');

var selectedSeatsArray = new Array(); //선택된좌석들 담을 배열
var SeatArray = new Array();
var clicked = '';
var div = '';

var selectSeatListNormal = document.querySelectorAll('.select-seat-ul-normal li');
var selectSeatListTeen = document.querySelectorAll('.select-seat-ul-teen li');
var selectSeatListOld = document.querySelectorAll('.select-seat-ul-old li');

var normalNumber = 0;
var teenNumber = 0;
var oldNumber = 0;
var allNumber = 0;

var prevNumber = 0;
var normalMoney = 0;
var teenMoney = 0;
var oldMoney = 0;
var allMoney = 0;

var seats_num = $("#seats_num").val();
var seat_list =$("#seat_list").val();
var selectSeatListUlActive = '';

var ticketPrice = document.querySelector('.ticket-price'); //티켓가격
var seatLs = (seat_list.substring(1,seat_list.indexOf("]"))).split(",");
if(seatLs!=""){
	seatLs.forEach(function(sl){
		
		if((SeatArray.includes(sl.trim()))==false)
			SeatArray.push(sl.trim());
		
	});
	}

function check(){
	if(clicked.length<allNumber){
		alert("관람인원과 선택 좌석 수가 동일하지 않습니다.");
		return false;
	}
	else if(clicked.length>allNumber){alert("선택한 좌석이 예매 인원 보다 많습니다."); return false;}
	else if(clicked.length==0){alert("좌석을 선택해주세요!"); return false;}
}



function selectListUiFunction(selectSeatListUlActive) {
    selectSeatListUlActive.forEach(function(selected_li) {
    	if(selected_li.parentNode.classList.contains('select-seat-ul-normal')) {
        	
            normalNumber = Number(selected_li.innerHTML);
            normalMoney = 10000 * normalNumber;
            allMoney = normalMoney + teenMoney + oldMoney;
            allNumber = normalNumber + teenNumber + oldNumber;
            qty.value=allNumber;
           qty_a.value=normalNumber;
            ticketPrice.innerHTML = allMoney + '원';
        } else if (selected_li.parentNode.classList.contains('select-seat-ul-teen')) {
            teenNumber = Number(selected_li.innerHTML);
            teenMoney = 8000 * teenNumber;
            allMoney = normalMoney + teenMoney + oldMoney;
            allNumber = normalNumber + teenNumber + oldNumber;
            qty_y.value=teenNumber;
            qty.value=allNumber;
            ticketPrice.innerHTML = allMoney + '원';
        } else if (selected_li.parentNode.classList.contains('select-seat-ul-old')) {
            oldNumber = Number(selected_li.innerHTML);
            oldMoney = 6000 * oldNumber;
            allMoney = normalMoney + teenMoney + oldMoney;
            allNumber = normalNumber + teenNumber + oldNumber;
            qty.value=allNumber;
            qty_s.value=oldNumber;
            ticketPrice.innerHTML = allMoney + '원';
        }
        
        qty.value=allNumber;
        ticketPrice.innerHTML = allMoney + '원';
        total_price.value = allMoney;
    });
}

function selectSeatList(list) {
    allNumber = 0;
    allMoney = 0;
    list.forEach(function(li){
        //클릭시에 다른 class초기화해주기
        initList(list, li);
    });
}

function initList(list, li) {
    li.addEventListener('click', function() {
        list.forEach(function(li2) {
            li2.classList.remove('select-seat-ul-active');
        });
        li.classList.add('select-seat-ul-active');
        selectSeatListUlActive = document.querySelectorAll(
            '.select-seat-ul-active'
        );
        selectListUiFunction(selectSeatListUlActive);
 
    });
}



selectSeatList(selectSeatListNormal);
selectSeatList(selectSeatListTeen);
selectSeatList(selectSeatListOld);

//행(i)은 10개로 고정됨.
function mapping(input, i, j) {
    if (i === 0) {
        input.value = 'A' + j;
    } else if (i === 1) {
        input.value = 'B' + j;
    } else if (i === 2) {
        input.value = 'C' + j;
    } else if (i === 3) {
        input.value = 'D' + j;
    } else if (i === 4) {
        input.value = 'E' + j;
    } else if (i === 5) {
        input.value = 'F' + j;
    } else if (i === 6) {
        input.value = 'G' + j;
    } else if (i === 7) {
        input.value = 'H' + j;
    } else if (i === 8) {
        input.value = 'I' + j;
    } else if (i === 9) {
        input.value = 'J' + j;
    } else if (i === 10) {
        input.value = 'K' + j;
    }

    
    

}

//좌석 클릭 함수
function inputClickEvent(input) {
    input.addEventListener('click', function(e) {
        //f5선택하면 f5가 배열에 들어가고 그 다움에 d5를 클릭하면 f5, d5가 배열에 들어가기 때문에
        //f5가 중복되어 배열에 들어가는 것을 제거.
        selectedSeatsArray = selectedSeatsArray.filter(function(value, index){
        	selectedSeatsArray.indexOf(value) != index;
        });

        //이미 클릭된 좌석일 때 clicked 클래스를 제거해 일반좌석으로 돌린다.
        if (input.classList.contains('clicked')) {
            input.classList.remove('clicked');
            clicked = document.querySelectorAll('.clicked');

            //선택된 좌석 배열안의 값 제거
            selectedSeatsArray.splice(selectedSeatsArray.indexOf(e.value), 1);
           	clicked.forEach(function(data){
            	selectedSeatsArray.push(data.value);
            	selectedSeat.value=selectedSeatsArray;
            });
          
         
        } else {
            input.classList.add('clicked');
            clicked = document.querySelectorAll('.clicked');
            //인원수 초과시 선택불가
            if (clicked.length > allNumber) {
                input.classList.remove('clicked');
               alert(
                    "지정한 인원수를 넘었습니다"
                );
                return;
            }

            clicked.forEach(function(data){
            	selectedSeatsArray.push(data.value);
            	selectedSeat.value=selectedSeatsArray;
            });
        }

        
        selectedSeats.innerHTML = selectedSeatsArray; //선택한 좌석들의 정보를 보여준다.
        reserveNumber.innerHTML = selectedSeatsArray.length; //좌석개수를 보여준다.
        remainSeat.innerHTML = seat.length - selectedSeatsArray.length-SeatArray.length; // -팔린좌석수
    });
}


//좌석생성
for (var i = 0; i < 10; i++) {
    div = document.createElement('div');
    div.classList = 'seatButtonWrapper';
    seatWrapper.append(div);

    for (var j = 0; j < seats_num/10; j++) {
        var input = document.createElement('input');
        input.type = 'button';
        //input.name = 'seats';
        input.classList = 'seat';

		mapping(input, i, j);
        div.append(input);

        inputClickEvent(input);
    }
    
    

    seat = document.querySelectorAll('.seat');
    remainSeat.innerHTML = seat.length-SeatArray.length; //남은좌석수 수정
    allSeat.innerHTML = seat.length;
}


for(var i=0; i<SeatArray.length; i++){
	console.log(SeatArray.length);
	seat.forEach(function(s){
		
		if(SeatArray[i]==s.value){
			s.disabled="disabled";
			s.classList.add("disabled");
		}
	});

}



$(".zero").click();
</script>
</html>