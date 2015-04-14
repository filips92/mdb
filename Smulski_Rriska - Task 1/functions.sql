CREATE OR REPLACE 
FUNCTION CALCULATE_TOTAL_COST 
(
  v_order_id IN NUMBER
)
RETURN NUMBER IS
v_sum NUMBER := 0;
v_orders_count NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_orders_count FROM orders WHERE customer_id = (SELECT customer_id FROM orders WHERE order_id = v_order_id) AND order_id <= v_order_id;
  FOR game IN (SELECT price FROM games WHERE order_id = v_order_id) LOOP
  v_sum := v_sum + game.price;
  END LOOP;
  IF MOD(v_orders_count,10) = 0 THEN
  v_sum := v_sum * 0.9;
  END IF;
  RETURN v_sum;
END CALCULATE_TOTAL_COST;
/

CREATE OR REPLACE 
FUNCTION NR_OF_GAMES_FOR_USER (ident IN NUMBER) RETURN NUMBER IS
nr_of_games NUMBER;
BEGIN
  SELECT COUNT(*) INTO nr_of_games FROM games WHERE order_id IN (SELECT order_id FROM orders WHERE customer_id = ident);
  RETURN  nr_of_games;
END NR_OF_GAMES_FOR_USER;
/

CREATE OR REPLACE 
FUNCTION PRICE_AVG RETURN NUMBER IS
TOTAL NUMBER := 0;
div NUMBER := 0;
BEGIN
  FOR ITER IN (SELECT PRICE FROM GAMES) LOOP
  TOTAL := TOTAL + ITER.PRICE;
  div := div + 1;
  END LOOP;
  RETURN TOTAL/div;
END PRICE_AVG;
/

CREATE OR REPLACE 
FUNCTION totalOrders
RETURN NUMBER IS
   total NUMBER(2) := 0;
BEGIN
   SELECT COUNT(*) INTO total
   FROM orders;
   RETURN total;
END;
/