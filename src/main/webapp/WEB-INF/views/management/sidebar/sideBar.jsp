<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<ul class="ul-side">
	<li class="li-side">
		<h3>고객 관리
			<div class="text-right-on-same-line"><i class="fa fa-angle-right"></i></div>
		</h3>
		<ul>
			<li class="${side_active eq 'register' ? 'active' : '' }"><a href="/management/informationSelect.esc">고객 정보 조회</a></li>
			<li class="${side_active eq 'search' ? 'active' : '' }"><a href="/management/cardHistory.esc">카드 내역 조회</a></li>
		</ul>
		<h3>티켓 조회
			<div class="text-right-on-same-line"><i class="fa fa-angle-right"></i></div>
		</h3>
		<ul>
			<li class="${side_active eq 'register' ? 'active' : '' }"><a href="/management/ticketRePrint.esc">티켓 재출력</a></li>
		</ul>
		<h3>단말기 관리
			<div class="text-right-on-same-line"><i class="fa fa-angle-right"></i></div>
		</h3>
		<ul>
			<li class="${side_active eq 'register' ? 'active' : '' }"><a href="/management/KeyInManagement.esc">키인 관리</a></li>
			<li class="${side_active eq 'search' ? 'active' : '' }"><a href="/management/discountEvent.esc">할인 이벤트 관리</a></li>
		</ul>
		<h3>분실물 관리
			<div class="text-right-on-same-line"><i class="fa fa-angle-right"></i></div>
		</h3>
		<ul>
			<li class="${side_active eq 'register' ? 'active' : '' }"><a href="/management/lostAndFound.esc">분실물 조회/처리</a></li>
		</ul>
	</li>
</ul>