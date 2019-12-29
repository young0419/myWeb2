CREATE table student (
    id VARCHAR2(12) primary key,
    pw VARCHAR2(12) NOT NULL,
    name  VARCHAR2(10) NOT NULL,
    phone1 VARCHAR2(3) NOT NULL,
    phone2 VARCHAR2(4) NOT NULL,
    phone3 VARCHAR2(4) NOT NULL,
    email VARCHAR2(30) NOT NULL,
    zipcode VARCHAR2(7) NOT NULL,
    address1 VARCHAR2(120) NOT NULL,
    address2 VARCHAR2(50) NOT NULL
);

CREATE table zipcode (
    seq NUMBER primary key,
    zipcode VARCHAR2(7) NOT NULL,
    sido VARCHAR2(6) NOT NULL,
    gugun VARCHAR2(30) NOT NULL,
    dong VARCHAR2(50) NOT NULL,
    ri VARCHAR2(80),
    bunji VARCHAR2(20)
);