CREATE TABLE AGECATEGORIES 
(
  AGECATEGORY_ID NUMBER NOT NULL,
  AGECATEGORY_VALUE NUMBER NOT NULL,
  CONSTRAINT AGECATEGORIES_PK PRIMARY KEY (AGECATEGORY_ID)
);

CREATE TABLE PLATFORMS 
(
  PLATFORM_ID NUMBER NOT NULL, 
  NAME VARCHAR2(50) NOT NULL,
  CONSTRAINT PLATFORMS_PK PRIMARY KEY (PLATFORM_ID)
);

CREATE TABLE GENRES 
(
  GENRE_ID NUMBER NOT NULL, 
  NAME VARCHAR2(70) NOT NULL,
  CONSTRAINT GENRES_PK PRIMARY KEY (GENRE_ID)
);

CREATE TABLE PRODUCERS 
(
  PRODUCER_ID NUMBER NOT NULL, 
  NAME VARCHAR2(200 BYTE) NOT NULL, 
  COUNTRY VARCHAR2(100 BYTE), 
  CONSTRAINT PRODUCERS_PK PRIMARY KEY (PRODUCER_ID)
) ;

CREATE TABLE CUSTOMERS 
(
  CUSTOMER_ID NUMBER NOT NULL, 
  NAME VARCHAR2(50) NOT NULL, 
  SURNAME VARCHAR2(100) NOT NULL, 
  EMAIL VARCHAR2(100), 
  GENDER VARCHAR2(6), 
  BIRTH_DATE DATE, 
  CONSTRAINT CUSTOMERS_PK PRIMARY KEY (CUSTOMER_ID)
);

CREATE TABLE ORDERS 
(
  ORDER_ID NUMBER NOT NULL, 
  ORDER_DATE DATE, 
  CUSTOMER_ID NUMBER, 
  CONSTRAINT ORDERS_PK PRIMARY KEY (ORDER_ID),
  CONSTRAINT ORDERS_CUSTOMERS_FK FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS (CUSTOMER_ID)
);

CREATE TABLE GAMES 
(
  GAME_ID NUMBER NOT NULL, 
  NAME VARCHAR2(150) NOT NULL, 
  PRICE NUMBER, 
  AGECATEGORY_ID NUMBER, 
  PRODUCER_ID NUMBER, 
  GENRE_ID NUMBER, 
  PLATFORM_ID NUMBER, 
  ORDER_ID NUMBER, 
  CONSTRAINT GAMES_PK PRIMARY KEY (GAME_ID),
  CONSTRAINT GAMES_AGECATEGORIES_FK FOREIGN KEY (AGECATEGORY_ID) REFERENCES AGECATEGORIES (AGECATEGORY_ID),
  CONSTRAINT GAMES_GENRES_FK FOREIGN KEY (GENRE_ID) REFERENCES GENRES (GENRE_ID),
  CONSTRAINT GAMES_ORDERS_FK FOREIGN KEY (ORDER_ID) REFERENCES ORDERS (ORDER_ID),
  CONSTRAINT GAMES_PLATFORMS_FK FOREIGN KEY (PLATFORM_ID) REFERENCES PLATFORMS (PLATFORM_ID),
  CONSTRAINT GAMES_PRODUCERS_FK FOREIGN KEY (PRODUCER_ID) REFERENCES PRODUCERS (PRODUCER_ID)
);
