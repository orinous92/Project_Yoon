package com.project.biz.member;

import java.util.List;

import com.project.biz.paging.Criteria;

public interface MemberService {
	
	public int confirmId(String userid);
	public void updateMember(MemberVO mVo);
	public void deleteMember(String userid);
	public MemberVO findUserId(MemberVO mVo);
	public MemberVO findUserPwd(MemberVO mVo);
	public void updpwd(MemberVO mVo);
	
	// 로그인
	public MemberVO signin(MemberVO mVo) throws Exception;
	
	// 회원가입
	public void signup(MemberVO mVo) throws Exception;
	
	// 주소 동으로 주소 찾기.
	List<AddressVO> selectAddressByDong(String dong);
	
	// 유저 리스트 뽑기
	List<MemberVO> userList(MemberVO mVo);
	
	// 유저 리스트 with paging
	public List<MemberVO> getUserListWithPaging(Criteria cri, String userid);
	
	// 유저 목록 갯수
	public int memberListCount(String userid);
	
	// 유저 상세 정보
	public MemberVO getUser(MemberVO mVo);
	
}
