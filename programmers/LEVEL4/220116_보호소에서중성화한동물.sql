SELECT O.ANIMAL_ID, O.ANIMAL_TYPE, O.NAME
FROM ANIMAL_OUTS AS O
INNER JOIN ANIMAL_INS AS I ON O.ANIMAL_ID = I.ANIMAL_ID
WHERE I.SEX_UPON_INTAKE LIKE '%INTACT%' AND (O.SEX_UPON_OUTCOME LIKE '%SPAYED%' OR O.SEX_UPON_OUTCOME LIKE '%NEUTERED%')
ORDER BY O.ANIMAL_ID ASC;