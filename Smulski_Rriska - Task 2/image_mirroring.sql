ALTER TABLE covers ADD img_modif ORDImage;
commit;

set serveroutput on
DECLARE
img1 ORDimage;
img2 ORDImage;
BEGIN
SELECT image_col, img_modif INTO img1,img2 FROM covers
WHERE cover_id=1 FOR UPDATE of image_col, img_modif;
img1.processCopy('maxScale 500 500',img2);
img2.process('flip');
img2.process('mirror');
UPDATE covers set img_modif = img2 WHERE cover_id =1;
COMMIT;
END;