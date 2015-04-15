create or replace 
PROCEDURE EXPORT_IMAGE_PROPERTIES
(
  v_filename IN VARCHAR,
  v_id IN NUMBER
)
AS
  image ORDSYS.ORDIMAGE;
  img_height  integer;
  img_width   integer;

BEGIN

SELECT image_col INTO image FROM covers WHERE cover_id = v_id;
img_height := image.getHeight();
img_width := image.getWidth();
DBMS_OUTPUT.PUT_LINE('img_height ' || img_height);
DBMS_OUTPUT.PUT_LINE('img_width ' || img_width);
COMMIT;
END;