-- 이렇게 코드를 짜면 시간대가 없는 데이터는 나오지 못함. 만약에 1시에 입양간 동물이 없으면 1시 테이블이 출력이 안되는 것.
SELECT HOUR(DATETIME) AS 'HOUR', COUNT(ANIMAL_ID) AS 'COUNT'
FROM ANIMAL_OUTS
GROUP BY HOUR(DATETIME)
ORDER BY HOUR(DATETIME);



-- WITH RECURSIVE문을 이용해서 문제를 해결함.
-- WITH RECURSIVE문은 임시테이블을 만드는 것인데, 여기서는 MY_TABLE이라는 테이블을 생성했음.
-- MY_TABLE의 h라는 컬럼을 만들었는데, 0부터 하나씩 추가하여 23까지 뽑는 것.
-- WHERE절이 제어문이고, UNION ALL을 이용해서 각각의 ROW를 하나로 묶어서 테이블을 형성
WITH RECURSIVE MY_TABLE AS (
    SELECT 0 AS h
    UNION ALL
    SELECT h+1 FROM MY_TABLE WHERE h < 23
)

-- 만든 MY_TABLE과 JOIN을 통해 문제 해결.
SELECT MY_TABLE.h AS 'HOUR', COUNT(ANIMAL_ID) AS 'COUNT'
FROM MY_TABLE
LEFT OUTER JOIN ANIMAL_OUTS ON HOUR(DATETIME) = MY_TABLE.h
GROUP BY MY_TABLE.h
ORDER BY MY_TABLE.h ASC;


-- 변수를 이용해서 문제를 해결하는 방법도 있음.