package com.mhj.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mhj.entity.Student;
import com.mhj.service.StudentService;

@RequestMapping("StudentController")
@Controller
public class StudentController {
	
	//控制器依赖Service
//	@Qualifier("studentService")  //同下边这个一个作业，只是Autowired名字一直，这个不一致时可以指明
	@Autowired
	private StudentService studentService;
	
	@RequestMapping("queryStudentByNo/{stuno}")
	public String queryStudentByNo(@PathVariable("stuno") Integer stuno,Map<String,Object> map){
		Student student = studentService.queryStudentByNo(stuno);
		map.put("student", student);
//		System.out.println(student.getStuage());
		return  "result";
	}
	
	@RequestMapping("addStudent")
	public String addStudent(Student student){
		studentService.addStudent(student);
		return "result" ;
	}
	
}
