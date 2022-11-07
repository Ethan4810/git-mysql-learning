SHOW DATABASES;

## CREATE `BOOKSTORE` DATABASE
DROP DATABASE `BOOKSTORE`;
CREATE DATABASE `BOOKSTORE`;
USE `BOOKSTORE`;


## CREATE TABLES
-- CREATE `CUSTOMER` TABLE
CREATE TABLE `CUSTOMER` (
    cust_id INT NOT NULL PRIMARY KEY,
    cust_name VARCHAR(20) NOT NULL,
    cust_address VARCHAR(20),
    phone_number VARCHAR(20)
);

-- CREATE `BOOK` TABLE
CREATE TABLE `BOOK` (
    book_id INT NOT NULL PRIMARY KEY,
    book_name VARCHAR(20) NOT NULL,
    publisher_name VARCHAR(20) NOT NULL,
    book_price NUMERIC(5 , 0 )
);

-- CREATE `ORDER` TABLE
CREATE TABLE `ORDER` (
    order_id INT NOT NULL,
    cust_id INT NOT NULL,
    book_id INT NOT NULL,
    sale_price NUMERIC(5 , 0 ),
    order_date DATETIME NOT NULL,
    PRIMARY KEY (order_id , cust_id , book_id),
    FOREIGN KEY (cust_id)
        REFERENCES `CUSTOMER` (cust_id),
    FOREIGN KEY (book_id)
        REFERENCES `BOOK` (book_id)
);

-- DESCRIBE TABLE INFO
SHOW TABLES; 
DESCRIBE `CUSTOMER`;
DESCRIBE `BOOK`;
DESCRIBE `ORDER`;


## INSERT VALUES INTO TABLES
-- INSERT VALUES INTO `CUSTOMER` TABLE
INSERT INTO `CUSTOMER` VALUES(1, '박지성', '영국 맨체스터', '010-5000-0001');
INSERT INTO `CUSTOMER` VALUES(2, '김연아', '대한민국 서울', '010-6000-0002');
INSERT INTO `CUSTOMER` VALUES(3, '장미란', '대한민국 강원', '010-7000-0003');
INSERT INTO `CUSTOMER` VALUES(4, '추신수', '미국 클리브랜드', '010-8000-0004');
INSERT INTO `CUSTOMER` VALUES(5, '박세리', '대한민국 대전', NULL);

-- INSERT VALUES INTO `BOOK` TABLE
INSERT INTO `BOOK` VALUES(1, '축구의 역사', '굿스포츠', 7000);
INSERT INTO `BOOK` VALUES(2, '축구 아는 여자', '나무수', 13000);
INSERT INTO `BOOK` VALUES(3, '축구의 이해', '대한미디어',22000);
INSERT INTO `BOOK` VALUES(4, '골프 바이블', '대한미디어', 35000);
INSERT INTO `BOOK` VALUES(5, '피겨 교본', '굿스포츠', 8000);
INSERT INTO `BOOK` VALUES(6, '역도 단계별 기술', '굿스포츠', 6000);
INSERT INTO `BOOK` VALUES(7, '야구의 추억', '이상미디어', 20000);
INSERT INTO `BOOK` VALUES(8, '야구를 부탁해', '이상미디어', 13000);
INSERT INTO `BOOK` VALUES(9, '올림픽 이야기', '삼성당', 7500);
INSERT INTO `BOOK` VALUES(10, 'Olympic Champions', 'Pearson', 13000);

-- INSERT VALUES INTO `ORDER` TABLE
INSERT INTO `ORDER` VALUES(1, 1, 1, 6000, '2013-07-01');
INSERT INTO `ORDER` VALUES(2, 1, 3, 21000, '2013-07-03');
INSERT INTO `ORDER` VALUES(3, 2, 5, 8000, '2013-07-03');
INSERT INTO `ORDER` VALUES(4, 3, 6, 6000, '2013-07-04');
INSERT INTO `ORDER` VALUES(5, 4, 7, 20000, '2013-07-05');
INSERT INTO `ORDER` VALUES(6, 1, 2, 12000, '2013-07-07');
INSERT INTO `ORDER` VALUES(7, 4, 8, 13000, '2013-07-07');
INSERT INTO `ORDER` VALUES(8, 3, 10, 12000, '2013-07-08');
INSERT INTO `ORDER` VALUES(9, 2, 10, 7000, '2013-07-09');
INSERT INTO `ORDER` VALUES(10, 3, 8, 13000, '2013-07-10');


## UPDATE VALUE OF TABLE
-- 고객 테이블에서 고객번호가 5인 고객의 주소를 ‘대한민국 부산’으로 변경하세요.
UPDATE `CUSTOMER` SET cust_address = '대한민국 부산' WHERE  cust_id=5;

-- 고객 테이블에서 박세리 고객의 주소를 김연아 고객의 주소로 변경하세요.
-- UPDATE `CUSTOMER` 
-- SET 
--     cust_address = (SELECT 
--             cust_address
--         FROM
--             `CUSTOMER`
--         WHERE
--             cust_name = '김연아')
-- WHERE
--     cust_name = '박세리';

## BASIC OPERATIONS
-- 고객의 모든 정보를 구하세요.
SELECT 
    *
FROM
    `CUSTOMER`;

-- 도서 테이블에 있는 모든 출판사를 중복없이 검색하세요.
SELECT DISTINCT
    publisher_name
FROM
    `BOOK`;

-- 고객의 이름과 고객이 주문한 도서의 이름을 구하세요.
SELECT 
    `CUSTOMER`.cust_name, `BOOK`.book_name
FROM
    `CUSTOMER`,
    `ORDER`,
    `BOOK`
WHERE
    `CUSTOMER`.cust_id = `ORDER`.cust_id
        AND `BOOK`.book_id = `ORDER`.book_id;


# WILDCARD  OPERATIONS
-- 고객 테이블에서 성이 '박'씨인 고객을 출력하세요.
SELECT 
    *
FROM
    `CUSTOMER`
WHERE
    cust_name LIKE '박%';

-- 고객 테이블에서 성이 '박'씨이고 세번째 글자는 '리'인 고객을 출력ㅌ하세요.
SELECT 
    *
FROM
    `CUSTOMER`
WHERE
    cust_name LIKE '박_리';

-- 고객 테이블에서 이름의 두번째 글자가 '신'이고 그 뒤는 무엇이든 관계없는 고객을 출력하세요.
SELECT 
    *
FROM
    `CUSTOMER`
WHERE
    cust_name LIKE '_신%';

-- 도서 테이블에서 도서 이름에 ‘축구’가 포함된 책 이름과 출판사를 검색하세요.
SELECT 
    book_name, publisher_name
FROM
    `BOOK`
WHERE
    book_name LIKE '%축구%';

-- 도서 테이블에서 축구에 관한 도서 중 가격이 20,000원 이상인 도서를 검색하세요.
SELECT 
    book_name, publisher_name
FROM
    `BOOK`
WHERE
    book_name LIKE '%축구%'
        AND book_price >= 20000;


## CONDITIONAL OPERATIONS
-- 도서 테이블에서 출판사가 '굿스포츠' 혹은 '대한미디어'인 도서를 검색하세요.	 	
SELECT 
    *
FROM
    `BOOK`
WHERE
    publisher_name = '굿스포츠'
        OR publisher_name = '대한미디어';

-- 도서 테이블에서 가격이 10,000원 이상 20,000 이하인 도서를 검색하세요.
SELECT 
    *
FROM
    `BOOK`
WHERE
    10000 <= book_price AND book_price <= 20000;

-- 도서 테이블에서 가격이 10,000원 이상 20,000 이하인 도서를 검색하세요.
SELECT 
    *
FROM
    `BOOK`
WHERE
    book_price BETWEEN 10000 AND 20000;
   

## ORDER BY OPERATIONS
-- 도서를 가격 기준으로 내림차순으로 정렬하고, 만약 가격이 같다면 출판사 기준으로 오름차순으로 정렬하세요.
SELECT 
    *
FROM
    `BOOK`
ORDER BY book_price DESC , publisher_name ASC;

-- 도서를 ID를 기준으로 내림차순으로 정렬하세요.
SELECT 
    *
FROM
    `BOOK`
ORDER BY book_id DESC;

-- 도서를 제목 기준으로 오름차순으로 정렬하세요.
SELECT 
    *
FROM
    `BOOK`
ORDER BY book_name ASC;

-- 고객과 고객의 주문에 관한 데이터를 모두 고객번호 순으로 정렬세요.
SELECT 
    *
FROM
    `CUSTOMER`,
    `ORDER`
WHERE
    `CUSTOMER`.cust_id = `ORDER`.cust_id
ORDER BY `CUSTOMER`.cust_id;
        

## ARITHMETIC OPERATIONS
-- 고객이 주문한 도서의 총판매액, 평균값, 최저가, 최고가, 건수를 구하세요.
SELECT 
    SUM(sale_price) AS tot_price,
    AVG(sale_price) AS avg_price,
    MIN(sale_price) AS min_price,
    MAX(sale_price) AS max_price,
    COUNT(*) AS counts
FROM
    `ORDER`;
       
-- 2번 고객이 주문한 도서의 총 판매액을 총매출로 구하세요.
SELECT SUM(sale_price) AS tot_price_2
       FROM `ORDER` 
       WHERE cust_id=2;


## GROUP BY OPERATIONS
-- 도서 테이블에서 출판사별로 도서의 평균가격을 구하세요.
SELECT 
    publisher_name, AVG(book_price) AS avg_price
FROM
    `BOOK`
GROUP BY publisher_name;
        
-- 가격이 8,000원 이상인 도서를 두 권 이상 구매한 고객에 대하여 고객별 주문 도서의 총 수량을 구하세요.
SELECT cust_id, COUNT(*) AS book_counts 
       FROM `ORDER` 
       WHERE sale_price >= 8000 
       GROUP BY cust_id HAVING COUNT(*) >= 2;
     
-- 고객별로 주문한 모든 도서의 총 판매액을 구하고, 고객별로 정렬하세요.
SELECT 
    cust_name, SUM(sale_price)
FROM
    `CUSTOMER`,
    `ORDER`
WHERE
    `CUSTOMER`.cust_id = `ORDER`.cust_id
GROUP BY `CUSTOMER`.cust_name
ORDER BY `CUSTOMER`.cust_name;


## ASSIGNING NICKNAME
-- 가격이 20,000원인 도서를 주문한 고객의 이름과 도서의 이름을 구하세요.
SELECT 
    C.cust_name, B.book_name
FROM
    `CUSTOMER` C,
    `ORDER` O,
    `BOOK` B
WHERE
    C.cust_id = O.cust_id
        AND B.book_id = O.book_id
        AND B.book_price = 20000;


## SET OPERATIONS
-- 도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서의 판매가격을 구하세요.
SELECT 
    `CUSTOMER`.cust_name, `ORDER`.sale_price
FROM
    `CUSTOMER`
        LEFT OUTER JOIN
    `ORDER` ON `CUSTOMER`.cust_id = `ORDER`.cust_id;
       
-- 도서 테이블에서 출판사가 '굿스포츠' 혹은 '대한미디어'인 도서를 검색하세요.	
SELECT 
    *
FROM
    `BOOK`
WHERE
    publisher_name IN ('굿스포츠' , '대한미디어');

-- 도서 테이블에서 출판사가 '굿스포츠' 혹은 '대한미디어'가 아닌 도서를 검색하세요.	
SELECT 
    *
FROM
    `BOOK`
WHERE
    publisher_name NOT IN ('굿스포츠' , '대한미디어');

-- 도서를 주문하지 않은 고객의 이름을 검색하세요.
SELECT 
    cust_name
FROM
    `CUSTOMER`
        LEFT OUTER JOIN
    `ORDER` ON `CUSTOMER`.cust_id = `ORDER`.cust_id
WHERE
    `ORDER`.cust_id IS NULL;


## SUB-QUERIES
-- 도서가격이 가장 비싼 도서의 이름을 검색하세요.
SELECT 
    book_name
FROM
    `BOOK`
WHERE
    book_price = (SELECT 
            MAX(book_price)
        FROM
            `BOOK`);

-- 도서를 구매한 적이 있는 고객의 이름을 검색하세요.
SELECT 
    cust_name
FROM
    `CUSTOMER`
WHERE
    cust_id IN (SELECT 
            cust_id
        FROM
            `ORDER`);
            
-- ‘대한미디어’에서 출판한 도서를 구매한 고객의 이름을 검색하세요. 
SELECT 
    cust_name
FROM
    `CUSTOMER`
WHERE
    cust_id IN (SELECT 
            cust_id
        FROM
            `ORDER`
        WHERE
            book_id IN (SELECT 
                    book_id
                FROM
                    `BOOK`
                WHERE
                    publisher_name = '대한미디어'));

-- ‘주문이 있는 고객의 이름과 주소를 검색하세요.
SELECT 
    cust_name, cust_address
FROM
    `CUSTOMER`
WHERE
    EXISTS( SELECT 
            *
        FROM
            `ORDER`
        WHERE
            `CUSTOMER`.cust_id = `ORDER`.cust_id);
