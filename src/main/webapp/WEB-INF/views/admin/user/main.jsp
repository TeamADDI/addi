<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/template/admin/aSession.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/template/common/headMeta.jsp"%>
<link rel="stylesheet"
   href='<c:url value="/resources/css/admin/common.css"/>' />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
canvas {
	width: 100%;
	height: auto ;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/template/admin/nav.jsp"%>
	<div class="content container-md">
		<p class="title">통계 차트</p>
		<div class="row">
			<div class="col-md-4">
				<h3>예약별 그래프</h3>
				<canvas id="resvChart"></canvas>
			</div>
	    	<div class="col-md-1"></div>
			<div class="col-md-7">
				<h3>일별 가입자 수</h3>
				<canvas id="joinChart"></canvas>
			</div>
		</div><br><br>
		<div class="row">
			<div class="col-md-5">
				<h3>일별 결제 통계</h3>
				<canvas id="payChart"></canvas>
			</div>
			<div class="col-md-1"></div>
			<div class="col-md-6">
				<h3>장바구니</h3>
				<canvas id="cartChart"></canvas>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/template/common/footer.jsp"%>

	<script>
		$(function() {
			resvChart();
			joinChart();
			payChart();
			cartChart();
		});
		function joinChart() {
			$.ajax({
				url : "/joinchart",
				type : "POST",
				dataType : "json",
				contentType : "application/json; charset=utf-8",
				success : function(data) {
					var date = [];
					var count = [];

					$.each(data, function() {
						date.push(this["date"]);
						count.push(this["count"]);
					});
					const ctx = document.getElementById('joinChart')
							.getContext('2d');

					const myChart = new Chart(ctx, {
						type : 'bar',
						data : {
							labels : date, 
							datasets : [ {
								label : '회원가입 수', 
								data : count, 
								backgroundColor : 'lightblue',
								borderColor : 'lightblue',
								borderWidth : 2
							} ]
						},
						options : {
							indexAxis : 'y',
							scales : {
								y : {
									beginAtZero : true
								}
							},
							legend : {
								display : true,
								position : 'top',
								labels : {
									font : {
										size : 30
									}
								}
							}
						}
					});
				},
				error : function() {
					alert("회원가입 수 데이터를 가져오는데 실패했습니다.");
				}
			});
		}
		function resvChart() {
	        $.ajax({
	            url : "/resvchart",
	            type : "POST",
	            dataType : "json",
	            contentType : "application/json; charset=utf-8",
	            success : function(data) {
	                var category = [];
	                var rcount = [];

	                $.each(data, function() {
	                    category.push(this["category"]);
	                    rcount.push(this["count"]);
	                });
	                const ctx = document.getElementById('resvChart').getContext('2d');

	                const myChart = new Chart(ctx, {
	                    type : 'doughnut',
	                    data : {
	                        labels : ["미용", "돌봄", "진료"],
	                        datasets : [ {
	                            label : '이달의 예약수',
	                            data : rcount, 
	                            backgroundColor : [ 'rgba(54, 162, 235, 0.2)',
	                                'rgba(255, 206, 86, 0.2)', 'rgba(153, 102, 255, .2)' ],
	                            borderColor : [ 'rgba(54, 162, 235, 1)',
	                                    'rgba(255, 206, 86, 1)', 'rgba(153, 102, 255, .6)' ],
	                            borderWidth : 1
	                        } ]
	                    },
	                      options : {
	                         scales : {
	                            y : {
	                                beginAtZero : true
	                            }
	                        },
	                    }, 
	                });
	            },
	        });
	    }
		   function payChart() {
	           $.ajax({
	               url : "/paychart",
	               type : "POST",
	               dataType : "json",
	               contentType : "application/json; charset=utf-8",
	               success : function(data) {
	                   var payDate = [];
	                   var payCount = [];

	                   $.each(data, function() {
	                       payDate.push(this["payDate"]);
	                       payCount.push(this["payCount"]);
	                   });
	                   const ctx = document.getElementById('payChart').getContext('2d');

	                   const myChart = new Chart(ctx, {
	                       type : 'line',
	                       data : {
	                           labels : payDate,
	                           datasets : [ {
	                               label : '결제통계',
	                               data : payCount,
	                               borderColor: 'rgba(255, 99, 132, 1)',
	                               borderWidth: 2,
	                               fill: false
	                           }]
	                       },
	                         options : {
	                            scales : {
	                               y : {
	                                   beginAtZero : true
	                               }
	                           },
	                       }, 
	                   });
	               },
	           });
	       }
		   function cartChart() {
		         $.ajax({
		            url : "/cartchart",
		            type : "POST",
		            dataType : "json",
		            contentType : "application/json; charset=utf-8",
		            success : function(data) {
		               var itemCode = [];
		               var quantity = [];

		               $.each(data, function() {
		                  itemCode.push(this["itemcode"]);
		                  quantity.push(this["quantity"]);
		               });
		               const ctx = document.getElementById('cartChart')
		                     .getContext('2d');

		               const myChart = new Chart(ctx, {
		                  type : 'bar',
		                  data : {
		                     labels : itemCode,
		                     datasets : [ {
		                        label : '품목별상위항목',
		                        data : quantity, 
		                        backgroundColor : 'lightblue',
		                        borderColor : 'lightblue',
		                        borderWidth : 2
		                     } ]
		                  },
		                  options : {
		                     scales : {
		                        y : {
		                           beginAtZero : true
		                        }
		                     },
		                     legend : {
		                        display : true,
		                        position : 'top', // 범례 위치 (top, bottom, left, right)
		                        labels : {
		                           font : {
		                              size : 30
		                           // 범례 폰트 크기
		                           }
		                        }
		                     }
		                  }
		               });
		            },
		         });
		      }
	</script>
</body>
</html>
