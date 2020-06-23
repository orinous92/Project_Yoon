package com.project.biz.member.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.biz.member.AddressVO;
import com.project.biz.member.MemberVO;
import com.project.biz.paging.Criteria;

@Repository
public class MemberDAO {
	
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 사용자 조회
	public MemberVO signin(MemberVO mVo) {
		System.out.println("==> signin() 기능처리");
		return mybatis.selectOne("MemberDAO.signin", mVo);
	}
	
	// 아이디 존재 여부 체크
	public int confirmId(String userid) {
		System.out.println("==> confirmId() 기능처리");
		
		if(mybatis.selectOne("MemberDAO.confirmId", userid) != null) {
			return 1;
		} else {
			return -1;
		}
	}
	
	// 사용자 정보 입력
		public void signup(MemberVO mVo) {
			System.out.println("==> signup() 기능처리");
			mybatis.insert("MemberDAO.signup", mVo);
			
		}
	
	// 사용자 정보 수정
	public void updateMember(MemberVO mVo) {
		System.out.println("==> updateMember() 기능처리");
		mybatis.update("MemberDAO.updateMember", mVo);
	}
	
	// 사용자 정보 삭제
	public void deleteMember(String userid) {
		System.out.println("==> deleteMember() 기능처리");
		mybatis.delete("MemberDAO.deleteMember", userid);
	}
	
	// 아이디 찾기
	public MemberVO findUserId(MemberVO mVo) {
		System.out.println("==> findUserId() 기능처리");
		return mybatis.selectOne("MemberDAO.findUserId", mVo);
	}
	
	// 비밀번호 찾기
	public MemberVO findUserPwd(MemberVO mVo) {
		System.out.println("==> findUserPwd() 기능처리");
		return mybatis.selectOne("MemberDAO.findUserPwd", mVo);
	}
	
	// 우편번호 찾기
	public List<AddressVO> selectAddressByDong(String dong) {
		System.out.println("==> selectAddressByDong() 기능 처리");
		return mybatis.selectList("MemberDAO.selectAddressByDong", dong);
	}

	public void updpwd(MemberVO mVo) {
		System.out.println("==> updpwd() 기능 처리");
		 mybatis.update("MemberDAO.updpwd",mVo);
	}

	public List<MemberVO> userList(MemberVO mVo) {
		System.out.println("==> userList() 기능 처리");
		return mybatis.selectList("MemberDAO.userList", mVo);
	}

	public MemberVO getUser(MemberVO mVo) {
		System.out.println("==> getUser() 기능처리");
		return mybatis.selectOne("MemberDAO.getUser", mVo);
	}

	public List<MemberVO> getUserListWithPaging(Criteria cri, String userid) {
		
		System.out.println("==> mybatis.getUserListWithPaging() 기능처리");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userid", userid);
		map.put("cri", cri);
		
		return mybatis.selectList("MemberDAO.getUserListWithPaging", map);
	}

	public int memberListCount(String userid) {
		return mybatis.selectOne("MemberDAO.memberListCount", userid);
	}

	
}
