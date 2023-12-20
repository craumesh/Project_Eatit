package com.eatit.memberPersistence;

import com.eatit.memberDomain.MemberVO;

public interface MemberDAO {
	// 로그인 동작
	public MemberVO LoginMember(MemberVO vo);
	
	//회원등록 동작
	public void insertMember(MemberVO vo);
	
}
