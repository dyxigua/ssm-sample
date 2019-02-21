-- ssm-sample   �Ĳ���sql   oracle  scott/tiger
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
     INCREMENT BY 1   -- ÿ�μӼ���   
     START WITH 1     -- ��1��ʼ����   
     NOMAXVALUE       -- ���������ֵ   
     NOCYCLE          -- һֱ�ۼӣ���ѭ��   
     CACHE 10; 
     
     һ��������emp_sequence����Ϳ�����CURRVAL��NEXTVAL   
CURRVAL=���� sequence�ĵ�ǰֵ   
NEXTVAL=����sequence��ֵ��Ȼ�󷵻� sequence ֵ   
���磺   
   emp_sequence.CURRVAL   
   emp_sequence.NEXTVAL     
*/
create sequence seq_stuno;

select seq_stuno.nextval from dual;

insert into student(stuno,stuname,stuage) values(seq_stuno.currval,'����',23);
insert into student(stuno,stuname,stuage) values(seq_stuno.nextval,'����',24);
insert into student(stuno,stuname,stuage) values(seq_stuno.nextval,'����',25);
insert into student(stuno,stuname,stuage) values(seq_stuno.nextval,'����',53);
insert into student(stuno,stuname,stuage) values(seq_stuno.nextval,'����',28);
insert into student(stuno,stuname,stuage) values(seq_stuno.nextval,'haha',28);
insert into student(stuno,stuname,stuage) values(seq_stuno.nextval,'haha',28);
insert into student(stuno,stuname,stuage) values(seq_stuno.nextval,'haha',28);


select * from student;

