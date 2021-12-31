-- LIKE 함수
-- LIKE ('%특정 문자') - 특정문자로 끝나는 데이터 검색
-- LIKE ('특정 문자%') - 특정문자로 시작하는 데이터 검색
-- LIKE ('%특정 문자%') - 특정문자를 포함하는 데이터 검색

-- 복수의 특정문자를 포함하기 위해선 아래와 같이 OR을 사용하여 이을 수 있지만, 조건이 많아지면 까다로움.
-- 컬럼(필드)명 LIKE ('%특정문자1') OR 필드명 LIKE(%특정 문자%)
-- 컬럼명 REGEXP '특정문자1 | 특정문자2' 와 같이 사용할 수 있음.

SELECT ANIMAL_ID, NAME
FROM ANIMAL_INS
WHERE NAME LIKE '%EL%' AND ANIMAL_TYPE = 'DOG'
ORDER BY NAME ASC;