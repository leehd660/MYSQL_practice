-- create function을 이용해서 함수를 만들 수 있고, 원하는 파라미터를 받아서 이용할 수 있음.

-- leetcode에서 제공하는 mysql버전에서 서브쿼리에 limit함수를 제공하지 않아서 실패.
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
-- 여기서 쓰는 N이 왜 sql문 안에서 못쓰는지 모르겠음.
-- 꼭 n을 만들어서 넣어줘야하나?
  SET n=N-1;
  RETURN (
      # Write your MySQL query statement below.
        SELECT MAX(SALARY)
        FROM EMPLOYEE 
        WHERE SALARY NOT IN (
            SELECT SALARY
            FROM EMPLOYEE
            ORDER BY SALARY DESC
            LIMIT n)
  );
END


-- 위에 코드는 서브쿼리이고, 아래 1번 코드는 서브쿼리가 아닌가????????


-- 1. 
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
-- LIMIT나 OFFSET에서 사칙연산이 불가능한 것으로 보임.
-- SET N=N-1;을 없애니 파라미터의 n을 가져와서 정답이 틀림.
-- SQL문은 대소문자 구분이 없기 때문에, 
  SET n=N-1;
  RETURN (
      # Write your MySQL query statement below.
        SELECT IFNULL(
          (SELECT DISTINCT SALARY
            FROM EMPLOYEE
            ORDER BY SALARY DESC
            -- OFFSET : N이라고 하면, N+1번째부터 시작해서 LIMIT의 개수를 뽑는 것.
            LIMIT 1 OFFSET N),
          NULL)
  );
END

-- 2. IFNULL을 사용하지 않아도 정답. ->하지만 더 느림. 그럴 이유는 있나?
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  SET n=N-1;
  RETURN (
    SELECT DISTINCT SALARY
    FROM EMPLOYEE
    ORDER BY SALARY DESC
    LIMIT 1 OFFSET N)
  );
END