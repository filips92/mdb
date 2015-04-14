CREATE OR REPLACE 
PROCEDURE ADD_GAME
(
  NAME IN VARCHAR2,
  PRICE IN NUMBER,
  AGECATEGORY IN NUMBER,
  PRODUCER IN NUMBER,
  GENRE IN NUMBER,
  PLATFORM IN NUMBER
)
AS 
BEGIN
  INSERT INTO GAMES(NAME, PRICE, AGECATEGORY_ID, PRODUCER_ID, GENRE_ID, PLATFORM_ID) VALUES (NAME, PRICE,AGECATEGORY,PRODUCER,GENRE,PLATFORM);
END ADD_GAME;
/

CREATE OR REPLACE 
PROCEDURE ADD_GAME_TO_ORDER
(
  v_game_id IN NUMBER,
  v_customer_id IN NUMBER,
  v_order_id IN NUMBER
)
AS
  customer_year NUMBER;
  customer_age NUMBER:=0;
  current_year NUMBER := TO_CHAR(SYSDATE, 'yyyy');
  var_category NUMBER;
BEGIN
  SELECT agecategory_value INTO var_category FROM agecategories WHERE agecategory_id = (SELECT agecategory_id FROM games WHERE game_id = v_game_id);
  SELECT TO_CHAR(birth_date, 'yyyy') INTO customer_year FROM customers WHERE customer_id = v_customer_id;
  customer_age := current_year - customer_year;
  IF customer_age > var_category THEN
    UPDATE games SET order_id = v_order_id WHERE game_id = v_game_id;
    dbms_output.put_line('Game added to order');
  ELSE
    dbms_output.put_line('You are too young to buy this game'); 
  END IF;
END ADD_GAME_TO_ORDER;
/

CREATE OR REPLACE 
PROCEDURE CHANGE_EMAIL
(
  ID IN NUMBER,
  NEWEMAIL IN CUSTOMERS.EMAIL%TYPE
)
AS 
BEGIN
  UPDATE CUSTOMERS SET EMAIL = NEWEMAIL WHERE CUSTOMER_ID = ID;
END CHANGE_EMAIL;
/

CREATE OR REPLACE 
PROCEDURE GET_CUSTOMERS AS 
BEGIN
  FOR ITER IN (SELECT CUSTOMER_ID, NAME, SURNAME, EMAIL FROM CUSTOMERS ORDER BY CUSTOMER_ID) LOOP
  DBMS_OUTPUT.PUT_LINE(ITER.CUSTOMER_ID || ' ' || ITER.NAME || ' ' || ITER.SURNAME || ' ' || ITER.EMAIL);
  END LOOP;
END GET_CUSTOMERS;
/