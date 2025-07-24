-- 모든 직원의 이름과 연봉 조회
SELECT name, salary FROM employees;

-- Frontend 직책 + 연봉 90000 이하 직원 조회
SELECT name, salary 
FROM employees 
WHERE position = 'Frontend' AND salary <= 90000;

-- PM 직책 직원 조회 (인상 후 확인용)
SELECT * FROM employees WHERE position = 'PM';

-- 직책별 평균 연봉 계산
SELECT position, AVG(salary) AS avg_salary 
FROM employees 
GROUP BY position;
