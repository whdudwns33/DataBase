-- 오라클 데이터베이스 테이블은 **사용자 테이블과 데이터 사전**으로 나뉩니다. 
-- 사용자 테이블은 데이터베이스를 통해 관리할 데이터를 저장하는 테이블을 의미 합니다.
-- 데이터 사전에는 데이터베이스 메모리, 성능, 사용자, 권한, 객체 등 오라클 데이터베이스 운영에 중요한 데이터가 보관

SELECT * FROM DICT;
SELECT TABLE_NAME FROM USER_TABLES;
-- SELECT * FROM DBA_TABLES;

-- 인덱스는 검색 성능을 개선하기 위해 별도의 색인 테이블에 등록 후 관리
-- 삽입 삭제 변경이 작은 경우 성능 저하가 될 수 있음
-- 기본키(PK)와 유일키(UQ) 경우는 자동으로 인덱스 자동 생성 됨
SELECT ROWID, EMPNO, ENAME FROM EMP;
-- EMP 테이블의 SAL 열에 인덱스 생성하기 
CREATE INDEX IDX_SAL ON EMP(SAL);
SELECT * FROM USER_IND_COLUMNS;

-- 복합 인덱스 생성
CREATE INDEX IDX_EMP_TUPLE ON EMP(JOB, DEPTNO);

-- 인덱스 삭제
DROP INDEX IDX_EMP_TUPLE;
DROP INDEX IDX_SAL;

-- 뷰(VIEW)란 하나 이상의 테이블을 조회하는 SELECT문을 저장한 객체
-- 복잡한 테이블을 단순화하기 위한 목적, 보안성 목적    
-- 뷰를 생성하기 위해서는 권한이 필요 
CREATE VIEW VW_EMP20 
AS (SELECT EMPNO, ENAME, JOB, DEPTNO
 FROM EMP 
 WHERE DEPTNO = 20); 
SELECT * FROM VW_EMP20;


