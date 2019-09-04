package kr.co.ziziza.manager.join;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class MngJoinServiceImpl implements MngJoinService {
	
	@Autowired
	private MngJoinDAO dao;
	
	@Override
	public int joinMember(MngMemberJoinVO vo) {
		int count = 0;
		count = dao.joinMember(vo);
		return count;
	}//joinMember
	
	@Override
	public int joinManager(MngManagerJoinVO vo2) {
		int count = 0;
		count = dao.joinManager(vo2);
		return count;
	}//joinManager
	
	@Override
	public int joinIdCheck(MngMemberJoinVO vo) {
		int count = 0;
		count = dao.joinIdCheck(vo);
		return count;
	}//joinIdCheck
}
