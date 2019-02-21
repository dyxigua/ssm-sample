<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="StudentController/queryStudentByNo/1">查询一号学生</a>
	
	<form action="StudentController/addStudent" method="post">
		编号:<input name="stuno"><br/>
		姓名:<input name="stuname"><br/>
		年龄:<input name="stuage"><br/>
		<input type="submit" value="添加"> 
	</form>
</body>
</html>