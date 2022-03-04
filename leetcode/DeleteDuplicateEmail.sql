-- delete를 하는데 해당 P2를 지워도 P1과 P2는 원래 하나이기 때문에 Person 테이블에서 지워진다.
-- delete문에서도 join을 이용하여 sql문 작성하는 것을 배움!
DELETE P2 FROM PERSON P1
JOIN PERSON P2 ON P1.EMAIL = P2.EMAIL AND P1.ID<P2.ID;