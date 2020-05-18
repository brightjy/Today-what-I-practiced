DROP TABLE member_tbl_02;
DROP TABLE money_tbl_02;
DROP SEQUENCE member_tbl_02_SQ;
DROP SEQUENCE money_tbl_02_SQ;

CREATE TABLE member_tbl_02(
    custno NUMBER(6) PRIMARY KEY,
    custname VARCHAR2(20),
    phone VARCHAR2(13),
    address VARCHAR2(50),
    joindate DATE,
    grade CHAR(1),
    city CHAR(2)
);

CREATE TABLE money_tbl_02(
    custno NUMBER(6) REFERENCES member_tbl_02(custno),
    saleno NUMBER(8) PRIMARY KEY,
    pcost NUMBER(8),
    amount NUMBER(4),
    price NUMBER(8),
    pcode VARCHAR2(4),
    sdate DATE
);

CREATE SEQUENCE member_tbl_02_SQ
    START WITH 100001
    MAXVALUE 999999
    NOCYCLE 
    NOCACHE;

CREATE SEQUENCE money_tbl_02_SQ
    START WITH 20160001
    MAXVALUE 99999999
    NOCYCLE
    NOCACHE;

COMMIT;

INSERT INTO member_tbl_02 (custno, custname, phone, address, joindate, grade, city)
    VALUES (member_tbl_02_SQ.NEXTVAL, '김행복', '010-1111-2222', '서울 동대문구 휘경1동', '20151202', 'A', '01');
INSERT INTO member_tbl_02 (custno, custname, phone, address, joindate, grade, city)
    VALUES (member_tbl_02_SQ.NEXTVAL, '이축복', '010-1111-3333', '서울 동대문구 휘경2동', '20151206', 'B', '01');
INSERT INTO member_tbl_02 (custno, custname, phone, address, joindate, grade, city)
    VALUES (member_tbl_02_SQ.NEXTVAL, '장믿음', '010-1111-4444', '울릉군 을릉읍 독도1리', '20151001', 'B', '30'); 
INSERT INTO member_tbl_02 (custno, custname, phone, address, joindate, grade, city)
    VALUES (member_tbl_02_SQ.NEXTVAL, '최사랑', '010-1111-5555', '울릉군 을릉읍 독도2리', '20151113', 'A', '30');    
INSERT INTO member_tbl_02 (custno, custname, phone, address, joindate, grade, city)
    VALUES (member_tbl_02_SQ.NEXTVAL, '진평화', '010-1111-6666', '제주도 제주시 외나무골', '20151225', 'B', '60');
INSERT INTO member_tbl_02 (custno, custname, phone, address, joindate, grade, city)
    VALUES (member_tbl_02_SQ.NEXTVAL, '차공단', '010-1111-7777', '제주도 제주시 감나무골', '20151211', 'C', '60');     
    
SELECT*FROM member_tbl_02;
COMMIT;

INSERT INTO money_tbl_02 (custno, saleno, pcost, amount, price, pcode, sdate)
    VALUES (100001, money_tbl_02_SQ.NEXTVAL, 500, 5, 2500, 'A001', '20160101');
INSERT INTO money_tbl_02 (custno, saleno, pcost, amount, price, pcode, sdate)
    VALUES (100001, money_tbl_02_SQ.NEXTVAL, 1000, 4, 4000, 'A002', '20160101'); 
INSERT INTO money_tbl_02 (custno, saleno, pcost, amount, price, pcode, sdate)
    VALUES (100001, money_tbl_02_SQ.NEXTVAL, 500, 3, 1500, 'A008', '20160101');
INSERT INTO money_tbl_02 (custno, saleno, pcost, amount, price, pcode, sdate)
    VALUES (100002, money_tbl_02_SQ.NEXTVAL, 2000, 1, 2000, 'A004', '20160102');    
INSERT INTO money_tbl_02 (custno, saleno, pcost, amount, price, pcode, sdate)
    VALUES (100002, money_tbl_02_SQ.NEXTVAL, 500, 1, 500, 'A001', '20160103');     
INSERT INTO money_tbl_02 (custno, saleno, pcost, amount, price, pcode, sdate)
    VALUES (100003, money_tbl_02_SQ.NEXTVAL, 1500, 2, 3000, 'A003', '20160103');
INSERT INTO money_tbl_02 (custno, saleno, pcost, amount, price, pcode, sdate)
    VALUES (100004, money_tbl_02_SQ.NEXTVAL, 500, 2, 1000, 'A001', '20160104');
INSERT INTO money_tbl_02 (custno, saleno, pcost, amount, price, pcode, sdate)
    VALUES (100004, money_tbl_02_SQ.NEXTVAL, 300, 1, 300, 'A005', '20160104');
INSERT INTO money_tbl_02 (custno, saleno, pcost, amount, price, pcode, sdate)
    VALUES (100004, money_tbl_02_SQ.NEXTVAL, 600, 1, 600, 'A006', '20160104');
INSERT INTO money_tbl_02 (custno, saleno, pcost, amount, price, pcode, sdate)
    VALUES (100004, money_tbl_02_SQ.NEXTVAL, 3000, 1, 3000, 'A007', '20160106');
 
SELECT*FROM money_tbl_02 ORDER BY salno;   

-- 회원번호 자동생성
SELECT CUSTNO+1 FROM (SELECT ROWNUM RN, A.* FROM(SELECT*FROM member_tbl_02 ORDER BY custno DESC)A) WHERE RN=1;

-- 회원등록
INSERT INTO member_tbl_02 (custno, custname, phone, address, joindate, grade, city)
    VALUES (member_tbl_02_SQ.NEXTVAL, '차공단', '010-1111-7777', '제주도 제주시 감나무골', '20151211', 'C', '60'); 

-- 회원목록조회
SELECT*FROM member_tbl_02 ORDER BY custno;

-- 회원정보수정
UPDATE member_tbl_02 SET 
    custname='김행복',
    phone='010-1111-2222',
    address='서울 동대문구 휘경1동',
    joindate='20151202',
    grade='A',
    city='01'
    WHERE custno=100001;
    
-- 회원매출조회
SELECT ME.custno CUSTNO, custname, grade, SUM(PRICE) price_sum 
    FROM member_tbl_02 ME, money_tbl_02 MO
    WHERE ME.custno=MO.custno
    GROUP BY ME.custno, CUSTNAME, GRADE
    ORDER BY PRICE_SUM DESC;