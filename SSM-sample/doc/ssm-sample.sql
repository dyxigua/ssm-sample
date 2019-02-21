-- ssm-sample   的测试sql   oracle  scott/tiger
drop table student;

drop sequence seq_stuno;

create table student(
       stuno  number primary key,
       stuname varchar2(2),
       stuage number
);


alter table student modify stuname varchar2(20);

/*
CREATE SEQUENCE emp_sequence   
     INCREMENT BY 1   -- 每次加几个   
     START WITH 1     -- 从1开始计数   
     NOMAXVALUE       -- 不设置最大值   
     NOCYCLE          -- 一直累加，不循环   
     CACHE 10; 
     
     一旦定义了emp_sequence，你就可以用CURRVAL，NEXTVAL   
CURRVAL=返回 sequence的当前值   
NEXTVAL=增加sequence的值，然后返回 sequence 值   
比如：   
   emp_sequence.CURRVAL   
   emp_sequence.NEXTVAL     
*/
create sequence seq_stuno;

select seq_stuno.nextval from dual;

insert into student(stuno,stuname,stuage) values(seq_stuno.currval,'张三',23);
insert into student(stuno,stuname,stuage) values(seq_stuno.nextval,'李四',24);
insert into student(stuno,stuname,stuage) values(seq_stuno.nextval,'王五',25);
insert into student(stuno,stuname,stuage) values(seq_stuno.nextval,'赵流',53);
insert into student(stuno,stuname,stuage) values(seq_stuno.nextval,'张三',28);
insert into student(stuno,stuname,stuage) values(seq_stuno.nextval,'haha',28);
insert into student(stuno,stuname,stuage) values(seq_stuno.nextval,'haha',28);
insert into student(stuno,stuname,stuage) values(seq_stuno.nextval,'haha',28);


select * from student;

