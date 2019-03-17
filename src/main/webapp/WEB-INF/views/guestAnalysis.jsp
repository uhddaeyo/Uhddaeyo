<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jsp"%>
<%@ include file="/WEB-INF/include/include-css.jsp"%>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.js'></script>
<title>고객 분석</title>
</head>

<body>
	<%@include file="header.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-lg-2" style="margin-top: 45px; margin-right: 30px">
			<div class="site-logo" style="font-family: Segoe Scrip;" align="center">
				<img class="menu-logo" src="resources/logoImage/menu1.jpg" width="130" height="50" />
			</div>
			<div class="list-group" style="text-align: center; margin-top: 30px;">
				<a href="${pageContext.request.contextPath}/host" class="list-group-item">가게정보</a>
				<a href="${pageContext.request.contextPath}/guestList" class="list-group-item"  style="text-align:center">고객현황</a>
				<a href="${pageContext.request.contextPath}/inviteList" class="list-group-item">초대현황</a>
				<a href="${pageContext.request.contextPath}/resvList" class="list-group-item">예약현황</a>
				<a href="${pageContext.request.contextPath}/review" class="list-group-item">가게리뷰</a>
				<a href="${pageContext.request.contextPath}/guestAnalysis}" class="list-group-item active">고객분석</a>
			</div>
	  </div>
			<div class="col-lg-9">

				<br>
				<br>
				<br>
				<div class="chart-container"
					style="position: relative; height: 60vh; width: 45vw">
					<div style="float: left; width: 50%; padding: 10px;">
						<canvas id="genderCnt" width="400" height="350"></canvas>
						<br>
						<br>
						<br>
						<br>
						<canvas id="starByGender" width="400" height="350"></canvas>
					</div>
					<div style="float: right; width: 50%; padding: 10px;">
						<canvas id="ageCnt" width="400" height="350"></canvas>
						<br>
						<br>
						<br>
						<br>
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
	          labels: ["여성","남성"],
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
	            fontFamily : '포천 오성과 한음 Regular',
	            text: '고객 성별 비율'
	          },
	          legend :{
	        	  position :'left'
	          }
	        
	        }
	    });
	    
	    
	    function add(accumulator, a) {
		    return accumulator + a;
		}
	    
	    const total = ${getAgeStat.cnt}.reduce(add);
		console.log(total)
	    let ageRatio = ${getAgeStat.cnt}.map(x => {return Math.round(x/total*100)});
		
	    /*나이 비율 */
	    new Chart(document.getElementById("ageCnt"), {
	        type: 'doughnut',
	        data: {
	          labels: ${getAgeStat.age},
	          datasets: [{
	            //label: "Population (millions)",
	            backgroundColor: ["#D9230F", "#D9D9D9","#2782A3","#544542","#DA6F63"],
	            data: ageRatio
	          }]
	        },
	        options: {
	          title: {
	            display: true,
	            fontSize: 24,
	            fontFamily : '포천 오성과 한음 Regular',
	            text: '고객 나이 비율'
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
		          label: "여성",
		          backgroundColor: "#D9230F",
		          data: ${getFemaleStar}
		        }, {
		          label: "남성",
		          backgroundColor: "#D9D9D9",
		          data: ${getMaleStar}
		        }
		      ]
		    },
		    options: {
				title: {
		        display: true,
		        fontSize: 24,
		        fontFamily : '포천 오성과 한음 Regular',
		        text: '성별 별점 평가'
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
		        fontFamily : '포천 오성과 한음 Regular',
		        text: '전체 별점 평가'
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