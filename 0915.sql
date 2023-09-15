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






