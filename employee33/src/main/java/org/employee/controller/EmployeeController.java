package org.employee.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.employee.domain.EmployeeVO;
import org.employee.service.EmployeeService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/employee")
@AllArgsConstructor
public class EmployeeController {
	
	private EmployeeService service; 
	
	//리스트가져오기
	@GetMapping("/list")
	public void list(Model model) {
		log.info("list");
		model.addAttribute("list", service.getList());
	}
	
	//등록한거 볼수 있는 겟맵핑
	@GetMapping("/register")
	public void register() {
		
	}
	
	//등록 맵핑
	@PostMapping("/register")
	public String register(EmployeeVO eVo, RedirectAttributes rttr) {
		log.info("register:" + eVo);
		
		int checkid = service.getId(eVo.getId());
		
		if(checkid>0) {
			rttr.addFlashAttribute("result","exit");
		}else {
			service.register(eVo);
			rttr.addFlashAttribute("result", "insert");
			//rttr.addFlashAttribute("result", eVo.getId()); 이부분을 좀더 공부해봐야겠음
		}
		
		return "redirect:/employee/list";
	}
	
	
//상세보기,수정
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("id") String id, Model model) {
		log.info("/get or modify");
		model.addAttribute("employee", service.get(id));
	}
	
	@PostMapping("/modify")
	public String modify(EmployeeVO eVo, RedirectAttributes rttr) {
		log.info("modify...." + eVo);
		
		if(service.modify(eVo)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/employee/list";
	}
	
//삭제	
	@PostMapping("/remove")
	public String remove(@RequestParam("id") String id, RedirectAttributes rttr) {
		log.info("remove....." + id);
		if(service.remove(id)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/employee/list";
	}


}
