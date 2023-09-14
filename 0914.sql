-- 정렬을 위한 ORDER BY 절. 
SELECT * FROM EMP
ORDER BY SAL ASC; --  ASC는 오름차순

--  사원 번호로 오름차순
SELECT * FROM EMP
ORDER BY SAL ASC;
-- 내림차순
SELECT * FROM EMP
ORDER BY SAL DSC;

-- 여러 칼럼 기준 정렬
-- 정렬 조건을 넣지 않으면 기본적으로 내림차순
-- 급여순으로 정렬하고 급여가 같은 경우 이름순으로 정렬
SELECT * FROM EMP
ORDER BY SAL, ENAME; 
-- 정렬 키워드는 데이터의 뒤로 가야함
-- 급여는 오름차순, 이름번호는 내림차순
SELECT * FROM EMP
ORDER BY SAL ASC, ENAME DESC; 

SELECT * FROM EMP;
-- 연결 연산자: SELECT 문 조회시 컬럼 사이에 특정 문자를
-- 넣고 싶을 때 사용
SELECT ENAME || '`S JOB IS ' || JOB AS EMPLOYEE
FROM EMP;





SELECT * FROM EMP;
-- 연습문제
-- 1. 사원이름이 S로 끝나는 사원 데이터 출력
SELECT ENAME FROM EMP
WHERE ENAME LIKE '%S';

-- 2. 30번 부서에서 근무하는 사원 중 직책이 SALESMAN인
-- 사원의 사원 번호 이름, 직책, 급여, 부서번호 출력
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO FROM EMP
WHERE DEPTNO = 30 AND JOB = 'SALESMAN';

-- 3. 20번 , 30번 부서에서 근무하는 사원 중 급여가 2000초과인
-- 사원의 사원번호, 이름, 급여, 부서 번호 출력
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO FROM EMP
WHERE DEPTNO IN (20,30) AND SAL > 2000;

-- 4. BETWEEN 연산자 사용하지 않고 급여가 2000이상 3000이하 출력
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO FROM EMP
WHERE SAL >= 2000 AND SAL <= 3000;

-- 5. 사원 이름에 E가 포함되어 있는 30번 부서의 사원 중 급여가
--  1000 ~ 2000 사이가 아닌 사원 이름 , 사원 번호, 급여, 부서 번호 출력
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO FROM EMP
WHERE DEPTNO = 30 
AND ENAME LIKE '%E%'
AND (1000 > SAL OR 2000 < SAL);
-- SAL NOT BETWEEN 1000 AND 2000

-- 6. 추가 수당이 존재 하지 않고 상급자가 있고 직책이 MANAGER, CLERK인
-- 사원 중에서 사원 이름의 두 번째 글자가 L이 아닌 사원의 정보 출력
SELECT * FROM EMP
WHERE COMM IS NULL
AND MSG IS NOT NULL
AND JOB IN ('MANAGER','CLERK')
AND ENAME NOT LIKE '_L%';



