package org.employee.service;


import static org.junit.Assert.assertNotNull;

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
public class EmployeeServiceTests {

	@Setter(onMethod_ = @Autowired)
	private EmployeeService service;
	
//	@Test
//	public void testExist() {
//		log.info(service);
//		assertNotNull(service);
//	}
	
//	@Test
//	public void testRegister() {
//		EmployeeVO eVo = new EmployeeVO();
//		eVo.setId("YOON");
//		eVo.setPass("YOON1224");
//		eVo.setGender(1);
//		eVo.setLev("A");
//		eVo.setName("윤윤윤");
//		eVo.setPhone("01077777777");
//		
//		service.register(eVo);
//		
//		log.info("생성된 사원 아이디" + eVo.getId());
//	}
	
//	@Test
//	public void testGetList() {
//		service.getList().forEach(eVo ->log.info(eVo));
//	}
	
//	@Test
//	public void testGet() {
//		log.info(service.get("YOON"));
//	}
	
//	@Test
//	public void testDelete() {
//		log.info("Remove result:" + service.remove("YOON"));
//	}
	
	@Test
	public void testUpdate() {
		EmployeeVO eVo = service.get("subin");
		
		if(eVo == null) {
			return;
		}
		
		eVo.setName("전전수수빈빈");
		log.info("Modify result: " + service.modify(eVo));
	}
}
