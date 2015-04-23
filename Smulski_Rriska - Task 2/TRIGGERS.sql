create or replace 
TRIGGER cover_id_trigger
  BEFORE INSERT ON covers
  FOR EACH ROW
  DECLARE
  v_max_id NUMBER;
BEGIN
    SELECT MAX(cover_id) INTO v_max_id FROM covers;
    IF v_max_id IS NULL THEN
    v_max_id := 0;
    END IF;
      :NEW.cover_id := v_max_id + 1;
END;