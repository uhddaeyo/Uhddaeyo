<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<%@ include file="/WEB-INF/include/include-header.jsp"%>
    <%@ include file="/WEB-INF/include/include-css.jsp"%>
    <title>Chart.js demo</title>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.js'></script>
</head>
<body>
<%@include file="header.jsp"%>
<div class="container">
      <%@include file="/WEB-INF/include/menu.jsp"%>
   <div class="row">
      <div class="col-lg-9">

    <canvas id="genderCnt" width="100" height="50"></canvas>    
    <canvas id="ageCnt" width="100" height="50"></canvas>
    <canvas id="starByGender" width="100" height="50"></canvas>
    <canvas id="starAll" width="100" height="50"></canvas>
    
    <script>
    	/*성비 */
	    var Favg = ${getGenderStat.get(0).avg};
		var Mavg = ${getGenderStat.get(1).avg};
    	
		console.log(Favg);
		console.log(Mavg);
		
    	Fcnt = ${getGenderStat.get(0).cnt};
		Mcnt = ${getGenderStat.get(1).cnt};
		
		console.log(Fcnt);
		console.log(Mcnt);
		
		
		var Fratio = Math.round(Fcnt/(Fcnt+Mcnt)*100);
		var Mratio = Math.round(Mcnt/(Fcnt+Mcnt)*100);
		
	    new Chart(document.getElementById("genderCnt"), {
	        type: 'pie',
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
	            text: 'Gender Ratio'
	          }
	        }
	    });
	    
	    /*나이 비율 */
	    new Chart(document.getElementById("ageCnt"), {
	        type: 'pie',
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
	            text: 'Age Ratio'
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
    <h3> Female avg : ${getGenderStat.get(0).avg}</h3>
	<h3> Male avg : ${getGenderStat.get(1).avg}</h3>
       
    
	</div>
</div>
</div>
</body>
</html>