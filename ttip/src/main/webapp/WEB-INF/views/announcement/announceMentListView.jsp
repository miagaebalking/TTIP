<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TTIP</title>
    
    <!-- jQuery library -->
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    
    <!-- 부트스트랩 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/annoucement/annoucementList.css">
	
	
</head>
<body>

    <!-- 헤더바 -->
    <%@include file="../common/header.jsp" %>

	
	<div id="list">
		
        <div id="title">
            <h1>공고리스트</h1>
        </div>

        <div id="category">
            <select class="form-select" aria-label="Default select example" id="main">
                <option selected>메인 카테고리</option>
                <option value="1">스포츠</option>
                <option value="2">악기</option>
                <option value="3">댄스</option>
              </select>
              <select class="form-select" aria-label="Default select example" id="sub">
                <option selected>세부 카테고리</option>
                <option value="1">One</option>
                <option value="2">Two</option>
                <option value="3">Three</option>
              </select>
        </div>
        <div>
        
            <div id="searchBarDiv">
                <input type="text" placeholder="검색창" id="searchBar"><button id="searchBtn">검색</button>
            </div>
			
            <div id="announceList">
				<c:forEach var="a" items="${list }">
	                <div class="announce">
	                    <div class="userName">${a.userNickname }</div>
	                    <div class="announceInfo">★${a.reviewAverage } ${categoryName } · ${detailName } · 양천구</div>
	                    <div class="userText">축구를 알려드릴수있습니다. 배우고싶은 취미는 아무거나 괜찮습니다^^ 편하게 채팅주세요</div>
	                </div>
	                <div class="userImgDiv"><img src="${contextPath }/${a.changeName}" class="userImg"></div>
				</c:forEach>
				
    			<div class='reviewBox'>
					<div class='reviewContainer'>
						<div class='reviewItem'>           
							<div class='reviewProfile'>
								<img src='"+$('#contextPath').val()+'/'+reviewList[i].changeName+"' class='finalSmallProfileImg'>"
							</div>
							<div class='userNickname'>${a.userNickname }</div>
							<div class='reviewStar'>
								<p class='star-point"+i+"'>★${a.reviewAverage }(${a.reviewCount}) · ${categoryName } · ${detailName } · ${a.address }</p>
							</div>          
						</div>            
						<div class='reviewItem'>            
							<p class='reviewContent'>${a.oneLineIntroduce }</p>                
						</div>           
					</div>   
		   		</div>
            </div>



        </div>
	
	</div>

    <!-- 푸터 -->
    <jsp:include page="../common/footer.jsp"/>

</body>
</html>