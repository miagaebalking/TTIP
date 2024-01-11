package com.kh.ttip.announcement.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.ttip.announcement.model.service.AnnounceService;
import com.kh.ttip.announcement.model.vo.Announcement;
import com.kh.ttip.announcement.model.vo.DetailCategory;
import com.kh.ttip.announcement.model.vo.MainCategory;
import com.kh.ttip.announcement.model.vo.SubCategory;

@Controller
public class AnnounceController {
	
	@Autowired
	private AnnounceService service;
	
	@GetMapping("moveToSubCategory.an")
	public String selectSubCategory(@RequestParam(name = "categoryNo") int categoryNo,Model m) {
		
		System.out.println("categoryNo : "+categoryNo);
		ArrayList<SubCategory> subCategory = service.selectSubCategory(categoryNo);
		
		for(SubCategory s : subCategory) {
			System.out.println(s);
		}
		
		m.addAttribute("subCategory",subCategory);
		
		return "subCategory/subCategoryPage";
	}
	
	@GetMapping("selectAnnounceList.an")
	public String selectAnnounceList( int detailNo
									, String detailName
									, String categoryName
									,Model m) {
		
		System.out.println("detailNo : "+detailNo);
		ArrayList<Announcement> list = service.selectAnnounceList(detailNo);
		
		for(Announcement a : list) {
			System.out.println(a);
		}
		m.addAttribute("list",list);
		m.addAttribute("detailName",detailName);
		m.addAttribute("categoryName",categoryName);
		
		return "announcement/announceMentListView";
	}
	
	@ResponseBody
	@RequestMapping("selectMainCategoryModal.an")
	public HashMap<String, Object> selectMainCategoryModal(int currentPage){
		
		HashMap<String, Object> map = new HashMap<>();
		ArrayList<MainCategory> list = service.selectMainCategory();
		map.put("list",list);
		map.put("currentPage", currentPage);
		return map;
	}
	@ResponseBody
	@RequestMapping("selectDetailCategoryModal.an")
	public ArrayList<DetailCategory> selectDetailCategoryModal(Model model
									  ,@RequestParam(value="checkedCategory[]") int[] arrayParams
			
														) {
		ArrayList<DetailCategory> list = service.selectDetailCategory(arrayParams);
		
		return list;
	}
	
	
	@RequestMapping("announceMentList.an")
	public String announceMentList(String category) {
		
		System.out.println(category);
		
		return "announcement/announceMentListView";
	}
}
