USE goodsDB;

create table member  ( 
    m_id varchar(10) not null,       
    m_password varchar(10) not null,
    m_name varchar(10) not null,     
    m_gender varchar(4),            
    m_birth  varchar(10),            
    m_mail  varchar(30),             
    m_phone varchar(20),           
    m_address varchar(90),            
    m_regist_day varchar(50),         
    primary key(m_id) 
) default CHARSET=utf8;

INSERT INTO member VALUES('hi', '1234', '김포도','여', '030303', 'hello@naver.com', '01011111111', '경기도', NOW());
--               (기본키)아이디  비밀번호 이름    성별  생년월일    이메일                   전화번호        주소  가입날짜

INSERT INTO member VALUES('po', '1234', '김포포','여', '050505', 'hi@naver.com', '01033333333', '경기도', NOW());
--               (기본키)아이디  비밀번호 이름    성별  생년월일    이메일                   전화번호        주소  가입날짜

select * from member;