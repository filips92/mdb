CREATE OR REPLACE 
TRIGGER order_id_trigger
  BEFORE INSERT ON orders
  FOR EACH ROW
  DECLARE
  v_max_id number;
BEGIN
    SELECT MAX(order_id) INTO v_max_id FROM orders;
    IF v_max_id IS NULL THEN
    v_max_id := 0;
    END IF;
      :NEW.order_id := v_max_id + 1;
END;
/

CREATE OR REPLACE 
TRIGGER game_id_trigger
  BEFORE INSERT ON games
  FOR EACH ROW
  DECLARE
  v_max_id number;
BEGIN
    SELECT MAX(game_id) INTO v_max_id FROM games;
    IF v_max_id IS NULL THEN
    v_max_id := 0;
    END IF;
      :NEW.game_id := v_max_id + 1;
END;
/

CREATE OR REPLACE 
  TRIGGER display_price_changes
  BEFORE UPDATE ON GAMES
  FOR EACH ROW
  WHEN (NEW.GAME_ID > 0)
DECLARE
    price_diff NUMBER;
BEGIN
    price_diff := :NEW.price - :OLD.price;
    dbms_output.put_line('Old price: ' || :OLD.price);
    dbms_output.put_line('New price: ' || :NEW.price);
    dbms_output.put_line('Price difference: ' || price_diff);
END;
/