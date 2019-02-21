package com.mhj.service;

import com.mhj.entity.Student;

public interface StudentService {
	
	public void addStudent(Student student);
	
	public Student queryStudentByNo(int stuno);
}
