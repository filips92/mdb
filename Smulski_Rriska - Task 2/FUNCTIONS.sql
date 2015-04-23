create or replace 
FUNCTION BIGGEST_IMAGE_ID
RETURN NUMBER
AS
  biggest_size NUMBER := 0;
  biggest_id NUMBER := 0;
BEGIN
  FOR rec IN (SELECT cover_id, image_col FROM covers ORDER BY cover_id) LOOP
    IF (rec.image_col.contentLength > biggest_size) THEN
      biggest_size := rec.image_col.contentLength;
      biggest_id := rec.cover_id;
    END IF;
  END LOOP;
  RETURN BIGGEST_IMAGE_ID;
END;