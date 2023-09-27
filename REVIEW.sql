DROP TABLE REVIEW;
COMMIT;

CREATE SEQUENCE NUMBER_SEQ
	START WITH 1
	INCREMENT BY 1
	MAXVALUE 9999
	MINVALUE 1
	NOCYCLE;

CREATE TABLE REVIEW (
    REVIEW_NUM NUMBER(4) PRIMARY KEY,
    MENU_NAME VARCHAR2(15) NOT NULL,
    SCORE NUMBER(1) NOT NULL,
    WRITE_REVIEW VARCHAR2(100) NOT NULL,
    USER_ID VARCHAR2(20) NOT NULL
    -- MENU_NAME  VARCHAR2(20) REFERENCES FOOD(MENU_NAME)
);

INSERT INTO REVIEW VALUES (NUMBER_SEQ.NEXTVAL, 'KMEAT', 4, '맛있어요.', 'jsm123');


SELECT * 
FROM REVIEW R JOIN CUSTOMER_INFO C
ON R.USER_ID = C.CUSTOMER_ID;


SELECT REVIEW_NUM, F.STORE_NUM, F.MENU_NAME, SCORE, R.WRITE_REVIEW, C.USER_ID
FROM REVIEW R
INNER JOIN FOOD F ON R.MENU_NAME = F.MENU_NAME
INNER JOIN CUSTOMER_INFO C ON R.USER_ID = C.USER_ID
AND F.MENU_NAME = ?;
