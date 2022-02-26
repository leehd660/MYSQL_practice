-- 테이블A JOIN 테이블B ON 조건문 : A와 B를 결합하는데, 조건문에 있는 컬럼을 기준으로 합침.
-- MYSQL에서는 기본적인 JOIN이 INNER JOIN이고, LEFT, RIGHT, FULL이 기본적으로 있음.
-- ON 뒤의 조건문을 설명하면, A JOIN B 여서 A 테이블이 가지고 있는 ID를 모두 뽑고, 그에 해당하는 B테이블을 연결한다는 의미
SELECT O.ANIMAL_ID, O.NAME
FROM ANIMAL_OUTS AS O
LEFT OUTER JOIN ANIMAL_INS AS I
ON O.ANIMAL_ID = I.ANIMAL_ID
WHERE I.ANIMAL_ID IS NULL
ORDER BY O.ANIMAL_ID;



-- A JOIN B ON 조건문 - 조건문을 A와 B에서 모두 일치하는 것만 뽑음.(여기서 중요한건 (INNER)JOIN는 A와 B 모두를 기준으로 한다는 점) - 교집합
-- A RIGHT JOIN B ON 조건문 - B.key를 모두 뽑는데, A에도 B.key를 갖는 데이터를 결합함.(여기서 중요한건 RIGHT는 B.key를 기준으로 한다는 점)
-- A LEFT JOIN B ON 조건문 - A.key를 모두 뽑는데, B에도 A.key를 갖는 데이터를 결합함.(여기서 중요한건 LEFT는 A.key를 기준으로 한다는 점)
-- A FULL JOIN B ON 조건문 - A와 B를 모두 뽑음.(여기서 중요한건 FULL는 서로 일치하는게 없어도 있는거 다 뽑음) - 합집합

-- EX)
-- A.key = {1,2,3,4,5}
-- B.key = {2,4,6,8,10}

-- A (INNER) JOIN B ON A.key = B.key 의 결과 값 : KEY가 2인 것과 4인 것만 나옴.
-- A LEFT (OUTER) JOIN B ON A.key = B.key 의 결과 값 : KEY가 1,2,3,4,5 인 것만 나옴.
-- A RIGHT (OUTER) JOIN B ON A.key = B.key 의 결과 값 : KEY가 2,4,6,8,10 인 것만 나옴.
-- A FULL (OUTER) JOIN B ON A.key = B.key 의 결과 값 : KEY가 1,2,3,4,5,6,8,10 전부 나옴.

-- -> A.key=B.key 의 의미가 같다는게 아니라 key를 서로 비교하겠다는 의미인 것으로 보임.