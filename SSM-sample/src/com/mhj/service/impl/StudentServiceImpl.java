package com.mhj.service.impl;

import com.mhj.entity.Student;
import com.mhj.mapper.StudentMapper;
import com.mhj.service.StudentService;

//@Service  可以在这里写，，也可以在spring配置文件中去写bean，给service注入dao,但是需要有set方法
public class StudentServiceImpl implements StudentService{
	
//	Service 依赖dao（mapper)
	private StudentMapper studentMapper;
	
//	需要有set方法才能将进行注入
	public void setStudentMapper(StudentMapper studentMapper) {
		this.studentMapper = studentMapper;
	}

	@Override
	public void addStudent(Student student) {
		studentMapper.addStudent(student);
	}

	@Override
	public Student queryStudentByNo(int stuno) {
		Student sudent = studentMapper.queryStudentByNo(stuno);
		return sudent;
	}

}
