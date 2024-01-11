package com.kh.ttip.profile.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.ttip.profile.model.vo.Image;
import com.kh.ttip.profile.model.vo.Profile;
import com.kh.ttip.profile.model.vo.QA_comment;
import com.kh.ttip.profile.model.vo.Review;

public interface ProfileService {
	
	//사진 업로드
	int uploadImages(HashMap<String, Object> map);
	//상세 이미지 조회
	ArrayList<Image> selectDetailImages(int userNo);
	//활동명 업데이트
	int updateNickname(HashMap<String, String> map);
	//제공서비스 추가
	int updateSubCategory(HashMap<String,Object> map);
	//프로필 전체 조회
	Profile selectAllProfileInfo(int userNo);
	//메인카테고리 업데이트
	int updateMainCategory(HashMap<String, Object> map);
	//한줄소개 업데이트
	int updateOneLineIntroduce(HashMap<String, String> map);
	//주소 업데이트
	int updateAddress(HashMap<String, String> map);
	//연락 가능 시간 업데이트
	int updateTime(HashMap<String, String> map);
	//서비스 상세설명 업데이트
	int updateDetailDescription(HashMap<String, String> map);
	//프로필 사진
	int uploadProfilePicture(HashMap<String, Object> map);
	//질문답변 업데이트
	int updateQuestion(Map<String, Object> paramMap);
	//질문답변 조회
	ArrayList<QA_comment> selectQuestionComment(String userNo);
	//기존에 있던 상세 이미지 삭제
	int deleteExistedImages(String[] oldFileNoArray);
	//상세이미지 하나 삭제
	int deleteOneDetailImage(int atNo);
	//리뷰 리스트 조회
	ArrayList<Review> selectReviewList(String profileNo);
	//리뷰 수 조회
	int selectReviewCount(String profileNo);
	//리뷰 정보 데이터 추가
	int updateReviewInfo(HashMap<String, Object> map);
	//----------------자격증 영역-------------------
	//자격증 이미지 업로드
	int uploadLicenseImages(ArrayList<Image> list);
	//자격증 이미지 조회
	ArrayList<Image> selectLicenseList(int userNo);
	//자격증 이미지 삭제
	int deleteLicenseImage(int atNo);
	//자격증 이미지 조회
	Image selectLicenseImage(int atNo);
	//프로필 번호 조회
	int selectProfileNo(int userNo);
	//프로필 모든 정보 조회
	Profile selectEveryInfoProfile(int count, int userNo);

	

}
