package com.kh.ttip.announcement.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.ttip.announcement.model.vo.Announcement;
import com.kh.ttip.announcement.model.vo.DetailCategory;
import com.kh.ttip.announcement.model.vo.MainCategory;
import com.kh.ttip.announcement.model.vo.SubCategory;

@Repository
public class AnnounceDao {

	
	public ArrayList<SubCategory> selectSubCategory(int categoryNo, SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("announceMapper.selectSubCategory",categoryNo);
	}
	
	public ArrayList<MainCategory> selectMainCategory(SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("announceMapper.selectMainCategory");
	}

	public ArrayList<DetailCategory> selectDetailCategory(int[] arr, SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("announceMapper.selectDetailCategory",arr);
	}

	public ArrayList<Announcement> selectAnnounceList(int detailNo, SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("announceMapper.selectAnnounceList",detailNo);
	}

	

	
}
