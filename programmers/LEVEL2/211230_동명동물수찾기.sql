-- 간단하게 이렇게 문제를 해결할 수 도 있음.
SELECT NAME, COUNT(NAME) AS 'COUNT' 
FROM ANIMAL_INS GROUP BY NAME HAVING (NAME IS NOT NULL AND COUNT >=2);

-- 이중 SELECT문을 이용해서 문제를 해결하였음.
-- 이중 SELECT문을 어디에 쓰는지에 따라 사용 방법이 달라지는데 보통 where문에서 사용하면 IN함수와 함께 쓰이고,
-- 여기서 사용한 FROM에서 쓰일 때는 조금 다름. FROM절에는 테이블명이 쓰이도록 되어있음. 따라서 SELECT문을 쓰고 난 후에, B처럼 테이블 명을 지정해줘야함.
-- 또한 여기서 'COUNT' 컬럼을 명명해줬는데 그걸 하지 않으면 테이블 명이 이상하게 나와서 WHERE절에서 사용하기가 힘듬.
SELECT *
FROM (SELECT A.NAME, COUNT(A.NAME) AS 'COUNT' FROM ANIMAL_INS A GROUP BY A.NAME HAVING A.NAME IS NOT NULL) B
ORDER BY NAME ASC;