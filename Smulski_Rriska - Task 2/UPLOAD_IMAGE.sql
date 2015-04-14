create or replace 
PROCEDURE UPLOAD_IMAGE
(
  v_filename IN VARCHAR2
)
AS
  image_var ORDImage;
  ctx RAW(64) := NULL;
  row_id urowid;
BEGIN
  INSERT INTO covers (filename, image_col)
  VALUES (v_filename, ORDImage.init('FILE', 'MEDIA_FILES',v_filename))
  RETURNING image_col,rowid INTO image_var, row_id;
  image_var.import(ctx); -- ORDImage.import wywo³uje ORDImage.setProperties;
  UPDATE covers SET image_col = image_var WHERE rowid = row_id; --aktualizacja tabeli o atrybuty obrazów
  COMMIT;
END UPLOAD_IMAGE;