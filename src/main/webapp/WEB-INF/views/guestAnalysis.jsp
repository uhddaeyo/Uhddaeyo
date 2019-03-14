<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jsp"%>
<%@ include file="/WEB-INF/include/include-css.jsp"%>
<title>Chart.js demo</title>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.js'></script>
</head>
<body>
	<%@include file="header.jsp"%>

<div class="container">
   <div class="row">
      <%@include file="/WEB-INF/include/menu.jsp"%>
      <div class="col-lg-9">

<br><br><br>
<div class="chart-container" style="position: relative; height:60vh; width:45vw">
	<div style="float: left; width: 50%; padding:10px;">
		<canvas id="genderCnt" width="400" height="350"></canvas>
		<br><br><br><br>
		<canvas id="starByGender" width="400" height="350"></canvas>
	</div>
	<div style="float: right; width: 50%; padding:10px;">
		<canvas id="ageCnt" width="400" height="350"></canvas>
		<br><br><br><br>
		<canvas id="starAll" width="400" height="350"></canvas>
	</div>
	<div id="footer">
		<!--<h4>Female avg : ${getGenderStat.get(0).avg} | Male avg : ${getGenderStat.get(1).avg}</h4>-->
	</div>
</div>
	<script>
    	/*성비 */
	    var Favg = ${getGenderStat.get(0).avg};
		var Mavg = ${getGenderStat.get(1).avg};
    	
    	Fcnt = ${getGenderStat.get(0).cnt};
		Mcnt = ${getGenderStat.get(1).cnt};
		
		var Fratio = Math.round(Fcnt/(Fcnt+Mcnt)*100);
		var Mratio = Math.round(Mcnt/(Fcnt+Mcnt)*100);
		
	    new Chart(document.getElementById("genderCnt"), {
	        type: 'doughnut',
	        data: {
	          labels: ["Female","Male"],
	          datasets: [{
	            //label: "Population (millions)",
	            backgroundColor: ["#D9230F", "#D9D9D9","#2782A3","#544542","#DA6F63"],
	            data: [Fratio, Mratio]
	          }]
	        },
	        options: {
	          title: {
	            display: true,
	            fontSize: 24,
	            text: 'Gender Ratio'
	          },
	          legend :{
	        	  position :'left'
	          }
	        
	        }
	    });
	    
	    /*나이 비율 */
	    new Chart(document.getElementById("ageCnt"), {
	        type: 'doughnut',
	        data: {
	          labels: ${getAgeStat.age},
	          datasets: [{
	            //label: "Population (millions)",
	            backgroundColor: ["#D9230F", "#D9D9D9","#2782A3","#544542","#DA6F63"],
	            data: ${getAgeStat.cnt}
	          }]
	        },
	        options: {
	          title: {
	            display: true,
	            fontSize: 24,
	            text: 'Age Ratio'
	          },
	          legend :{
	        	  position :'left'
	          }
	        }
	    });
	    
	    /*성별 별정평가*/
	    new Chart(document.getElementById("starByGender"), {
		    type: 'bar',
		    data: {
		      labels: ["1점","2점","3점","4점","5점"],
		      datasets: [
		        {
		          label: "Female",
		          backgroundColor: "#D9230F",
		          data: ${getFemaleStar}
		        }, {
		          label: "Male",
		          backgroundColor: "#D9D9D9",
		          data: ${getMaleStar}
		        }
		      ]
		    },
		    options: {
				title: {
		        display: true,
		        fontSize: 24,
		        text: 'Star Rating by Gender'
		      },
				scales: {
					yAxes: [{
	 	    	  		ticks: {
	 	    	  			beginAtZero:true
	 	    	  		}
	 	    	  	}]
	 	    	}
		    }
		});
	    
	    /*전체 별정평가*/
	    new Chart(document.getElementById("starAll"), {
		    type: 'bar',
		    data: {
		      labels:  ["1점","2점","3점","4점","5점"],
		      datasets: [
		        {
		          //label: "Population (millions)",
		          backgroundColor: "#D9230F",
		          data: ${getAllStar}
		        }
		      ]
		    },
		    options: {
		      legend: { display: false },
		      title: {
		        display: true,
		        fontSize: 24,
		        text: 'Star Rating'
		      },
		      scales: {
					yAxes: [{
	 	    	  		ticks: {
	 	    	  			beginAtZero:true
	 	    	  		}
	 	    	  	}]
	 	    	}
		    }
		});
	        
    </script>
	


				</div>
			</div>
		</div>
</body>
</html>