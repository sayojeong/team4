<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<title>Scheduler</title>
</head>
<script src="./resources/codebase/dhtmlxscheduler.js?v=5.2.3" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="./resources/codebase/dhtmlxscheduler_material.css?v=5.2.3" type="text/css">
<script src="./resources/codebase/ext/dhtmlxscheduler_minical.js?v=5.2.3" type="text/javascript" charset="utf-8"></script>   
<style type="text/css" >
   html, body{
      margin:0px;
      padding:0px;
      height:100%;
      overflow:hidden;
   }   
</style>
<script type="text/javascript" charset="utf-8">
	function init() {
		scheduler.config.multi_day = true;
		
		scheduler.init('scheduler_here',new Date(2019,8,10),"month");
		scheduler.load("./resources/common/events.json");

	}
	
	function show_minical(){
		if (scheduler.isCalendarVisible())
			scheduler.destroyCalendar();
		else
			scheduler.renderCalendar({
				position:"dhx_minical_icon",
				date:scheduler.getState().date,
				navigation:true,
				handler:function(date,calendar){
					scheduler.setCurrentView(date);
					scheduler.destroyCalendar()
				}
			});
	}    
</script>
<body onload="init();">
   <div id="scheduler_here" class="dhx_cal_container" style='width:100%; height:100%;'>
      <div class="dhx_cal_navline">
         <div class="dhx_cal_prev_button">&nbsp;</div>
         <div class="dhx_cal_next_button">&nbsp;</div>
         <div class="dhx_cal_today_button"></div>
         <div class="dhx_cal_date"></div>
         <div class="dhx_minical_icon" id="dhx_minical_icon" onclick="show_minical()">&nbsp;</div>
         <div class="dhx_cal_tab" name="day_tab" style="right:204px;"></div>
         <div class="dhx_cal_tab" name="week_tab" style="right:140px;"></div>
         <div class="dhx_cal_tab" name="month_tab" style="right:76px;"></div>
      </div>
      <div class="dhx_cal_header">
      </div>
      <div class="dhx_cal_data">
      </div>
   </div>
</body>
