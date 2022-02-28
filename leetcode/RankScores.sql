-- RANK() OVER (ORDER BY 컬럼명 정렬순서) -> 하나의 컬럼 생성 가능
-- RACK() 함수의 경우, VALUE가 같으면 같은 수위를 가짐.
-- 하지만 같은 경우가 생기면, 다음 순위는 건너뜀. -> 이래서 정답이 아님
SELECT SCORE, RANK() OVER (ORDER BY SCORE DESC) AS 'RANK'
FROM SCORES;


-- DENSE_RANK()의 경우 같은 경우가 생겨도 다음 순위를 이어감.
SELECT SCORE, DENSE_RANK() OVER (ORDER BY SCORE DESC) AS 'RANK'
FROM SCORES;

-- 여기서 나온 OVER함수는 RANK함수와 무조건 같이 나오는 함수로, OVER 안에 있는
-- ORDER BY 함수로 정렬된 데이터들 순서로 랭킹의 순위를 매기고, 추출함