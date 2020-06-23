package com.project.biz.member.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.biz.member.AddressVO;
import com.project.biz.member.MemberService;
import com.project.biz.member.MemberVO;
import com.project.biz.paging.Criteria;

@Service("MemberService")
public class MemberSerivceImpl implements MemberService {

	@Autowired
	private MemberDAO dao;
	
	@Override
	public MemberVO signin(MemberVO mVo) throws Exception {
		return dao.signin(mVo);
	}

	@Override
	public int confirmId(String userid) {
		return dao.confirmId(userid);
	}

	@Override
	public void signup(MemberVO mVo) {
		dao.signup(mVo);
	}

	@Override
	public void updateMember(MemberVO mVo) {
		dao.updateMember(mVo);
	}

	@Override
	public void deleteMember(String userid) {
		dao.deleteMember(userid);
	}

	@Override
	public MemberVO findUserId(MemberVO mVo) {
		return dao.findUserId(mVo);
	}

	@Override
	public MemberVO findUserPwd(MemberVO mVo) {
		return dao.findUserPwd(mVo);
	}

	@Override
	public List<AddressVO> selectAddressByDong(String dong) {
		return dao.selectAddressByDong(dong);
	}

	@Override
	public void updpwd(MemberVO mVo) {
		dao.updpwd(mVo);
	}

	@Override
	public List<MemberVO> userList(MemberVO mVo) {
		return dao.userList(mVo);
	}

	@Override
	public MemberVO getUser(MemberVO mVo) {
		return dao.getUser(mVo);
	}

	@Override
	public List<MemberVO> getUserListWithPaging(Criteria cri, String userid) {
		return dao.getUserListWithPaging(cri, userid);
	}

	@Override
	public int memberListCount(String userid) {
		return dao.memberListCount(userid);
	}


}
