package org.employee.service;

import java.util.List;

import org.employee.domain.EmployeeVO;



public interface EmployeeService {
	
	public List<EmployeeVO> getList();
	public void register(EmployeeVO eVo);
	public EmployeeVO get(String id);
	public boolean modify(EmployeeVO eVo);
	public boolean remove(String id);
	public int getId(String id);//아이디 중복확인을 위해 만듦

}
