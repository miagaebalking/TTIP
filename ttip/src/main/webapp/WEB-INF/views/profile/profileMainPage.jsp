<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../common/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <!-- 부트스트랩 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- swiper -->
    <link
		  rel="stylesheet"
		  href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"
		/>
    <link rel="stylesheet" href="${contextPath }/resources/css/profile/profileMainPage.css">
    <link rel="stylesheet" href="${contextPath }/resources/css/profile/fileUpload.css">
    <link rel="stylesheet" href="${contextPath }/resources/css/profile/categoryModal.css">
    <link rel="stylesheet" href="${contextPath }/resources/css/profile/profilePicture.css">
    <link rel="stylesheet" href="${contextPath }/resources/css/profile/review.css">
    
</head>
<body>

    <div class="allPage">
        <div class="all-container">
            <div class="bannerAndInfoContainer">
                <div class="profileInfo-wrapper">
                    <div class="item">
                        <h2>프로필사진</h2>
                        <div class="edit">
                            <button class="editBtn">수정</button>
                            <button class="saveBtn">저장</button>
                        </div>
                        <div class="workBox">
                            <div class="profileContainer">
							     <div class="upload">
							        <img src="https://i.pinimg.com/564x/88/3d/74/883d74b5eca63acc4e07773f3a645ba6.jpg" id="finalProfilePictureId">
							        <div class="round">
							            <button type="button"id="openProfilePictureModal" data-bs-toggle="modal" data-bs-target="#profilePictureUploadModal"></button>
							            <i class="fa-solid fa-camera" style="color: #fff;"></i>
							        </div>
							    </div>
                                <div class="profileDetailInfo">
                                    <div class="profileDetail-1">
                                        <ul class="reviewData">
                                            <li class="profile-item">
                                                <div>0</div>
                                                <div>리뷰평점</div>
                                            </li>
                                            <li class="profile-item dividerBox">
                                                <div class="divider"></div>
                                            </li>
                                            <li class="profile-item">
                                                <div>0</div>
                                                <div>리뷰수</div>
                                            </li>
                                            <li class="profile-item dividerBox">
                                                <div class="divider"></div>
                                            </li>
                                            <li class="profile-item">
                                                <div>0</div>
                                                <div>고용수</div>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="profileDetail-2">
                                        <a href="">활동분석</a>
                                        <a href="moveToPreviewProfile.pr?userNo=${loginUser.userNo}">미리보기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <hr>
                     <div class="item">
                        <h2>띱 활동명</h2>
                        <div class="edit">
                            <button class="editBtn" id="editNickName" onclick="editNickName();">수정</button>
                            <button class="saveBtn" id="saveNickName"
                            onclick="saveNickName();">저장</button>
                        </div>
                        <div class="workBox" id="workBox2">
                        	<div id="nickname-result">${loginUser.userNickName }</div>
	                        <div class="nickname-hidden-workBox">
		                        <input type="text" maxlength="30" id="nickname-box">
		                        <div class="maximumtextBox"><p  class="maxNumText"><span class="currNumber"id="currNumberOfNickname"></span>/30자</p></div>
	                        </div>
                        </div>
                    </div> 
                    <hr>
                    <div class="item">
                        <h2>대표서비스</h2>
                        <div class="edit"><button type="button"class="editBtn" data-bs-toggle="modal" data-bs-target="#mainCategoryModal">수정</button></div>
                        <div class="workBox">
                        	<div class="categery-container" id="mainCategoryContainerBox">
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="item">
                        <h2>제공 서비스</h2>
                        <div class="edit"><button type="button" class="editBtn" data-bs-toggle="modal" data-bs-target="#detailCategoryModal" >수정</button></div>
                        <div class="workBox">
                            <div class="categery-container" id="categoryContainerBox">
                                <button type="button" class="category-box"data-bs-toggle="modal" data-bs-target="#detailCategoryModal" id="serviceAdd">+ 서비스 추가</button>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="item">
                        <h2>한줄소개</h2>
                        <div class="edit">
                            <button class="editBtn" id="editOneLineBtn">수정</button>
                            <button class="saveBtn" id="saveOneLineBtn">저장</button>
                        </div>
                        <div class="workBox">
                        	<div id="introduce-result"></div>
	                        <div class="one-line-introduce-hidden-workBox">
	                        	<textarea maxlength="80"id="oneLineTextArea" class="profileTextArea"></textarea>
			                    <div class="maximumtextBox"><p class="maxNumText" ><span class="currNumber"id="currNumberOfOneLine"></span>/80자</p></div>
	                        </div>
                        </div>
                    </div>
                    <hr>
                    <div class="item">
                        <h2>활동 지역</h2>
                        <div class="edit">
                            <button class="editBtn" id="editAreaBtn"onclick="sample6_execDaumPostcode();">수정</button>
                            <button class="saveBtn" id="saveAreaBtn">저장</button>
                        </div>
                        <div class="workBox" id="sample6_address"></div>
                    </div>
                    <hr>
                    <div class="item">
                        <h2>연락 가능 시간</h2>
                        <div class="edit">
                            <button class="editBtn" id="editTimeBtn">수정</button>
                            <button class="saveBtn" id="saveTimeBtn">저장</button>
                        </div>
                        <div class="workBox">
                        	<div id="time-selected-result"></div>
                        	<div class="time-select-hidden-workBox" >
                        		<div class="selectTime">
                                <div class="startTime time-select-box">
                                    <select class="form-select" id="startTime"aria-label="Default select example">
                                        <option value></option>
                                        <option value="오전 12시">오전 12시</option>
                                        <option value="오전 1시">오전 1시</option>
                                        <option value="오전 2시">오전 2시</option>
                                        <option value="오전 3시">오전 3시</option>
                                        <option value="오전 4시">오전 4시</option>
                                        <option value="오전 5시">오전 5시</option>
                                        <option value="오전 6시">오전 6시</option>
                                        <option value="오전 7시">오전 7시</option>
                                        <option value="오전 8시">오전 8시</option>
                                        <option value="오전 9시" selected>오전 9시</option>
                                        <option value="오전 10시">오전 10시</option>
                                        <option value="오전 11시">오전 11시</option>
                                        <option value="오전 12시">오전 12시</option>
                                        <option value="오후 1시">오후 1시</option>
                                        <option value="오후 2시">오후 2시</option>
                                        <option value="오후 3시">오후 3시</option>
                                        <option value="오후 4시">오후 4시</option>
                                        <option value="오후 5시">오후 5시</option>
                                        <option value="오후 6시">오후 6시</option>
                                        <option value="오후 7시">오후 7시</option>
                                        <option value="오후 8시">오후 8시</option>
                                        <option value="오후 9시">오후 9시</option>
                                        <option value="오후 10시">오후 10시</option>
                                        <option value="오후 11시">오후 11시</option>
                                    </select>
                                </div>
                                <span>부터</span>
                                <div class="endTime time-select-box">
                                    <select class="form-select" id="endTime"aria-label="Default select example">
                                        <option value></option>
                                        <option value="오전 12시">오전 12시</option>
                                        <option value="오전 1시">오전 1시</option>
                                        <option value="오전 2시">오전 2시</option>
                                        <option value="오전 3시">오전 3시</option>
                                        <option value="오전 4시">오전 4시</option>
                                        <option value="오전 5시">오전 5시</option>
                                        <option value="오전 6시">오전 6시</option>
                                        <option value="오전 7시">오전 7시</option>
                                        <option value="오전 8시">오전 8시</option>
                                        <option value="오전 9시">오전 9시</option>
                                        <option value="오전 10시">오전 10시</option>
                                        <option value="오전 11시">오전 11시</option>
                                        <option value="오전 12시">오전 12시</option>
                                        <option value="오후 1시">오후 1시</option>
                                        <option value="오후 2시">오후 2시</option>
                                        <option value="오후 3시">오후 3시</option>
                                        <option value="오후 4시">오후 4시</option>
                                        <option value="오후 5시">오후 5시</option>
                                        <option value="오후 6시"selected>오후 6시</option>
                                        <option value="오후 7시">오후 7시</option>
                                        <option value="오후 8시">오후 8시</option>
                                        <option value="오후 9시">오후 9시</option>
                                        <option value="오후 10시">오후 10시</option>
                                        <option value="오후 11시">오후 11시</option>
                                    </select>
                                </div>
                                <span>까지</span>
                            </div>
                        </div>
                       </div>
                    </div>
                    <hr> 
                    <div class="item">
                        <h2>자격증 및 기타 서류 등록</h2>                       
<!--                         <div class="edit"> -->
<!--                             <button class="editBtn licenseEdit">수정</button> -->
<!--                         </div> -->
<!--                         <br> -->
                        <div class="edit">
                            <button class="saveBtn licenseSave">저장</button>
                        </div>
                        <div class="workBox" id="licenseWorkBox">
                        	<div class="icon-wrap">
								<span><img alt="information"
									src="https://cdn2.iconfinder.com/data/icons/basic-office-snippets/170/Basic_Office-10-512.png"
									class="icon"></span>
								<span class="reco">최대 4MB의 JPG, PNG 이미지 파일을 업로드 할 수 있습니다.</span>
							</div>
                        	<div class="detailImg">
                        		
                        		<div class="addDeImg">
                        			<img alt="상세사진추가" id="addDeImg" src="resources/image/free-icon-font-add.png">
                        		</div>
                        		<div class="dImg1 backImg">
									<button id="dImgDeleteBtn1" type="button" class="btn-close dImgBtn btn1" aria-label="Close"></button>                        		
                        		</div>
                        		<div class="dImg2 backImg">
                        			<button id="dImgDeleteBtn2" type="button" class="btn-close dImgBtn btn2" aria-label="Close"></button>
                        		</div>
                        		<div class="dImg3 backImg">
                        			<button id="dImgDeleteBtn3" type="button" class="btn-close dImgBtn btn3" aria-label="Close"></button>
                        		</div>
                        		<div class="dImg4">
                        			<button id="dImgDeleteBtn4" type="button" class="btn-close dImgBtn btn4" aria-label="Close"></button>
                        		</div>
                        		<div class="dImg5">
                        			<button id="dImgDeleteBtn5" type="button" class="btn-close dImgBtn btn5" aria-label="Close"></button>
                        		</div>
                        		<div class="dImg6">
                        			<button id="dImgDeleteBtn6" type="button" class="btn-close dImgBtn btn6" aria-label="Close"></button>
                        		</div>
                        		<div class="dImg7">
                        			<button id="dImgDeleteBtn7" type="button" class="btn-close dImgBtn btn7" aria-label="Close"></button>
                        		</div>
                        		<div class="dImg8">
                        			<button id="dImgDeleteBtn8" type="button" class="btn-close dImgBtn btn8" aria-label="Close"></button>
                        		</div>
                        		
                        		
                        		<input type="file" id="dImg1" name="Images" class="dImgUpload d1" onchange="dImageUpload(this,1);">
								<input type="file" id="dImg2" name="Images" class="dImgUpload d2" onchange="dImageUpload(this,2);">
								<input type="file" id="dImg3" name="Images" class="dImgUpload d3" onchange="dImageUpload(this,3);">
								<input type="file" id="dImg4" name="Images" class="dImgUpload d4" onchange="dImageUpload(this,4);">
								<input type="file" id="dImg5" name="Images" class="dImgUpload d5" onchange="dImageUpload(this,5);">
								<input type="file" id="dImg6" name="Images" class="dImgUpload d6" onchange="dImageUpload(this,6);">
								<input type="file" id="dImg7" name="Images" class="dImgUpload d7" onchange="dImageUpload(this,7);">
								<input type="file" id="dImg8" name="Images" class="dImgUpload d8" onchange="dImageUpload(this,8);">
                        	</div>
                        </div>
                    </div>
                    <hr>
                    <div class="item">
                        <h2>고수 서비스 상세설명</h2>
                        <div class="edit">
                            <button class="editBtn" id="editDetailServiceBtn">수정</button>
                            <button class="saveBtn" id="saveDetailServiceBtn" onclick="return detailDescripFunctions();">저장</button>
                        </div>
                        <div class="workBox">
                        	<div id="detail-description-result"></div>
	                        <div class="detail-description-hidden-workBox">
	                        	<textarea maxlength="5000"id="detailDescriptionTextArea" class="profileTextArea"></textarea>
			                    <div class="maximumtextBox">
			                    	<div class="maxiMumTextItem">
				                   		<div id="minNumAlertMsg" style="display:none;">30자 이상 입력해주세요.</div>
			                    	</div>
			                    	<div class="maxiMumTextItem">
				                   		<div id="minNum30">
					                    	<p class="maxNumText" id="detailDescMinTextNum">
					                    		최소 30자
					                    	</p>
					                    	<i class="fa-solid fa-check" id="checkIcon"></i>
				                    	</div>
			                    	</div>
			                    </div>
	                        </div>
                        </div>
                    </div>
                    <hr>
                    <div class="item">
                        <h2>포트폴리오</h2>
                        <div class="edit">
                            <button class="editBtn"  data-bs-toggle="modal" data-bs-target="#portofolioSelectCategoryModal">등록하기</button>
                        </div>
                        <div class="workBox"></div>
                    </div>
                    <hr>
                    <div class="item">
                        <h2>사진 및 동영상</h2>
                        <div class="edit">
                            <button class="editBtn" data-bs-toggle="modal" data-bs-target="#uploadPicture">수정</button>
                            <button class="saveBtn">저장</button>
                        </div>
                        <div class="workBox" id="imageVideoContainer">
                        	
                        </div>
                    </div>
                    <hr>
                    <div class="item">
                        <h2>질문답변</h2>
                        <div class="edit">
                            <button class="editBtn" id="questionEnrollBtn" onclick="showAnswerBox();">등록하기</button>
                            <button class="saveBtn" id="questionSaveBtn">저장</button>
                        </div>
                        <div class="workBox" >
                        	<div class="answered-box-result">
	                        	<ul id="answered-box-ul">
	                        		<li>
	                        			<div class="question-box">Q. 서비스가 시작되기 전 어떤 절차로 진행하나요?</div>
                        				<div class="answered-item"id="startServiceId"></div>
	                        		</li>
                        			<li>
		                        		<div class="question-box">Q. 어떤 서비스를 전문적으로 제공하나요?</div>
		                        		<div class="answered-item"id="specialListId"></div>
	                        		</li>
	                        		<li>
		                        		<div class="question-box">Q. 서비스의 견적은 어떤 방식으로 산정 되나요?</div>
		                        		<div class="answered-item"id="methodId"></div>
	                        		</li>
	                        		<li>
		                        		<div class="question-box">Q. 완료한 서비스 중 대표적인 서비스는 무엇인가요? 소요 시간은 얼마나 소요 되었나요?</div>
		                        		<div class="answered-item"id="whatisMainCategoryId"></div>
	                        		</li>
	                        		<li>
		                        		<div class="question-box">Q. A/S 또는 환불 규정은 어떻게 되나요?</div>
		                        		<div class="answered-item"id="whatisreturnId"></div>
	                        		</li>
	                        	</ul>
                        	</div>
                            <div class="question-hidden-workBox">
                                <ul>
                                    <li>
                                        <div class="question-box">Q. 서비스가 시작되기 전 어떤 절차로 진행하나요?</div>
                                        <input type="hidden" value="1">
                                        <textarea id="firstAnswerBox"name="answerBox" rows="6"placeholder="상담, 예약, 서비스 진행, 대금 납부까지 어떻게 진행하는지 자세히 적어주세요."></textarea>
                                    </li>
                                    <li>
                                        <div class="question-box">Q. 어떤 서비스를 전문적으로 제공하나요?</div>
                                        <input type="hidden" value="2">
                                        <textarea name="answerBox" rows="6" placeholder="제공하는 서비스를 조금 더 구체적으로 설명해주세요."></textarea>
                                    </li>
                                    <li>
                                        <div class="question-box">Q. 서비스의 견적은 어떤 방식으로 산정 되나요?</div>
                                        <input type="hidden" value="3">
                                        <textarea name="answerBox" rows="6" placeholder="답변을 추가해주세요."></textarea>
                                    </li>
                                    <li>
                                        <div class="question-box">Q. 완료한 서비스 중 대표적인 서비스는 무엇인가요? 소요 시간은 얼마나 소요 되었나요?</div>
                                        <input type="hidden" value="4">
                                        <textarea name="answerBox" rows="6" placeholder="답변을 추가해주세요."></textarea>
                                    </li>
                                    <li>
                                        <div class="question-box">Q. A/S 또는 환불 규정은 어떻게 되나요?</div>
                                        <input type="hidden" value="5">
                                        <textarea name="answerBox" rows="6" placeholder="답변을 추가해주세요."></textarea>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="item">
                        <h2>리뷰</h2>
                        <div class="edit">
                            <button class="editBtn">수정</button>
                            <button class="saveBtn">저장</button>
                        </div>
                        <div class="workBox" id="reviewWorkBoxId">
                        	
                        </div>
                    </div>
                    <hr>
                </div>
                <div class="banner-wrapper">
                    <div class="bannerContainer">
                        <div class="banner-item">
                            <div class="profilePercentageBanner">
                                <h2> 프로필 완성도 <span class="barPercentage" id="barPercentageText"></span></h2>
                                <div class="edit"></div>
                                <div class="workBox">
                                    <div class="progressContainer">
                                        <div id="progress">
                                            <div id="bar"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="profilePercentageBanner">
                                <!-- Slider main container -->
									<div class="swiper">
									  <!-- Additional required wrapper -->
									  <div class="swiper-wrapper">
									    <!-- Slides -->
									    <div id="slide1"class="swiper-slide"><p>눈길을 끌 수 있는 프로필을 만들어보아요! </p><button class="insideSlideBtn"type="button"data-bs-toggle="modal" data-bs-target="#profilePictureUploadModal">사진 등록하기</button></div>
									    <div id="slide2"class="swiper-slide"><p>나의 전문성을 보여줄 수 있는 대표서비스를 정해보아요</p><button class="insideSlideBtn"type="button"data-bs-toggle="modal" data-bs-target="#mainCategoryModal">대표서비스 등록하기</button></div>
									    <div id="slide3"class="swiper-slide"><p>여러재능을 보여주세요!</p><button class="insideSlideBtn"type="button" data-bs-toggle="modal" data-bs-target="#detailCategoryModal">제공서비스 작성</button></div>
									    <div id="slide4"class="swiper-slide"><p>다른 회원들에게 자신을 어필할수 있는 상세설명</p><button class="insideSlideBtn"type="button" id="editDetailServiceBtnSlide">상세설명 작성</button></div>
									    <div id="slide5"class="swiper-slide"><p>주변에 있는 사람들과 빠른매칭을 원한다면 지역선택!</p><button class="insideSlideBtn"type="button" onclick="sample6_execDaumPostcode();">활동지역 선택</button></div>
									    <div id="slide6"class="swiper-slide"><p>한줄로 자신을 표현해보아요</p><button class="insideSlideBtn"type="button" id="editOneLineBtnSlide">한줄소개 작성</button></div>
									    <div id="slide7"class="swiper-slide"><p>방해받고 싶지 않은 시간대를 정해요</p><button class="insideSlideBtn"type="button" id="editTimeBtnSlide">연락가능 시간설정</button></div>
									    <div id="slide8"class="swiper-slide"><p>자신의 전문성을 입증해보아요!</p><button class="insideSlideBtn"type="button" id="">자격증 등록</button></div>
									    <div id="slide9"class="swiper-slide"><p>자신이 경험했던 것들을 올려보아요</p><button class="insideSlideBtn"type="button" id="">포트폴리오 등록</button></div>
									    <div id="slide10"class="swiper-slide"><p>주목을 끌 수 있는 사진들을 참고해보세요</p><button class="insideSlideBtn"type="button" data-bs-toggle="modal" data-bs-target="#uploadPicture">사진/동영상 등록</button></div>
									    <div id="slide11"class="swiper-slide"><p>궁금한 것들을 미리 적어놓아요</p><button class="insideSlideBtn"type="button" onclick="showAnswerBox();">질문답변 작성</button></div>
									    
									  </div>
									  
			                           
									  <!-- If we need pagination -->
									  <div class="swiper-pagination"></div>
									
									  <!-- If we need scrollbar -->
									  <div class="swiper-scrollbar"></div>
									</div>
                            </div>
                            
                        </div>
                        <div class="banner-item">
                           <div class="reviewMember">
                                <h2>리뷰를 남겨보아요!</h2>
                           </div>
                           <div class="reviewMember">
                                <div class="exchangedMember">프로필1</div>
                                <div class="exchangedMember">프로필2</div>
                                <div class="exchangedMember">프로필3</div>
                                <div class="exchangedMember">프로필4</div>
                           </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
   
    <input type="hidden" class="comepleteOrNot" id="profilePictureComplete">
    <input type="hidden" class="comepleteOrNot" id="mainCategoryComplete">
    <input type="hidden" class="comepleteOrNot" id="subCategoryComplete">
    <input type="hidden" class="comepleteOrNot" id="detailDescriptionComplete">
    <input type="hidden" class="comepleteOrNot" id="areaComplete">
    <input type="hidden" class="comepleteOrNot" id="oneLineComplete">
    <input type="hidden" class="comepleteOrNot" id="phoneAvailableComplete">
    <input type="hidden" class="comepleteOrNot" id="licenseComplete">
    <input type="hidden" class="comepleteOrNot" id="porfolioComplete">
    <input type="hidden" class="comepleteOrNot" id="imageVideoComplete">
    <input type="hidden" class="comepleteOrNot" id="questionComplete">
   
    <%@include file="modal/detailCategoryModal.jsp" %>
    <%@include file="modal/mainCategoryModal.jsp" %>
    <%@include file="modal/profilePictureUploadModal.jsp"%>
    <%@include file="modal/portfolioSelectCategoryModal.jsp" %>
    <%@include file="imageUpload.jsp" %>
    
    <input type="hidden" id="userNo" value="${loginUser.userNo }">
    <input type="hidden" id="email" value="${loginUser.email }">
    <input type="hidden" id="contextPath" value="${contextPath }">
    <input type="hidden" id="profileNo" >
    <input type="hidden" id="changeName">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="${contextPath }/resources/js/profile/profileMainPage.js"></script>
    <script src="${contextPath }/resources/js/profile/imageVideo.js"></script>
    <script src="${contextPath }/resources/js/profile/banner.js"></script>
    <script src="${contextPath }/resources/js/profile/detailCategory.js"></script>
    <script src="${contextPath }/resources/js/profile/onload.js"></script>
    <script src="${contextPath }/resources/js/profile/mainCategory.js"></script>
    <script src="${contextPath }/resources/js/announcement.js"></script>
    <script src="${contextPath }/resources/js/profile/kakaoFindingAddressAPI.js"></script>
    <script src="${contextPath }/resources/js/profile/profilePicture.js"></script>
    
    <script>
    document.querySelector("#addDeImg").addEventListener("click", function(e){
		
		for(let i=1; i<=8; i++){

			if(document.querySelector("#dImgDeleteBtn"+i).style.display==""){
				document.getElementById("dImg"+i).click();
				break;
			}

		}
		
	});
    
    var count = 0;
    
    var resultList;
	
	function dImageUpload(inputFile,index){
		
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
	    
	}
	
	function getList(resultList) {
		
		if(resultList.length!=0){
			for(let i=0; i<resultList.length; i++){
				document.querySelector(".btn"+(i+1)).addEventListener("click",function(e){
					if(confirm("정말 삭제하시겠습니까?")){
						$.ajax({
							url : "deleteLicenseImage.pr",
							data : {"atNo" : resultList[i].atNo},
							success : function(result){
								if(result>0){
									
									count--;
			
									document.querySelector(".addDeImg").style.display = "inline-block";
									
// 									document.getElementById("Img"+(i+1)).remove();
									
									document.querySelector(".dImg"+(i+1)).style.display = "none";
									
									document.querySelector(".btn"+(i+1)).style.display = "";
									
									alert("삭제 완료");
									
									location.reload();
								}
							},
							error : function(){
								console.log("통신오류");
							}
						});
					}
						
				});
			}
			for(let j=resultList.length; j<9; j++){
				
					
				document.querySelector(".btn"+(j)).addEventListener("click",function(e){
						
					count--;
			
					document.querySelector(".addDeImg").style.display = "inline-block";
										
					document.getElementById("Img"+(j)).remove();
									
					document.querySelector(".dImg"+(j)).style.display = "none";
					
					document.querySelector(".btn"+(j)).style.display = "";
					
				});			
			}
			
		}else{
			for(let i=1; i<9; i++){
				document.querySelector(".btn"+(i)).addEventListener("click",function(e){
					
					count--;
		
					document.querySelector(".addDeImg").style.display = "inline-block";
									
					document.getElementById("Img"+(i)).remove();
								
					document.querySelector(".dImg"+(i)).style.display = "none";
								
					document.querySelector(".btn"+(i)).style.display = "";
								
				});			
						
			}
		}
		
	}
	document.querySelector(".saveBtn.licenseSave").addEventListener("click",function(){
		
		var formData = new FormData();
		
		formData.append("userNo",${loginUser.userNo});
		
		for(let i=1; i<=8; i++){
			
			var saveFile = document.getElementById("dImg"+i).files[0];
			
			if(saveFile != null){
				formData.append("saveFile",saveFile);
			}		    	
		}
		
		$.ajax({
			
			url : "licenseSave.pr",
			method : "POST",
			data : formData,
			processData: false,
		    contentType: false,
			success : function(resultList){
				alert("저장 완료");
				location.reload();
			},
			error : function(){
				alert("저장할 내용이 없습니다.");
				console.log("통신오류");
			}
			
		});
		
		
	});
    
	document.addEventListener('DOMContentLoaded', function() {
	    
		document.querySelector(".saveBtn.licenseSave").style.display="inline-block";
		
		//8번째 이미지까지 모두 차있다면 저장 버튼 지워주기
		if(document.querySelector("#dImgDeleteBtn1").style.display!="" && document.querySelector("#dImgDeleteBtn8").style.display!=""){
			document.querySelector(".saveBtn.licenseSave").style.display="none";
		}
		
	});
	
// 	document.querySelector(".editBtn.licenseEdit").addEventListener("click", function(){
// 		console.log("수정버튼 클릭");
// 	});
	
	window.onload = function(){
		
		$.ajax({
			
			url : "selectLicenseList.pr",
			data : {userNo : ${loginUser.userNo}},
			success : function(list){
				//전역변수에 할당해주기
				resultList = list;
				//삭제에 atNo사용하기 위해 메소드에 매개변수로 보내주기
				getList(resultList);
				
				for(var i=0; i<list.length; i++){
					if(list[i].changeName != null){
						
						count++
			    		
						console.log(count);
						
			    		if(count>=8){
							document.querySelector(".addDeImg").style.display = "none";
						}
						
				    	document.querySelector(".dImg"+(i+1)).style.display = "inline-block";
				    		
						var elementContainer = document.querySelector(".dImg"+(i+1));
							
						var dImgElement = document.createElement("img");
							
						dImgElement.className = "dImg imgBox";
						dImgElement.alt = "자격증이미지";
						dImgElement.id = "Img"+i;
						dImgElement.src = list[i].changeName;
							
						elementContainer.appendChild(dImgElement);
						
						document.querySelector(".btn"+(i+1)).style.display = "inline-block";
						
			    	}
				}
				
			},
			error : function(){
				console.log("통신오류");
			}
		})
		
	}


	
	
    </script>


    
<%--     <script src="${contextPath }/resources/js/profile/barPercentage.js"></script> --%>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>