-- DATETIME에서 DATE만 뽑아내거나 다른 모양으로 변환하고 싶을 때, DATE_FORMAT을 이용한다.
-- 거기에서 대문자냐 소문자냐의 차이가 어느정도 있는데, 보통 대문자면 4자리 연도, 풀네임영문월별 이름 등이 나오고
-- 소문자는 그냥 숫자나 두자리수만 나오는 경우가 많다.
SELECT ANIMAL_ID, NAME, DATE_FORMAT(DATETIME,'%Y-%m-%d') AS '날짜'
FROM ANIMAL_INS
ORDER BY ANIMAL_ID ASC;