package com.kh.ttip.profile.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.ttip.profile.model.vo.Image;
import com.kh.ttip.profile.model.vo.Profile;
import com.kh.ttip.profile.model.vo.QA_comment;
import com.kh.ttip.profile.model.vo.Review;

@Repository
public class ProfileDao {

	public int uploadImages(HashMap<String, Object> map, SqlSession sqlSession) {
		return sqlSession.insert("profileMapper.uploadImages",map);
	}

	public ArrayList<Image> selectDetailImages(int userNo, SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("profileMapper.selectDetailImages",userNo);
	}

	public int updateNickname(HashMap<String, String> map, SqlSession sqlSession) {
		return sqlSession.update("profileMapper.updateNickname",map);
	}

	public int updateSubCategory(HashMap<String,Object> map, SqlSession sqlSession) {
		return sqlSession.update("profileMapper.updateSubCategory",map);
	}

	public Profile selectAllProfileInfo(int userNo, SqlSession sqlSession) {
		return sqlSession.selectOne("profileMapper.selectAllProfileInfo",userNo);
	}

	public int updateMainCategory(HashMap<String, Object> map, SqlSession sqlSession) {
		return sqlSession.update("profileMapper.updateMainCategory",map);
	}

	public int updateOneLineIntroduce(HashMap<String, String> map, SqlSession sqlSession) {
		return sqlSession.update("profileMapper.updateOneLineIntroduce",map);
	}

	public int updateAddress(HashMap<String, String> map, SqlSession sqlSession) {
		return sqlSession.update("profileMapper.updateAddress",map);
	}

	public int updateTime(HashMap<String, String> map, SqlSession sqlSession) {
		return sqlSession.update("profileMapper.updateTime",map);
	}

	public int updateDetailDescription(HashMap<String, String> map, SqlSession sqlSession) {
		return sqlSession.update("profileMapper.updateDetailDescription",map);
	}

	public int uploadProfilePicture(HashMap<String, Object> map, SqlSession sqlSession) {
		return sqlSession.update("profileMapper.uploadProfilePicture",map);
	}

	public int updateQuestion(Map<String, Object> paramMap, SqlSession sqlSession) {
		return  sqlSession.update("profileMapper.updateQuestion",paramMap);
	}

	public ArrayList<QA_comment> selectQuestionComment(String userNo, SqlSession sqlSession) {
		return  (ArrayList)sqlSession.selectList("profileMapper.selectQuestionComment",userNo);
	}

	public int deleteExistedImages(String[] oldFileNoArray, SqlSession sqlSession) {
		return sqlSession.delete("profileMapper.deleteExistedImages",oldFileNoArray);
	}

	public int deleteOneDetailImage(int atNo, SqlSession sqlSession) {
		return sqlSession.delete("profileMapper.deleteOneDetailImage",atNo);
	}

	public ArrayList<Review> selectReviewList(String profileNo, SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("profileMapper.selectReviewList",profileNo);
	}

	public int selectReviewCount(String profileNo, SqlSession sqlSession) {
		return sqlSession.selectOne("profileMapper.selectReviewCount",profileNo);
	}

	public int updateReviewInfo(HashMap<String, Object> map, SqlSession sqlSession) {
		return sqlSession.update("profileMapper.updateReviewInfo",map);
	}
	
	//-------------------자격증 영역---------------------
	public int uploadLicenseImages(ArrayList<Image> list, SqlSession sqlSession) {
		return sqlSession.insert("profileMapper.insertLicenseImages",list);
	}

	public ArrayList<Image> selectLicenseList(int userNo, SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("profileMapper.selectLicenseList",userNo);
	}

	public int deleteLicenseImage(int atNo, SqlSession sqlSession) {
		return sqlSession.delete("profileMapper.deleteLicenseImage",atNo);
	}

	public Image selectLicenseImage(int atNo, SqlSession sqlSession) {
		return sqlSession.selectOne("profileMapper.selectLicenseImage",atNo);
	}

	public int selectProfileNo(int userNo, SqlSession sqlSession) {
		return sqlSession.selectOne("profileMapper.selectProfileNo",userNo);
	}

	public Profile selectInfoProfileWithReview(int userNo, SqlSession sqlSession) {
		return sqlSession.selectOne("profileMapper.selectAllProfileInfo",userNo);
	}

	public Profile selectInfoProfileWithoutReview(int userNo, SqlSession sqlSession) {
		return sqlSession.selectOne("profileMapper.selectAllProfileInfoWithoutReview",userNo);
	}

	

}
