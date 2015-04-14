create or replace 
PROCEDURE EXPORT_IMAGE
(
  v_filename IN VARCHAR,
  v_id IN NUMBER
)
AS
  img ORDSYS.ORDIMAGE;
  ctx raw(64) :=null;
BEGIN
  SELECT image_col INTO img FROM covers WHERE cover_id = v_id;
  img.export(ctx, 'FILE', 'MEDIA_FILES', v_filename);
END;