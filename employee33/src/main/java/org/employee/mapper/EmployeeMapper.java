package org.employee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.employee.domain.EmployeeVO;


public interface EmployeeMapper {
	
	public List<EmployeeVO> getList();
	
	public void insert(EmployeeVO employee);
	
	public void insertSelectKey(EmployeeVO employee);
	
	public EmployeeVO read(String id);
	
	public int delete(String id);
	
	public int update(EmployeeVO employee);
	
	public int getId(String id);
}
