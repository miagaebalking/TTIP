<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.portfolioSelectedCategory input[name='portfolioCategory']{
		width: 20px;
		height: 20px;
		appearance: none; /* 기본 스타일 제거 (크로스 브라우징을 위해 필요) */
      border: 2px solid black; /* 테두리 색상 */
      border-radius: 50%; /* 원형 모양으로 만듭니다. */
      outline: none; /* 선택 효과 제거 */
      margin-right: 5px; /* 여백을 조절합니다. */
	}
	.portfolioSelectedCategory input[name='portfolioCategory']:hover,
	.portfolioSelectedCategory input[name='portfolioCategory']+label:hover{
		cursor: pointer;
	}
	
	.portfolioSelectedCategory input[name='portfolioCategory']:checked{
		background-color: #7752FE;
	}
	#portfolioSelectedCategoryBox{
		font-size: 20px;
	}
	#portfolioSelectedCategoryBox .portfolioSelectedCategory{
		margin-bottom: 20px;
	}
</style>
</head>
<body>
	<!-- 대표서비스, 제공서비스 모달 -->
        <div class="modal fade" id="portofolioSelectCategoryModal" tabindex="-1" aria-labelledby="portfolioModalLabel" aria-hidden="true">
            <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                <h1 class="modal-title fs-5" id="portofolioModalLabel">서비스를 선택하세요</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div id="portofolioSelectCategoryId" class="mainCategoryWrap">
	                <div class="modal-body">
	                	<form method="get" action="portfolio.pf">
					        <div class="wrap" id="portfolio-category-list">
					            <div class="category" id="portfolioSelectedCategoryBox">
					            	
					            </div>
					        </div>
			                <div class="modal-footer">
			                <button type="submit" class="btn">이동</button>
			              </div>
			             </form>
	            	</div>
		        </div>
            </div>
        </div>
    </div>
</body>
</html>