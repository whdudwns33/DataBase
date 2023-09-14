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


