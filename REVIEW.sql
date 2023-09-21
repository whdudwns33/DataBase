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
    SCORE NUMBER(1) NOT NULL,
    WRITE_REVIEW VARCHAR2(100) NOT NULL,
    USER_ID VARCHAR2(20) REFERENCES CUSTOMER_INFO(CUSTOMER_ID)
    -- MENU_NAME  VARCHAR2(20) REFERENCES FOOD(MENU_NAME)
);
INSERT INTO REVIEW VALUES (NUMBER_SEQ.NEXTVAL, 2, '환불해주세요. ', 'USER1');
INSERT INTO REVIEW VALUES (NUMBER_SEQ.NEXTVAL, 4, '맛있는데 비싸요. ', 'USER1');

SELECT * 
FROM REVIEW R JOIN CUSTOMER_INFO C
ON R.USER_ID = C.CUSTOMER_ID;
