package com.mhj.mapper;

import com.mhj.entity.Student;

public interface StudentMapper {
	/**
	 * 添加对象
	 * @param student
	 */
	public abstract void addStudent(Student student);
	/**
	 * 通过学生 no查询学生
	 * @param stuno
	 * @return
	 */
	public abstract Student queryStudentByNo(int stuno);
}
