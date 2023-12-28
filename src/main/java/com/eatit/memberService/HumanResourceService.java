package com.eatit.memberService;

import java.util.List;
import java.util.Map;

import com.eatit.mainDomain.Criteria;
import com.eatit.memberDomain.MemberVO;

public interface HumanResourceService {
	public List<MemberVO> getHrList(Criteria cri);
	
	public MemberVO getHrContent(MemberVO vo);
	
	public int getTotalCount();
	
	public void editHrContent(MemberVO vo);
	
	public List<MemberVO> getSearchList(Map<String, Object> params, Criteria cri, String searchword);
	
	public int getSearchCount(String searchword);
	
	public List<MemberVO> getHrRegList(Criteria cri);
}
