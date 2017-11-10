<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp" %>
<html>
<head>
	<title>상영관리</title>
	
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
<style>
        th {
            text-align: center;
        }
        .switch {
          position: relative;
          display: inline-block;
          width: 50px;
          height: 26px;
        }

        .switch input {display:none;}

        .slider {
          position: absolute;
          cursor: pointer;
          top: 0;
          left: 0;
          right: 0;
          bottom: 0;
          background-color: gray;
          transition: .4s;
        }

        .slider:before {
          position: absolute;
          content: "";
          height: 19px;
          width: 19px;
          left: 2px;
          bottom: 4px;
          background-color: white;
          transition: .4s;
        }

        input:checked + .slider {
          background-color: dodgerblue;
        }
        
        input:checked + .slider:before {
          transform: translateX(26px);
        }
</style>	
</head>
<body>
	<c:set var="nav_active" value="movie" />
	
	<%@ include file="/WEB-INF/views/common/nav.jsp" %>
	<div class="row">
		<div class="col-md-2">
			<c:set var="side_active" value="m2two" />
			<%@ include file="/WEB-INF/views/movie/common/side_movie.jsp" %>
		</div>
		<div class="col-md-10">
			
			<div class="container top-margin">
			<h2 class="page-header">상영 관리</h2>
  		
       <form class="form-inline" style="margin-top: 40px;">
          <div class="form-group" style="margin-left: 20px;">
              <label>일자선택 </label>
              <input type="date" class="form-control" />
          </div>
          <div class="form-group" style="margin-left: 30px">
              <label>상영관</label>
              <select class="form-control">
                  <option>1관</option>
                  <option>2관</option>
              </select>
           </div>  
       </form>
   <hr />
   <div class="box">
    <table class="table table-bordered" style="text-align: center" >
       <colgroup>
          <col width="10%";/>
          <col width="15%";/>
          <col width="15%";/>
          <col width="15%";/>
          <col width="15%";/>
          <col width="15%";/>
          <col width="15%";/>
          
      </colgroup>
        <thead>
            <tr>
                <th>회차</th>
                <th>영화명</th>
                <th>시작시간</th>
                <th>종료시간</th>
                <th>예매현황</th>
                <th>인터넷예매</th>
                <th>현장예매</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>1회</td>
                <td>토르:라그나로크</td>
                <td>9:00</td>
                <td>11:40</td>
                <td>64</td>
                <td>
                     <label class="switch">
                          <input type="checkbox">
                          <span class="slider"></span>
                    </label>
                </td>
                <td>
                      <label class="switch">
                          <input type="checkbox">
                          <span class="slider"></span>
                     </label>
                </td>
            </tr>
            <tr>
                <td>2회</td>
                <td>토르:라그나로크</td>
                <td>9:00</td>
                <td>11:40</td>
                <td>64</td>
                <td>
                      <label class="switch">
                          <input type="checkbox">
                          <span class="slider"></span>
                     </label>
                </td>
                <td>
                      <label class="switch">
                          <input type="checkbox">
                          <span class="slider"></span>
                     </label>
                </td>
            </tr>
            <tr>
                <td>3회</td>
                <td>토르:라그나로크</td>
                <td>9:00</td>
                <td>11:40</td>
                <td>64</td>
                <td>
                      <label class="switch">
                          <input type="checkbox">
                          <span class="slider"></span>
                     </label>
                </td>
                <td>
                      <label class="switch">
                          <input type="checkbox">
                          <span class="slider"></span>
                     </label>
                </td>
            </tr>
            <tr>
                <td>4회</td>
                <td>토르:라그나로크</td>
                <td>9:00</td>
                <td>11:40</td>
                <td>64</td>
                <td>
                      <label class="switch">
                          <input type="checkbox">
                          <span class="slider"></span>
                     </label>
                </td>
                <td>
                      <label class="switch">
                          <input type="checkbox">
                          <span class="slider"></span>
                     </label>
                </td>
            </tr>
            <tr>
                <td>5회</td>
                <td>토르:라그나로크</td>
                <td>9:00</td>
                <td>11:40</td>
                <td>64</td>
                <td>
                      <label class="switch">
                          <input type="checkbox">
                          <span class="slider"></span>
                     </label>
                </td>
                <td>
                      <label class="switch">
                          <input type="checkbox">
                          <span class="slider"></span>
                     </label>
                </td>
            </tr>
        </tbody>
    </table>
    <div style="text-align: right; margin-left: 900px; ">
            <button type="submit" class="btn btn-primary" value="저장" ><i class="fa fa-user-plus fa-fw fa-fw"></i>저장</button>
    </div>
    </div>
</div>

		</div>
	</div>
	
</body>
<script>
$(function(){
    $("[name='mycheckbox']").bootstrapSwitch();
})
</script>
</html>