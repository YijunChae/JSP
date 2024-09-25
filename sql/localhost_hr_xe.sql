CREATE TABLE table_member(
    id          VARCHAR2(200)   PRIMARY KEY,
    password    VARCHAR2(200)   NOT NULL,
    name        VARCHAR2(100)   NOT NULL,
    birth_date  DATE            NOT NULL,
    phone       VARCHAR2(20)    NOT NULL,
    email       VARCHAR2(200)   NOT NULL,
    role        VARCHAR2(20)    NOT NULL
);


CREATE TABLE table_board(
    no          NUMBER(5)       PRIMARY KEY,
    title       VARCHAR2(500)   NOT NULL,
    writer      VARCHAR2(200)   NOT NULL,
    content     VARCHAR2(4000),
    view_cnt    NUMBER(5)       DEFAULT 0,
    reg_date    DATE            DEFAULT SYSDATE,
    FOREIGN KEY (writer) REFERENCES table_member(id) ON DELETE CASCADE
);


CREATE SEQUENCE seq_table_board_no;

select * from vet_user;
select * from vet_admin;
select * from vet_schedule;

select * from table_member;
select * from table_board;


insert into table_member
 values('id', 'password', 'name', 'birth_date', 'phone', 'email', 'role');

insert into table_board
 values(seq_table_board_no.nextval, 'title', 'writer', 'content', 0, sysdate);


-- table_member
insert into table_member
 values('jun', 'junzzang7', '채이준', '2000-01-01', '010-0000-0000', 'chae@yi.jun', 'admin');

insert into table_member
 values('jin', 'woozu8', '신우주', '1994-02-01', '010-0000-0001', 'shin@woo.zu', 'admin');

insert into table_member
 values('min', 'min007', '김민성', '1986-05-05', '010-0000-0002', 'kim@min.sung', 'admin');
 
commit;


-- table_board
insert into table_board
 values(seq_table_board_no.nextval, 'Hello World', 'jun', 'Hello, World!', 0, sysdate);
 
insert into table_board
 values(seq_table_board_no.nextval, '우리는 언젠가 만난다', 'jin', '나, 타인, 세계를 이어주는 이야기', 0, sysdate);
 
insert into table_board
 values(seq_table_board_no.nextval, 'This shall too pass', 'min', '이 또한 지나가리라', 0, sysdate);

commit;




