create or replace 
PROCEDURE EXPORT_GAMES_TO_XML
(
  fileName IN VARCHAR2
)
AS
  temp CLOB;
BEGIN
  dbms_lob.createtemporary(temp, true);
  dbms_lob.append(temp, '<games>');  
  FOR elem IN(
    SELECT 
    game_id AS v_id,
    name AS v_name,
    price AS price,
    agecategory_id AS agecategory,
    producer_id AS producer,
    genre_id AS genre,
    platform_id AS platform,
    order_id AS orderid,
    cover_id AS cover
    FROM games
  )
  LOOP
    dbms_lob.append(temp, '<game>');
      dbms_lob.append(temp, '<id>');
      dbms_lob.append(temp, to_char(elem.v_id));
      dbms_lob.append(temp, '</id>');
      dbms_lob.append(temp, '<name>');
      dbms_lob.append(temp, elem.v_name);
      dbms_lob.append(temp, '</name>');
      dbms_lob.append(temp, '<price>');
      dbms_lob.append(temp, to_char(elem.price));
      dbms_lob.append(temp, '</price>');
      dbms_lob.append(temp, '<agecategory_id>');
      dbms_lob.append(temp, to_char(elem.agecategory));
      dbms_lob.append(temp, '</agecategory_id>');
      dbms_lob.append(temp, '<producer_id>');
      dbms_lob.append(temp, to_char(elem.producer));
      dbms_lob.append(temp, '</producer_id>');
      dbms_lob.append(temp, '<genre_id>');
      dbms_lob.append(temp, to_char(elem.genre));
      dbms_lob.append(temp, '</genre_id>');
      dbms_lob.append(temp, '<platform_id>');
      dbms_lob.append(temp, to_char(elem.platform));
      dbms_lob.append(temp, '</platform_id>');
      dbms_lob.append(temp, '<order_id>');
      dbms_lob.append(temp, to_char(elem.orderid));
      dbms_lob.append(temp, '</order_id>');
      --dbms_lob.append(temp, '<cover_id>');
      --dbms_lob.append(temp, to_char(elem.cover));
      --dbms_lob.append(temp, '</cover_id>');
    dbms_lob.append(temp, '</game>');
  END LOOP;
  dbms_lob.append(temp, '</games>');
  dbms_xslprocessor.clob2file(temp, 'XML_FILES', fileName, nls_charset_id('AL32UTF8'));
  dbms_lob.freetemporary(temp);
END;