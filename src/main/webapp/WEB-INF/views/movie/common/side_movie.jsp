<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<ul class="ul-side">
	<li class="li-side">
		<h3>상영 시간표
			<div class="text-right-on-same-line"><i class="fa fa-angle-right"></i></div>
		</h3>
		<ul>
			<li class="${side_active eq 'm1one' ? 'active' : '' }"><a href="/movie/timetableadd.esc">시간표 등록</a></li>
			<li class="${side_active eq 'm1two' ? 'active' : '' }"><a href="/movie/timetableinfo.esc">시간표 조회</a></li>
		</ul>
	</li>
	<li class="li-side">
		<h3>상영관 관리
			<div class="text-right-on-same-line"><i class="fa fa-angle-right"></i></div>
		</h3>
		<ul>
			<li class="${side_active eq 'm2one' ? 'active' : '' }"><a href="/movie/movieseat.esc">상영관 좌석관리</a></li>
			<li class="${side_active eq 'm2two' ? 'active' : '' }"><a href="/movie/moviemanagement.esc">상영 관리</a></li>
		</ul>
	</li>
	<li class="li-side">
		<h3>영화 관리
			<div class="text-right-on-same-line"><i class="fa fa-angle-right"></i></div>
		</h3>
		<ul>
			<li class="${side_active eq 'm3one' ? 'active' : '' }"><a href="/movie/movieadd.esc">영화 등록</a></li>
			<li class="${side_active eq 'm3two' ? 'active' : '' }"><a href="/movie/movielist.esc">영화 조회</a></li>
		</ul>
	</li>
</ul>
