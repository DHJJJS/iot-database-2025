-- bookstbl - 59건
select * from bookstbl;

-- divtbl - 8건
select * from divtbl;

-- membertbl - 31건
select * from membertbl;

-- rentabltbl - 14건
select * from rentaltbl;

-- 1. 회원 테이블에서 이메일, 모바일, 이름, 주소 순으로 나오도록 검색하시오.(결과는 아래와 동일하게 나와야 하며, 전체 행의 개수는 31개입니다)

select Email,  
	   Mobile, 
       Names,
       addr 
  from membertbl;

-- 2. 함수를 사용하여 아래와 같은 결과가 나오도록 쿼리를 작성하시오.(전채 행의 개수는 59개입니다)
select Names as 도서명, Author as 저자, ISBN, Price as 정가
  from bookstbl
 where ISBN like '9788%'
  order by ISBN ASC;
  
-- 3. 다음과 같은 결과가 나오도록 SQL 문을 작성하시오.(책을 한번도 빌린적이 없는 회원을 뜻합니다. 18명이 나옵니다.)
select m.Names as '비대여자명', m.Levels as '등급', m.Addr as '주소', r.rentalDate as '대여일'
  from membertbl as m
  left JOIN rentaltbl as r ON m.Idx = r.Idx
  Where r.rentalDate is Null
  order by m.Levels ASC;

-- 4. 다음과 같은 결과가 나오도록 SQL 문을 작성하시오.
select d.Names as '장르', sum(b.price) as '총합계금액'
  from divtbl as d
  join bookstbl as b ON d.Division = b.Division
 group by d.names with rollup
 order by d.names ASC;
 
SELECT d.Names AS '장르', SUM(b.price) AS '총합계금액'
  FROM divtbl AS d 
  JOIN bookstbl AS b ON d.Division = b.Division
GROUP BY d.Names
UNION ALL
SELECT '--합계--' AS '장르', SUM(b.price) AS '총합계금액'
FROM bookstbl as b;

