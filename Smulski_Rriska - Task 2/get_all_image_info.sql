SET SERVEROUTPUT ON;

--
-- Display the properties of the images stored in image_table using PL/SQL.
--
 
BEGIN
 
  FOR rec in (SELECT cover_id, image_col from covers ORDER BY cover_id) LOOP
    dbms_output.put_line('Image properties:');
    dbms_output.put_line('image id: '|| rec.cover_id);
    dbms_output.put_line('image height: '|| rec.image_col.getHeight());
    dbms_output.put_line('image width: '|| rec.image_col.getWidth());
    dbms_output.put_line('image MIME type: '|| rec.image_col.getMimeType());
    dbms_output.put_line('image file format: '|| rec.image_col.getFileFormat());
    dbms_output.put_line('BLOB Length: '|| rec.image_col.getContentLength());
    dbms_output.put_line('-------------------------------------------');
  END loop;
END;