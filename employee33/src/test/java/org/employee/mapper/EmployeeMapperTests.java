package org.employee.mapper;

import org.employee.domain.EmployeeVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class EmployeeMapperTests {

	@Setter(onMethod_ = @Autowired)
	private EmployeeMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(employee -> log.info(employee));
	}
	
//	@Test
//	public void testInsert() {
//		EmployeeVO employee = new EmployeeVO();
//		
//		employee.setId("yoon111222");
//		employee.setPass("1224");
//		employee.setName("윤승환33");
//		employee.setLev("B");
//		employee.setGender(2);
//		employee.setPhone("010-7784-4516");
//		
//		mapper.insert(employee);
//		
//		log.info(employee);
//		
//	}
	
//	@Test
//	public void testRead() {
//		EmployeeVO employee = mapper.read("yoon");
//		
//		log.info(employee);
//	}
	
//	@Test
//	public void testDelete() {
//		log.info("DELETE COUNT: " + mapper.delete("yoon111222"));
//	}
	
	@Test
	public void testUpdate() {
		EmployeeVO employee = new EmployeeVO();
		
		employee.setId("yoon");
		employee.setPass("941224");
		employee.setName("윤승환수정");
		employee.setLev("A");
		employee.setGender("1");
		employee.setPhone("010-1234-1234");
	
		int count = mapper.update(employee);
		log.info("update count: " + count);
		
	}
}
