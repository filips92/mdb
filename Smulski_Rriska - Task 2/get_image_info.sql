set serveroutput on
DECLARE
image_var ORDSYS.ORDImage;
img_height INTEGER;
img_width INTEGER;

BEGIN
SELECT image_col INTO image_var FROM covers WHERE cover_id = 1;
img_height := image_var.getHeight();
img_width := image_var.getWidth();
DBMS_OUTPUT.PUT_LINE('img_height ' || img_height);
DBMS_OUTPUT.PUT_LINE('img_width ' || img_width);
COMMIT;
END;