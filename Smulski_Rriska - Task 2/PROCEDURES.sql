create or replace 
PROCEDURE ALL_IMAGES_PROPERTIES
AS
BEGIN
  FOR rec IN (SELECT cover_id, image_col FROM covers ORDER BY cover_id) LOOP
    dbms_output.put_line('Image properties:');
    dbms_output.put_line('image id: '|| rec.cover_id);
    dbms_output.put_line('image height: '|| rec.image_col.getHeight());
    dbms_output.put_line('image width: '|| rec.image_col.getWidth());
    dbms_output.put_line('image MIME type: '|| rec.image_col.getMimeType());
    dbms_output.put_line('image file format: '|| rec.image_col.getFileFormat());
    dbms_output.put_line('BLOB Length: '|| rec.image_col.getContentLength());
    dbms_output.put_line('-------------------------------------------');
  END LOOP;
END;
/

create or replace 
PROCEDURE EXPORT_IMAGE
(
  v_filename IN VARCHAR,
  v_id IN NUMBER
)
AS
  img ORDSYS.ORDIMAGE;
  ctx RAW(64) :=NULL;
BEGIN
  SELECT image_col INTO img FROM covers WHERE cover_id = v_id;
  img.export(ctx, 'FILE', 'MEDIA_FILES', v_filename);
END;
/

create or replace 
PROCEDURE EXPORT_MODIFIED_IMAGE
(
  v_filename IN VARCHAR,
  v_id IN NUMBER
)
AS
  img ORDSYS.ORDIMAGE;
  ctx RAW(64) :=NULL;
BEGIN
  SELECT img_modif INTO img FROM covers WHERE cover_id = v_id;
  img.export(ctx, 'FILE', 'MEDIA_FILES', v_filename);
END;
/

create or replace 
PROCEDURE GET_IMAGE_DIMENSIONS
(
  v_id IN NUMBER
)
AS
  image ORDSYS.ORDIMAGE;
  img_height  INTEGER;
  img_width   INTEGER;
BEGIN
  SELECT image_col INTO image FROM covers WHERE cover_id = v_id;
  img_height := image.getHeight();
  img_width := image.getWidth();
  DBMS_OUTPUT.PUT_LINE('img_height ' || img_height);
  DBMS_OUTPUT.PUT_LINE('img_width ' || img_width);
COMMIT;
END;
/

create or replace 
PROCEDURE scale_too_big_image
(
  img IN OUT ORDImage
)
AS
  img_height  INTEGER;
  img_width   INTEGER;
BEGIN
  img_height := img.getHeight();
  img_width := img.getWidth();
  IF (img_height > 700 OR img_width > 700) THEN
    img.process('scale 0.5');
  END IF;
END;
/

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
  VALUES (v_filename, ORDImage.init('FILE', 'MEDIA_FILES', v_filename))
  RETURNING image_col, rowid INTO image_var, row_id;
  image_var.import(ctx);
  scale_too_big_image(image_var);
  UPDATE covers SET image_col = image_var WHERE rowid = row_id;
  COMMIT;
END UPLOAD_IMAGE;
/

create or replace 
PROCEDURE VERTICAL_MIRROR
(
  v_id IN NUMBER
)
AS
  img1 ORDimage;
  img2 ORDimage;
BEGIN
  UPDATE covers SET img_modif = ORDImage.init() WHERE cover_id = v_id;
  SELECT image_col, img_modif INTO img1, img2 FROM covers
  WHERE cover_id = v_id FOR UPDATE OF img_modif;
  img1.copy(img2);
  img2.process('mirror');
  UPDATE covers SET img_modif = img2 WHERE cover_id =v_id;
  COMMIT;
END;
/