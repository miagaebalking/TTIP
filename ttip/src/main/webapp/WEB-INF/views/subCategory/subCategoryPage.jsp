<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../common/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${contextPath }/resources/css/subCategory/subCategory.css">
    
	    
</head>
<body>
    <div class="finalAllContainer">
        <div class="searchBarBox">
            <div class="searchBarContainer">
                <div class="seachBarItem"><h1>운동 서비스</h1></div>
                <div class="seachBarItem"><p>지금 띱과 함께 시작해보세요</p></div>
                <div class="seachBarItem">
                    <div class="searchInput">
                        <input type="text" name="" id="" class="searchBar">
                        <button class="searchBarBtn"><i class="fa-solid fa-magnifying-glass" id="searchIcon"></i> 찾기</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="allContainer">
            <section class="mainContainer">
                <div class="mainCategoryNaviBarBox">
                    <ul>
                        <li class="mainCategoryItem">
                            <div class="hover03" onclick="navigateToAnnounceMentList(1)">
                                <img src="${contextPath }/resources/main/sports.png" class="btnImg">
                                <p class="mainCategoryName">스포츠</p>
                            </div>
                        </li>
                        <li class="mainCategoryItem">
                            <div class="hover03" onclick="navigateToAnnounceMentList(2)">
                                <img src="${contextPath }/resources/main/dance.png" class="btnImg">
                                <p class="mainCategoryName">댄스</p>
                            </div>
                        </li>
                        <li class="mainCategoryItem">
                            <div class="hover03" onclick="navigateToAnnounceMentList(3)">
                                <img src="${contextPath }/resources/main/language.png" class="btnImg">
                                <p class="mainCategoryName">외국어</p>
                            </div>
                        </li>
                        <li class="mainCategoryItem">
                            <div class="hover03" onclick="navigateToAnnounceMentList(4)">
                                <img src="${contextPath }/resources/main/music.png" class="btnImg">
                                <p class="mainCategoryName">음악</p>
                            </div>
                        </li>
                        <li class="mainCategoryItem">
                            <div class="hover03" onclick="navigateToAnnounceMentList(5)">
                                <img src="${contextPath }/resources/main/hobby.png" class="btnImg">
                                <p class="mainCategoryName">취미</p>
                            </div>
                        </li>
                        <li class="mainCategoryItem">
                            <div class="hover03" onclick="navigateToAnnounceMentList(6)">
                                <img src="${contextPath }/resources/main/picture.png" class="btnImg">
                                <p class="mainCategoryName">사진</p>
                            </div>
                        </li>
                        <li class="mainCategoryItem">
                            <div class="hover03" onclick="navigateToAnnounceMentList(7)">
                                <img src="${contextPath }/resources/main/art.png" class="btnImg">
                                <p class="mainCategoryName">학업</p>
                            </div>
                        </li>
                        <li class="mainCategoryItem">
                            <div class="hover03" onclick="navigateToAnnounceMentList(8)">
                                <img src="${contextPath }/resources/main/sports.png" class="btnImg">
                                <p class="mainCategoryName">연기</p>
                            </div>
                        </li>
                    </ul>
                </div>
            </section>
            <section class="mainContainer">
                <div class="portfolioBannerBox">
                    <div class="portfolioBannerContainer">

                    </div>
                </div>
            </section>
            <section class="mainContainer">
                <div class="titleBox">
                    <h2>서비스</h2>
                </div>
                <div class="subCategoryListBox">
                	<c:forEach var="s" items="${subCategory }">
                		<div class="subCategoryItem" onclick="selectAnnounceList(${s.detailNo},'${s.detailName }','${s.categoryName }')">
                            <div class="cardImg">
                                <img src="${s.image }" alt="" class="subCategoryImage">
                            </div>
                            <div class="subCategoryName">
                                <h4>${s.detailName }</h4>
                            </div>
                    	</div>
                	</c:forEach>
                </div>
            </section>
            <section class="mainContainer">
                <div class="titleBox">
                    <h2>인기 포트폴리오</h2>
                </div>
                <div class="portfolioListBox">
                    <div class="portfolioBox">
                        <div class="portfolioPicture">
                            <div class="portfolioInfo">
                                <h3></h3>
                                <p></p>
                            </div>
                        </div>
                        <div class="nameAndProfile">
                            <div class="smallProfilePicture"></div>
                            <span class="nickname"></span>
                        </div>
                    </div>
                    <div class="portfolioBox">
                        <div class="portfolioPicture">
                            <div class="portfolioInfo">
                                <h3></h3>
                                <p></p>
                            </div>
                        </div>
                        <div class="nameAndProfile">
                            <div class="smallProfilePicture"></div>
                            <span class="nickname"></span>
                        </div>
                    </div>
                    <div class="portfolioBox">
                        <div class="portfolioPicture">
                            <div class="portfolioInfo">
                                <h3></h3>
                                <p></p>
                            </div>
                        </div>
                        <div class="nameAndProfile">
                            <div class="smallProfilePicture"></div>
                            <span class="nickname"></span>
                        </div>
                    </div>
                    <div class="portfolioBox">
                        <div class="portfolioPicture">
                            <div class="portfolioInfo">
                                <h3></h3>
                                <p></p>
                            </div>
                        </div>
                        <div class="nameAndProfile">
                            <div class="smallProfilePicture"></div>
                            <span class="nickname"></span>
                        </div>
                    </div>
                    <div class="portfolioBox">
                        <div class="portfolioPicture">
                            <div class="portfolioInfo">
                                <h3></h3>
                                <p></p>
                            </div>
                        </div>
                        <div class="nameAndProfile">
                            <div class="smallProfilePicture"></div>
                            <span class="nickname"></span>
                        </div>
                    </div>
                    <div class="portfolioBox">
                        <div class="portfolioPicture">
                            <div class="portfolioInfo">
                                <h3></h3>
                                <p></p>
                            </div>
                        </div>
                        <div class="nameAndProfile">
                            <div class="smallProfilePicture"></div>
                            <span class="nickname"></span>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp" />
   	<script>
    	function navigateToAnnounceMentList(categoryNo){
    	 	
    	 	window.location.href = "${contextPath }/moveToSubCategory.an?categoryNo="+categoryNo;
    	 
     	}
    	
    	function selectAnnounceList(detailNo,detailName,categoryName){
    		console.log('announce에 들어왔어');
    		console.log('detailNo:',detailNo);
    		console.log('detailName:',typeof(detailName));
    		console.log('categoryName:',categoryName);
    		window.location.href = "${contextPath }/selectAnnounceList.an?detailNo="+detailNo+"&detailName="+detailName+"&categoryName="+categoryName;
    	}
    </script>
</body>
</html>