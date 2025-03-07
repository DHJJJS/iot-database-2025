
📌 새로운 연습 문제 (SQL Query Practice)
1️⃣ 기본 집계 함수 (SUM, AVG, MIN, MAX, COUNT)
모든 고객이 주문한 도서의 총 판매액, 평균 판매액, 최고가, 최저가를 구하시오.
select sum(price) as sum_price, min(price) as min_price, max(price) as max_price
  from book
 where avg(price) as avg_price
3번 고객이 주문한 도서의 총 판매액을 구하시오.
select sum(price) as 3.custid
  from book;
전체 주문에서 가장 비싼 도서의 가격과 가장 저렴한 도서의 가격을 구하시오.
select max(price) as max_price,
	   min(price) as min_price
  from book;
마당서점에서 총 몇 권의 도서가 판매되었는지 구하시오.
select count(*)
  from book;
모든 주문의 판매 가격의 표준편차를 구하시오.
select STD(price) as std_price
  from book;
2️⃣ GROUP BY & HAVING
고객별로 주문한 도서의 총 판매액을 구하시오.
select sum(salesprice)
  from Orders
 group by custid;
고객별로 주문한 도서의 개수를 구하시오.
select count(saleprice) as count_sales
  from Orders
 group by custid;
총 주문 금액이 50,000원 이상인 고객들만 출력하시오.
select *
  from Orders
 group by custid having (sum(saleprice) >= 50000);
도서를 2권 이상 구매한 고객만 출력하시오.
select custid
  from Orders
 group by custid
 having count(*) >= 2;
출판사별로 출판한 도서 개수를 구하시오.
select custid, count(*) as count_sale
  from book
 group by publisher;
3️⃣ ORDER BY
고객별 총 주문 금액을 구하고, 가장 많이 주문한 고객부터 정렬하시오.
select custid, sum(price) as sumprices
  from orders
 order by custid max(price) as maxprices asc;
주문한 도서의 가격을 기준으로 비싼 순서대로 정렬하시오.
SELECT custid, MAX(saleprice) AS maxprice  
FROM orders  
GROUP BY custid  
ORDER BY maxprice DESC;

출판사별로 평균 도서 가격을 구하고, 평균 가격이 높은 순서대로 정렬하시오.
select publisher, avg(bookprice) as avgbookprice
  from book
 group by publisher
 order by avgbookprice ASC;

4️⃣ JOIN
고객의 이름과 주문한 도서의 이름을 출력하시오.
select name.custid, bookname
  from book;
도서를 구매한 고객의 이름과 주소, 주문한 도서의 제목, 가격을 함께 출력하시오.
가격이 15,000원 이상인 도서를 주문한 고객의 이름과 도서 제목을 출력하시오.
도서를 구매하지 않은 고객도 포함하여, 고객의 이름과 구매한 도서의 제목을 출력하시오.
고객, 주문, 도서 테이블을 조인하여 고객 이름, 도서 제목, 출판사, 주문 가격을 출력하시오.
5️⃣ ROLLUP
고객별 총 주문 금액과 전체 합계를 구하시오.
출판사별 총 판매액을 구하고, 출판사별 합계와 전체 합계를 함께 출력하시오.
6️⃣ 서브쿼리 (SUBQUERY)
가장 비싼 도서의 제목을 출력하시오.
출판사별 평균 가격보다 비싼 도서를 출력하시오.
도서를 구매한 적이 있는 고객의 이름을 출력하시오.
"한빛미디어" 출판사의 도서를 구매한 고객의 이름을 출력하시오.
7️⃣ EXISTS
주문한 고객의 이름과 주소를 출력하되, 주문을 한 적이 없는 고객은 제외하시오.
특정 도서를 구매한 고객이 있는지 확인하기 위해, "자바 프로그래밍" 도서를 구매한 고객이 존재하는지 확인하시오.
