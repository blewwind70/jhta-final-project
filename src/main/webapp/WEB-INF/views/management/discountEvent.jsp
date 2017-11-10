<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp" %>
<html>
<head>
	<title>Home</title>
	
	<%@ include file="/WEB-INF/views/common/head.jsp" %>	
</head>
<body>
	<c:set var="nav_active" value="management" />
	
	<%@ include file="/WEB-INF/views/common/nav.jsp" %>
	<div class="row">
		<div class="col-md-2 div-side">
			<c:set var="side_active" value="register" />
			<%@ include file="/WEB-INF/views/management/sidebar/sideBar.jsp" %>
		</div>
		<div class="col-md-10">
			<div class="container" style="margin-top: 50px;">
			<h2 class="page-header">할인 이벤트 조회</h2>
       <div style="overflow: auto;" class="box">
            <form action="">
                <table class="table">
                    <thead>
                        <tr>
                            <th><input type="checkbox" name="all-check"></th>
                            <th>할인 명</th>
                            <th>분류</th>
                            <th>할인율</th>
                            <th>적용대상</th>
                            <th>키인설명</th>
                            <th>시작날짜</th>
                            <th>종료날짜</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="checkbox" name="check1"></td>
                            <td>10000원의 행복</td>
                            <td>고정가 판매</td>
                            <td>10,000</td>
                            <td>성인</td>
                            <td>10,000원에 관람가능</td>
                            <td>2017-11-01</td>
                            <td>2017-11-30</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="check1"></td>
                            <td>10000원의 행복</td>
                            <td>고정가 판매</td>
                            <td>10,000</td>
                            <td>성인</td>
                            <td>10,000원에 관람가능</td>
                            <td>2017-11-01</td>
                            <td>2017-11-30</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="check1"></td>
                            <td>10000원의 행복</td>
                            <td>고정가 판매</td>
                            <td>10,000</td>
                            <td>성인</td>
                            <td>10,000원에 관람가능</td>
                            <td>2017-11-01</td>
                            <td>2017-11-30</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="check1"></td>
                            <td>10000원의 행복</td>
                            <td>고정가 판매</td>
                            <td>10,000</td>
                            <td>성인</td>
                            <td>10,000원에 관람가능</td>
                            <td>2017-11-01</td>
                            <td>2017-11-30</td>
                        </tr>
                    </tbody>
                </table>
                <div class="form-group text-right">
                	<button class="btn btn-danger" type="submit"><i class="fa fa-trash fa-fw"></i>삭제</button>
                </div>
            </form>
        </div>
        
        <h2 class="page-header">할인 이벤트 등록</h2>
        <div style="overflow: auto;" class="box">
            <form class="form-horizontal" action="/action_page.php">
                <div class="form-group">
                     <label class="control-label col-xs-1" for="discount">할인 명:</label>
                     <div class="col-sm-5">
                       <input type="text" class="form-control" id="discount" placeholder="할인 명" name="discount">
                     </div>
                
                     <label class="control-label col-xs-1" for="age">적용대상:</label>
                     <div class="col-sm-5">          
                       <select name="age" id="age" class="form-control">
                           <option value="">성인</option>
                           <option value="">청소년</option>
                           <option value="">어린이</option>
                       </select>
                     </div>
                </div>
                <div class="form-group">
                     <label class="control-label col-xs-1" for="discounttype">분류:</label>
                     <div class="col-sm-5">
                       <select name="discounttype" id="discounttype" class="form-control">
                           <option value="">%할인</option>
                            <option value="">고정가 할인</option>
                       </select>
                     </div>
                
                     <label class="control-label col-xs-1" for="sale">할인율:</label>
                     <div class="col-sm-5">          
                       <input type="text" class="form-control" id="sale" placeholder="금액" name="sale">
                     </div>
                </div>
                <div class="form-group">
                     <label class="control-label col-xs-1" for="detail">상세설명:</label>
                     <div class="col-sm-10">
                       <textarea name="detail" id="detail" cols="140" rows="10"></textarea>
                     </div>
                </div>
                <div class="form-group">        
                    <div class="text-right" style="padding-right: 13px;">
                      <button type="submit" class="btn btn-primary"><i class="fa fa-user-plus fa-fw fa-fw"></i>추가</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
		</div>
	</div>
	
</body>
</html>