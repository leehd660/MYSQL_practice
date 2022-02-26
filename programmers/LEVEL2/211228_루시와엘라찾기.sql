-- OR함수를 여러 번 사용해서 문제 해결
SELECT ANIMAL_ID, NAME, SEX_UPON_INTAKE
FROM ANIMAL_INS
WHERE NAME = 'Lucy' OR NAME = 'Ella' OR NAME = 'Pickle' OR NAME = 'Rogan' OR NAME = ' Sabrina' OR NAME = 'Mitty'
ORDER BY ANIMAL_ID ASC;

-- WHERE절 안에 IN함수를 사용하여 문제 해결
SELECT ANIMAL_ID, NAME, SEX_UPON_INTAKE
FROM ANIMAL_INS
WHERE NAME IN ('Lucy','Ella','Pickle','Rogan','Sabrina','Mitty')
ORDER BY ANIMAL_ID ASC;