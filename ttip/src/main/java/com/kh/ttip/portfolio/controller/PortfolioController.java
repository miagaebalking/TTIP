package com.kh.ttip.portfolio.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.ttip.announcement.model.vo.DetailCategory;
import com.kh.ttip.portfolio.model.service.PortfolioService;
import com.kh.ttip.portfolio.model.vo.Portfolio;
import com.kh.ttip.portfolio.model.vo.PortfolioImage;
import com.kh.ttip.profile.model.vo.Profile;

@Controller
public class PortfolioController {
	
	boolean flag1 = true;
	
	@Autowired
	private PortfolioService portfolioService;
	
	
	@RequestMapping("portfolio.pf") //1번
	public String portfolio(@RequestParam("portfolioCategory")String portfolioCategory
										  ,Model model){
//		flag1 = false;
		
		System.out.println("portfolioCategory:"+portfolioCategory);
		//받아온 카테고리 데이터로 카테고리 이름 뽑아주기
		DetailCategory dc = portfolioService.selectDetailName(portfolioCategory);
		
		System.out.println("dc:"+dc);
		
		model.addAttribute("detailName",dc.getDetailName());
		if(flag1) {
			return "portfolio/portfolio";
		}else{
			return "portfolio/portfolioDetailView";
		}
		
	}
	
	@RequestMapping(value="portfolioEnroll.pf",method = RequestMethod.POST) //3번
	public String portfolioEnroll(@RequestParam("Images")MultipartFile[] formData
								 ,Portfolio pf
								 ,String userNo
								 ,@RequestParam("dNo")String dNo
								 ,@RequestParam("portfolioCategory")String portfolioCategory
								 ,Model model
								 ,HttpSession session) {
		//새로 등록하려는 포트폴리오의 카테고리가 기존 포트폴리오의 카테고리와 겹치는지 여부 확인
		System.out.println("portfolioCategory : "+portfolioCategory);
		pf.setDetailNo(dNo);
		System.out.println("pf : "+pf);
		ArrayList<Portfolio> pfList =  portfolioService.selectPortfolioList(userNo);
		
		boolean flag = true;
		
		if(!pfList.isEmpty()) {
			System.out.println(pf.getDetailNo());
			System.out.println(pfList.get(0).getDetailNo());
			System.out.println(pfList);
			
			
			for(int i=0; i<pfList.size(); i++) {
				if(pfList.get(i).getDetailNo().equals(pf.getDetailNo())) {
					
					flag = false;
					break;
				}
			}
		}
		//새로 등록하려는 포트폴리오의 카테고리가 기존 포트폴리오의 카테고리와 겹치지 않는다면 (새로등록)
		if(flag) {
			
			System.out.println("여기 들어오면 안된다 지금은");
			
			ArrayList<PortfolioImage> list = new ArrayList<>();
			
			PortfolioImage portfolioImage = null;
			
			for(int i=0; i<formData.length; i++) {
				
				if(formData[i].getOriginalFilename()!="") {
					
					portfolioImage = new PortfolioImage();
					String changeName = saveFile(formData[i],session);
					
					portfolioImage.setOriginName(formData[i].getOriginalFilename());
					portfolioImage.setChangeName("resources/uploadFiles/"+changeName);
					portfolioImage.setFileType("portfolio-image");
					portfolioImage.setRefNo(Integer.parseInt(userNo));
					if(i==0) {
						portfolioImage.setFileLevel(1);
					}else {
						portfolioImage.setFileLevel(2);
					}
					list.add(portfolioImage);
					
					System.out.println("changeName : "+portfolioImage.getChangeName());
				}	
			}
			
			int result1 = portfolioService.uploadImages(list);
			
			pf.setUserNo(userNo);
			
			int result2 = portfolioService.insertPortfolio(pf);
			
			if(result1*result2>0) {
				flag1 = false;
				model.addAttribute("pf",pf);
				model.addAttribute("list",list);
				model.addAttribute("portfolioCategory",portfolioCategory);
				return "portfolio/portfolioDetailView";
			}else {
				session.setAttribute("errorMsg", "등록 실패");
				return "portfolio/portfolio";
			}
		}else {//겹치면 다시 넘겨주기
			session.setAttribute("errorMsg","이미 등록된 카테고리입니다. 카테고리를 변경하거나 기존 카테고리를 수정/삭제하여 이용해주세요.");
			flag1 = true;
			model.addAttribute("portfolioCategory",portfolioCategory);
			return "redirect:/portfolio.pf";
		}
		
	}
	
//	@RequestMapping("portfolioDetail")
//	public String selectPortfolioList(String userNo) {
//		
//		
//		
//		return "portfolio/portfolioDetailView";
//	}
	
	//파일명 수정 모듈
	public String saveFile(MultipartFile upfile
			,HttpSession session) {
		
		//파일명 수정하기
		//1. 원본파일명 추출
		String originName = upfile.getOriginalFilename();
		
		//2. 시간 추출하기 -util.Date
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		//3.뒤에 붙일 랜덤값 5자리 추출하기
		int ranNum = (int)(Math.random()*90000+10000);
		
		//4.원본파일명에서 확장자 추출하기 test.txt - 뒤에서부터 . 을 찾고 그 뒤로 잘라내기 .txt
		String ext = originName.substring(originName.lastIndexOf("."));
		
//		String ext = FilenameUtils.getExtension(originName);
		
		//5. 2,3,4 이어붙여서 변경이름 만들기 (업로드이름)
		String changeName = currentTime+ranNum+ext;
		
		
		//6. 저장시킬 실질적인 물리적 경로 추출하기
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		System.out.println(savePath);
		
		try {
			//7. 경로와 수정파일명으로 파일 업로드 하기 (경로+파일명) 파일객체를 생성한뒤 해당 파일 객체를 업로드시킨다.
			upfile.transferTo(new File(savePath+changeName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return changeName;
	}
	@ResponseBody
	@RequestMapping("selectPortfolioCategory") //2번
	public String[] selectPortfolioCategory(int userNo
										 ,String detailName) {
		
		System.out.println("detailName : "+detailName);
		
		ArrayList<Profile> detailList = portfolioService.selectDetailCategoryList(userNo);
		
		DetailCategory dc = portfolioService.selectDetailCategoryNo(detailName);
		
		String mainService = detailList.get(0).getMainService();
		
		String subService = detailList.get(0).getSubService();
		
		String[] subServiceArray = subService.split(",");
		
		String[] dList = new String[subServiceArray.length+2];
		
		dList[0] = mainService;
		
		for(int i=1; i<subServiceArray.length+1; i++) {
			dList[i] = subServiceArray[i-1];
		}
		
		dList[subServiceArray.length+1] = String.valueOf(dc.getDetailNo());
		
		return dList;
	}
	
//	@ResponseBody
//	@RequestMapping("selectPortfolioList.pf") //4번
//	public ArrayList<PortfolioImage> selectPortfolioList(Portfolio pf
//									 ,Model model) {
//		
//		System.out.println("카테고리 번호는 ? : "+pf.getDetailNo());
//		System.out.println("유저 번호는 ? : "+pf.getUserNo());
//		
//		ArrayList<PortfolioImage> imageList = portfolioService.selectPortfolioImageList(pf);
//		
//		System.out.println(imageList.get(0));
//		System.out.println(imageList.get(1));
//		
//		return imageList;
//	}
	
	@RequestMapping(value="portfolioUpdate.pf",method = RequestMethod.POST) //3번
	public String portfolioUpdate(@RequestParam("Images")MultipartFile[] formData
								 ,Portfolio pf
								 ,String detailName
								 ,Model model
								 ,HttpSession session) {
		
			System.out.println("detailName : "+detailName);
		
			//기존 데이터 가져와서 업데이트 해주기
//			DetailCategory dc = portfolioService.selectDetailNo(userNo);
			
//			pf.setDetailNo(String.valueOf(dc.getDetailNo()));
			
//			ArrayList<PortfolioImage> iamgeList = portfolioService.selectPortfolioImageList(userNo);
			
			Portfolio updatePf = portfolioService.selectPortfolio(pf);
			
			System.out.println(updatePf);
			
			
			
			return null;
	}
	
 	
	
	
}