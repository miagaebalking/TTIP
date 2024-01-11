<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>
<%@include file="modal/portfolioUpdateCategoryModal.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/28c3f049d0.js" crossorigin="anonymous"></script>
<!-- 부트스트랩 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- CSS 파일 -->
<link rel="stylesheet"
	href="${contextPath }/resources/css/portfolio.css">
</head>
<body>
	<script>
        var errorMsg = '<%= session.getAttribute("errorMsg") %>';
		
        if (errorMsg != 'null') {
            alert(errorMsg);
            
            <% session.removeAttribute("errorMsg"); %>
        }
        
    </script>
	
	<form action="portfolioUpdate.pf" enctype="multipart/form-data" method="post">
	<div class="mainArea">
		<div class="subArea">
			<div>
				<h3>${loginUser.userNickName}님의 포트폴리오</h3>
			</div>
			<div class="portfolio-service">
				<h5>서비스 종류</h5>
				<div class="service-wrapper">
					<div class="choosed">
						<h5 class="choosed">${portfolioCategory }</h5>
						<input type="hidden" name="detailNo" value="">
						<div class="edit">
                            <button class="editBtn"  data-bs-toggle="modal" data-bs-target="#portofolioSelectCategoryModal">변경</button>
                        </div>
<!-- 						<button class="choosed">변경</button> -->
					</div>
				</div>
			</div>
			<div class="portfolio-service">
				<h5>포트폴리오 제목</h5>
				<div class="service-wrapper">
					<input type="text" id="title" name="portfolioTitle" class="form-control"
						placeholder="포트폴리오 제목을 입력해주세요" maxlength="30px" required value="${pf.portfolioTitle }">
				</div>
				<div class="portfolioTitle">
					<div id="titleValid" class="titleValid">제목을 입력해주세요</div>
					<div class="titleLength" id="titleLength">0 / 30자</div> 
				</div>
			</div>
			<div class="portfolio-service">
				<h5>대표이미지 등록</h5>
				<div class="icon-wrap">
					<span><img alt="information" src="https://cdn2.iconfinder.com/data/icons/basic-office-snippets/170/Basic_Office-10-512.png" class="icon"></span> 
					<span class="reco">이미지는 가로, 세로 600px 이상1:1 비율로 권장합니다.</span> <br>
				</div>
				<div class="mainImg">
					<div class="mImg1">
						<img class="addMainImg" alt="대표사진추가"
							src="${contextPath }/${list[0].changeName}" id="realMainImgId">
						<button id="mImgDeleteBtn" type="button" class="btn-close mImgBtn" aria-label="Close"></button>
						<input type="file" class="mImgUpload" name="Images" onchange="imageUpload(this);" required>
					</div>
				</div>
			</div>
			<div class="portfolio-service">
				<h5>상세이미지 등록(1개 필수, 최대 8개)</h5>
				<div class="icon-wrap">
					<span><img alt="information"
						src="https://cdn2.iconfinder.com/data/icons/basic-office-snippets/170/Basic_Office-10-512.png"
						class="icon"></span>
					<span class="reco">최대 4MB의 JPG, PNG 이미지 파일을 업로드 할 수 있습니다.</span>
				</div>
				<div class="detailImgContainer">
					<div class="detailImg">
						<div class="addDeImg">
							<img class="addDeImg" alt="상세사진추가" id="addDeImg"
									src="resources/image/free-icon-font-add2.png">
						</div>
						<div class="dImg1 backImg">
								<img class="dImg1 imgBox" alt="상세사진추가" id="Img1"
									src="${contextPath }/${list[1].changeName}">
							<button id="dImgDeleteBtn1" type="button" class="btn-close dImgBtn btn1" aria-label="Close"></button>
						</div>
						
						<div class="dImg2 backImg">
							<img class="dImg2 imgBox" alt="상세사진추가" id="Img2"
								src="${contextPath }/${list[2].changeName}">
								<button id="dImgDeleteBtn2" type="button" class="btn-close dImgBtn btn2" aria-label="Close"></button>
						</div>
						
						<div class="dImg3 backImg">
								<img class="dImg3 imgBox" alt="상세사진추가" id="Img3"
								src="${contextPath }/${list[3].changeName}">
								<button id="dImgDeleteBtn3" type="button" class="btn-close dImgBtn btn3" aria-label="Close"></button>
						</div>
						
						<div class="dImg4">
<!-- 							<img class="over4 imgBox" alt="상세사진추가" id="Img4" -->
<!-- 								src=""> -->
								<button id="dImgDeleteBtn4" type="button" class="btn-close dImgBtn btn4" aria-label="Close"></button>
						</div>
						
						<div class="dImg5">					
<!-- 							<img alt="상세사진추가" class="over4 imgBox" id="Img5" src=""> -->
							<button id="dImgDeleteBtn5" type="button" class="btn-close dImgBtn btn5" aria-label="Close"></button>
						</div>
						
						<div class="dImg6">					
<!-- 							<img alt="상세사진추가" class="over4 imgBox" id="Img6" src=""> -->
							<button id="dImgDeleteBtn6" type="button" class="btn-close dImgBtn btn6" aria-label="Close"></button>
						</div>
						
						<div class="dImg7">					
<!-- 							<img alt="상세사진추가" class="over4 imgBox" id="Img7" src=""> -->
							<button id="dImgDeleteBtn7" type="button" class="btn-close dImgBtn btn7" aria-label="Close"></button>
						</div>
						
						<div class="dImg8">					
<!-- 							<img alt="상세사진추가" class="over4 imgBox" id="Img8" src=""> -->
							<button id="dImgDeleteBtn8" type="button" class="btn-close dImgBtn btn8" aria-label="Close"></button>
						</div>
					</div>
				</div>
			</div>
<!-- 			<input type="file" id="dImg1" name="Images" class="dImgUpload d1" onchange="dImageUpload(this,1);" required> -->
<!-- 			<input type="file" id="dImg2" name="Images" class="dImgUpload d2" onchange="dImageUpload(this,2);"> -->
<!-- 			<input type="file" id="dImg3" name="Images" class="dImgUpload d3" onchange="dImageUpload(this,3);"> -->
			<input type="file" id="dImg4" name="Images" class="dImgUpload d4" onchange="dImageUpload(this,4);">
			<input type="file" id="dImg5" name="Images" class="dImgUpload d5" onchange="dImageUpload(this,5);">
			<input type="file" id="dImg6" name="Images" class="dImgUpload d6" onchange="dImageUpload(this,6);">
			<input type="file" id="dImg7" name="Images" class="dImgUpload d7" onchange="dImageUpload(this,7);">
			<input type="file" id="dImg8" name="Images" class="dImgUpload d8" onchange="dImageUpload(this,8);">
			
			<input type="hidden" name="userNo" value="${loginUser.userNo}">
			<input type="hidden" name="detailName" value="${detailName }">
			<input type="hidden" name="dNo" id="dNo">
			
			<div class="portfolio-service"> 
				<div class="detailInfo">
					<h4>상세 정보</h4>
				</div>
				<h5>지역 정보</h5>
				<div class="service-wrapper">
					<input type="text" id="area" class="form-control" data-bs-toggle="modal"
						data-bs-target="#modal2" name="workArea" placeholder="시/군/구를 선택하세요" required readonly value="${pf.workArea }">

				</div>
				<div>
					<div class="areaValid">주소를 선택해주세요</div>
					<div class="modal" id="modal2" tabindex="-1">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title">지역 선택</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<p>지역을 선택해주세요</p>
									<ul>
										<li>강북구</li>
										<li>강남구</li>
										<li>강서구</li>
										<li>강동구</li>
										<li>노원구</li>
										<li>성북구</li>
										<li>광진구</li>
										<li>동대문구</li>
										<li>영등포구</li>
										<li>양천구</li>
										<li>금천구</li>
										<li>구로구</li>
										<li>은평구</li>
										<li>중구</li>
										<li>서대문구</li>
										<li>도봉구</li>
										<li>송파구</li>
										<li>서초구</li>
										<li>중랑구</li>
										<li>관악구</li>
										<li>동작구</li>
										<li>마포구</li>
										<li>용산구</li>
										<li>성동구</li>
										<li>성북구</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="portfolio-service"> 
				<div class="task">
					<div class="task-year">
					<h5>작업 연도</h5>
						<select class="form-control" name="workYear" id="year" required>
							
					 	</select> 
				 	</div>
					<div class="task-period">
				 	<h5>작업 소요기간</h5>
						<input class="form-control" id="periodNum" name="workPeriod" type="number" max="999" required value="${pf.workPeriod }">
						<div id="inputPeriod">0~999 사이의 숫자 입력</div>
					 	 
				 	</div>
				 	<div class="task-period">
				 		<div class="service-wrapper">
							<select class="form-control" name="periodUnit" required>
								<option>시간</option>
								<option>일</option>
								<option>주</option>
								<option>개월</option>
						 	</select>
					 	</div> 
				 	</div>
			 	</div>
			 	<div class="portfolio-service">
			 	<h5>상세 설명</h5>
					<textarea rows="" cols="" id="detail" name="explanation" class="form-control" placeholder="제공한 서비스의 상세한 설명을 작성해주세요.
ex)전/후 결과, 작업 과정 등" maxlength="100" required>${pf.explanation }</textarea>
					<div class="detailLength" id="detailLength">0 / 100자</div> 
			 	</div>
			 </div>
			 
			<div class="submit">
				<button type="submit" id="" class="btn btn-secondary update">수정하기</button>
				<button type="submit" class="btn btn-secondary update">삭제하기</button>
			</div>
		</div>
	</div>
	</form>
	
	<script type="text/javascript">
	
		var count = 3;
// 		var flag = true;
		document.addEventListener("DOMContentLoaded", function(){
				
// 				document.querySelector(".btn"+(1)).style.display = "inline-block";
// 				document.querySelector(".btn"+(2)).style.display = "inline-block";
// 				document.querySelector(".btn"+(3)).style.display = "inline-block";
					
// 				if('${list[0].changeName}'!=null){
// 					document.querySelector("#mImgDeleteBtn").style.display = "inline-block";
// 				}
				
				var titleInput = document.getElementById("title");
			    var titleLength = document.getElementById("titleLength");
			    var titleValid = document.getElementById("titleValid");

			    // 페이지 로드 시에도 실행되도록 초기 값 확인
			    updateTitleInfo();

			    // input 이벤트에 대한 리스너 등록
			    titleInput.addEventListener('input', function() {
			        updateTitleInfo();
			    });

			    function updateTitleInfo() {
			        var portfolioTitle = titleInput.value;

			        if (portfolioTitle.length > 0) {
			            titleValid.style.display = 'none';
			            titleLength.innerText = portfolioTitle.length + " / 30자";

			            if (portfolioTitle.length > 29) {
			                titleLength.style.color = "red";
			            } else {
			                titleLength.style.color = ""; // 적절한 경우에 색상을 초기화합니다.
			            }
			        } else {
			            titleValid.style.display = 'inline-block';
			            titleLength.innerText = "0 / 30자";
			            titleLength.style.color = "";
			        }
			    }
			    
			    var periodNum = document.getElementById("periodNum");
			    var inputPeriod = document.getElementById("inputPeriod");

			    // 페이지 로드 시에도 실행되도록 초기 값 확인
			    validatePeriodInput();

			    // input 이벤트에 대한 리스너 등록
			    periodNum.addEventListener('input', function (e) {
			        validatePeriodInput();
			    });

			    function validatePeriodInput() {
			        var inputValue = periodNum.value;

			        if (inputValue > 999 || inputValue < 0 || isNaN(inputValue)) {
			            periodNum.value = "";
			            inputPeriod.style.color = "red";
			        } else {
			            inputPeriod.style.color = "#8E8FFA";
			        }
			    }
			    
			    var detailInput = document.getElementById("detail");
			    var detailLength = document.getElementById("detailLength");

			    // 페이지 로드 시에도 실행되도록 초기 값 확인
			    updateDetailInfo();

			    // input 이벤트에 대한 리스너 등록
			    detailInput.addEventListener('input', function() {
			        updateDetailInfo();
			    });

			    function updateDetailInfo() {
			        var detail = detailInput.value;

			        if (detail.length > 0) {
			            detailLength.innerText = detail.length + " / 100자";

			            if (detail.length > 99) {
			                detailLength.style.color = "red";
			            } else {
			                detailLength.style.color = ""; // 적절한 경우에 색상을 초기화합니다.
			            }
			        } else {
			            detailLength.innerText = "0 / 100자";
			            detailLength.style.color = "";
			        }
			    }
			    
			    document.querySelector(".areaValid").style.display = "none";
			////////////////////////////////////////////////////////////////////// 절취선 ///////////////////
			
			
			var year = document.getElementById("year");
			
			var currentYear = new Date().getFullYear();
			
			var str = "";
			
			for(var i=1980; i<=currentYear; i++){
				str += "<option>"+i+"</option>";
			}
			year.innerHTML = str;
			
			
		});
	
		$(document).ready(function() {
			$("#modal2").on("click", ".modal-body li", function() {

				var selectedText = $(this).text();
				$("#area").val(selectedText);
				
				$(".areaValid").hide();
				
				$("#modal2").modal("hide");
			});
		});
		
		
		document.querySelector(".addMainImg").addEventListener('click',mImgHandler);
		
		function mImgHandler(){
			document.querySelector(".mImgUpload").click();
		}
		
		
		function imageUpload(inputFile){
			console.log(inputFile.files);
			
			console.log(inputFile.files.length);
			
			var reader = new FileReader();
			
			reader.readAsDataURL(inputFile.files[0]);

            reader.onload = function(e){
            	
				document.querySelector(".addMainImg").style.display = "none";
                
                document.querySelector("#mImgDeleteBtn").style.display = "inline-block";
                
// 	            document.querySelector(".mImgUpload").disabled = true;
				 
                var imgElement = document.createElement("img");

                imgElement.className = "addMainImg";
                imgElement.id = "mainImg";
                imgElement.alt = "대표사진추가";
                imgElement.src = e.target.result;

                var containerElement = document.querySelector(".mImg1");

                containerElement.appendChild(imgElement);
				
	            
            };
            
		}
		
		document.getElementById("mImgDeleteBtn").addEventListener("click", function(e){
			
			// console.log(e.target.id);
			document.querySelector("#realMainImgId").remove();
			
			document.querySelector(".addMainImg").style.display = "inline-block";
			
			document.querySelector("#mImgDeleteBtn").style.display = "none";
			
			
		});
		
		document.querySelector("#addDeImg").addEventListener("click", function(e){
			
			for(let i=4; i<=8; i++){

				if(document.querySelector("#dImgDeleteBtn"+i).style.display==""){
					document.getElementById("dImg"+i).click();
					break;
				}
			}
		});
		
		
// 		flag = false;
		
		function dImageUpload(inputFile,index){
			
// 			if(flag){
				
// 				count++
	    		
// 	    		if(count>=8){
// 					document.querySelector(".addDeImg").style.display = "none";
// 				}
	    		
// 		    	document.querySelector(".dImg"+index).style.display = "inline-block";
		    		
// 				var elementContainer = document.querySelector(".dImg"+index);
					
// 				var dImgElement = document.createElement("img");
					
// 				dImgElement.className = "dImg imgBox";
// 				dImgElement.alt = "상세사진추가";
// 				dImgElement.id = "Img"+index;
// 				dImgElement.src = '${contextPath}/'+'${list[index].changeName}';
					
// 				elementContainer.appendChild(dImgElement);
					
// 				document.querySelector(".btn"+index).style.display = "inline-block";
				
// 			}else{
				
				var reader = new FileReader();
				
				reader.readAsDataURL(inputFile.files[0]);
				
			    reader.onload = function(e){
			    	
			    	if(e.target.result != ""){
			    		
			    		count++
			    		
			    		if(count>=8){
							document.querySelector(".addDeImg").style.display = "none";
						}
			    		
				    	document.querySelector(".dImg"+index).style.display = "inline-block";
				    		
						var elementContainer = document.querySelector(".dImg"+index);
							
						var dImgElement = document.createElement("img");
							
						dImgElement.className = "dImg imgBox";
						dImgElement.alt = "상세사진추가";
						dImgElement.id = "Img"+index;
						dImgElement.src = e.target.result;
							
						elementContainer.appendChild(dImgElement);
							
						document.querySelector(".btn"+index).style.display = "inline-block";
			    	}
			    }
// 			}
		}
		
// 		window.onload = function(){
			
// 			for(var i=0; i<${list.size()}; i++){
				
// 				document.getElementById("dImg"+i).click();
				
// 			}
			
// 			flag = false;
			
// 		}
		
		for(let i=4; i<=8; i++){
			
			document.querySelector(".btn"+i).addEventListener("click",function(e){
				
				count--;

				document.querySelector(".addDeImg").style.display = "inline-block";
				
				document.getElementById("Img"+(i)).remove();
				
				document.querySelector(".dImg"+i).style.display = "none";
				
				document.querySelector(".btn"+(i)).style.display = "";
					
			});
		}
		
		
	</script>
	
	<%@include file="../common/footer.jsp"%>


</body>
</html>