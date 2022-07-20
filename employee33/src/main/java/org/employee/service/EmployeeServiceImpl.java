package org.employee.service;


import java.util.List;

import org.employee.domain.EmployeeVO;
import org.employee.mapper.EmployeeMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class EmployeeServiceImpl implements EmployeeService {

	private EmployeeMapper mapper;
	@Override
	public void register(EmployeeVO eVo) {
		// TODO Auto-generated method stub
		log.info("register....." + eVo);
		mapper.insert(eVo);

	}

	@Override
	public EmployeeVO get(String id) {
		log.info("get........." + id);
		return mapper.read(id);
	}

	@Override
	public boolean modify(EmployeeVO eVo) {
		// TODO Auto-generated method stub
		log.info("modify.........."+ eVo);
		return mapper.update(eVo)==1;
	}

	@Override
	public boolean remove(String id) {
		// TODO Auto-generated method stub
		log.info("remove......." + id);
		return mapper.delete(id)==1;
	}
	@Override
	public List<EmployeeVO> getList(){
		log.info("getList........");
		return mapper.getList();
	};

	@Override
	public int getId(String id) {
		log.info("check id");
		
		return mapper.getId(id);
	}
}
