-- 문자함수: 문자 데이터를 가공하는 것
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME/*앞글자만 대문자*/)
FROM EMP;

SELECT *
FROM EMP
WHERE UPPER(ENAME) = UPPER('james');


-- 문자열길이를 반환하는 LENGTH
-- 문자열의 바이트를 반환 LENGTHB
SELECT LENGTH('한글'), LENGTHB('한글')
FROM DUAL; 

-- SUBSTR / SUBSTRD
-- 데이터베이스는 시작 위치가 0이 아님. 2번째 매개변수는 시작 지점
-- 3번째 매개변수는 생략하면 끝까지
SELECT JOB, SUBSTR(JOB, 1, 2), SUBSTR(JOB, 3, 2), SUBSTR(JOB, 5)
FROM EMP;

SELECT JOB,
    SUBSTR(JOB, -LENGTH(JOB)),      -- 음수는 뒤에서 부터 계산, 길이에 대한 음수값으로 역순 접근
    SUBSTR(JOB, -LENGTH(JOB), 2),   -- SALESMAN, -8이면 S위치에서 2자리 출력.
    SUBSTR(JOB, -3)                 -- 뒤에서 3자리 출력
FROM EMP;

-- INSTR : 문자열 데이터 안에 특정 문자나 문자열이 어디에 포함되어 있는지 알고자 할 때 사용
SELECT 
    INSTR('HELLO, ORACLE!' /*STRING*/,
                 'L' /*SUBSTRING* 찾을 문자*/)AS INSTR1,
    INSTR('HELLO, ORACLE!','L',5)AS INSTR2,
    INSTR('HELLO, ORACLE!' /*STRING*/,
               'L' /*SUBSTRING*/,
               2 /*POSITION 시작위치*/,
               2 /*OCCURRENCE 몇번 째 인지*/)AS INSTR3
FROM DUAL;



-- 특정 문자가 포함된 행 찾기
SELECT *
FROM EMP
WHERE INSTR(ENAME, 'S') > 0;

SELECT *
FROM EMP
WHERE ENAME LIKE '%S%';


-- REPLACE : 특정문자열에 포함된 문자를 다른 문자로 대체
-- 대체할 문자가 없으면 삭제
SELECT '010-1234-5678' AS REPLACE_BEFORE,
    REPLACE('010-1234-5678', '-' , ' ') AS REPLACE_1,
    REPLACE('010-1234-5678', '-') AS REPLACE_2
FROM DUAL;

-- LPAD/ RPAD: 기준 공간의 칸 수를 특정 문자로 채우는 함수
SELECT LPAD('ORACLE', 10, '+')
FROM DUAL;
SELECT RPAD('ORACLE', 10, '+')
FROM DUAL;

SELECT 'ORACLE',
    LPAD('ORACLE', 10, '#') AS LPAD_1,
    RPAD('ORACLE', 10, '*') AS RPAD_1,
    LPAD('ORACLE', 10) AS LPAD_2,
    RPAD('ORACLE', 10) AS RPAD_2
FROM DUAL;

-- 개인정보 뒷자리 *표시로 출력하기
SELECT 
    RPAD('971225-', 14, '*') AS RPAD_1,
    RPAD('010-9188-', 13, '*') AS RPAD_2
FROM DUAL;


-- 두 문자열을 합치는 CONCAT
SELECT CONCAT(ENAME, EMPNO),
    CONCAT(EMPNO, CONCAT(':', ENAME))
FROM EMP
WHERE ENAME = 'JAMES';


-- TRIM / LTRIM/ RTRIM : 문자열 내에서 특정 문자열을 지우기 위해 사용
-- 삭제할 문자를 지정하지 않으면 공백 제거(공백 제거 용도로는 괜찮음)
SELECT '[' || TRIM('    _Oracle_    ') || ']' AS TRIM,

 '[' || LTRIM('    _Oracle_     ') || ']' AS LTRIM,

 '[' || LTRIM('     <_Oracle_>      ', '<_') || ']' AS LTRIM_2,

 '[' || RTRIM('     _Oracle_     ') || ']' AS RTRIM,

 '[' || RTRIM('   <_Oracle_>',    '_>') || ']' AS RTRIM_2
 FROM DUAL;


SELECT TRIM('+' || '              ASDAD       ' || '+')
FROM DUAL;


-- 날짜 데이터를 다루는 날짜 함수
-- SYSDATE: 운영체계의 현재 날짜와 시간 정보를 가져옴
SELECT SYSDATE FROM DUAL;

-- 날짜 데이터는 정수값의 +, -가 가능
SELECT SYSDATE AS 오늘,
SYSDATE - 1 AS 어제,
SYSDATE + 1 AS 내일
FROM DUAL;


-- 몇 개월 이후 날짜 구하는 ADD_MONTHZ
-- 특정 날짜에 지정한 개월 수 이후의 날짜 데이터를 반환하는 함수
SELECT SYSDATE, 
ADD_MONTHS(SYSDATE, 3) -- 2번째 인자는 달수를 의미
FROM DUAL;

-- EMP TABLE에서 입사 10주년이 되는 사원들 데이터 출력
SELECT EMPNO, ENAME, HIREDATE,
    ADD_MONTHS(HIREDATE, 120) AS 입사10주년
FROM EMP;


-- SYSDATE와 ADD_MONTHS 함수를 사용하여 현재 날짜와 6개월 후 날짜 출력
SELECT SYSDATE AS 오늘
FROM DUAL;

SELECT SYSDATE, ADD_MONTHS(SYSDATE, 6) AS 시간을달려서
FROM DUAL;

-- 두 날짜간의 개월 수 차이 구하기
SELECT EMPNO, ENAME, HIREDATE, SYSDATE, 
    MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MONTH01,
    MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTH02,
    TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTH03,-- 소수점 이하 삭제
    ROUND(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTH04-- 반올림
FROM EMP;

-- 날짜 정보 추출 함수
-- EXTRACT 함수는 날짜 유형의 데이터로 부터 날짜 정보를 분리하여 새로운 컬럼의 형태로 추출
SELECT EXTRACT(YEAR FROM DATE '2023 - 09 -15')
FROM DUAL;


SELECT * 
FROM EMP
WHERE EXTRACT(MONTH FROM HIREDATE)  = 12;


-- 9. **오늘 날짜에 대한 정보 조회**
SELECT SYSDATE FROM DUAL;
-- 10. **EMP테이블에서 사번, 사원명, 급여 조회
--   (단, 급여는 100단위까지의 값만 출력 처리하고 급여 기준 내림차순 정렬)**
SELECT EMPNO, ENAME, 
    ROUND(SAL, -2) 
FROM EMP
ORDER BY ROUND(SAL, -2) DESC; 
-- 11. **EMP테이블에서 사원번호가 홀수인 사원들을 조회**
SELECT * FROM EMP
WHERE MOD(EMPNO, 2) = 1;
-- 12. **EMP테이블에서 사원명, 입사일 조회 (단, 입사일은 년도와 월을 분리 추출해서 출력)**
SELECT ENAME, 
    EXTRACT(YEAR FROM HIREDATE), 
    EXTRACT(MONTH FROM HIREDATE)
FROM EMP;
-- 13. **EMP테이블에서 9월에 입사한 직원의 정보 조회**
SELECT * 
FROM EMP
WHERE EXTRACT(MONTH FROM HIREDATE) = 9;

-- 14. **EMP테이블에서 81년도에 입사한 직원 조회**
SELECT * 
FROM EMP
WHERE EXTRACT(YEAR FROM HIREDATE) = 1981;

-- 15. **EMP테이블에서 이름이 'E'로 끝나는 직원 조회**
SELECT *
FROM EMP
WHERE ENAME LIKE '%E';

-- 16. **EMP테이블에서 이름의 세 번째 글자가 'R'인 직원의 정보 조회**
SELECT *
FROM EMP
WHERE INSTR(ENAME, 'R') = 3;


-- - **LIKE 사용**
-- 1. **EMP테이블에서 사번, 사원명, 입사일, 입사일로부터 40년 되는 날짜 조회**
SELECT EMPNO, ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 480)
FROM EMP;
-- 2. **EMP테이블에서 입사일로부터 38년 이상 근무한 직원의 정보 조회**
SELECT *
FROM EMP
WHERE MONTHS_BETWEEN(SYSDATE, HIREDATE) >= 38;
-- 3. **오늘 날짜에서 년도만 추출**
SELECT EXTRACT(YEAR FROM SYSDATE)
FROM DUAL;

