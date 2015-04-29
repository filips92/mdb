create or replace 
PROCEDURE VIEW_XML_ELEMENT
(
  directoryName IN varchar2,
  fileName IN varchar2,
  id IN NUMBER
)
AS
  xmlFile xmltype := xmltype(bfilename(directoryName, fileName),nls_charset_id('AL32UTF8'));
  v_id games.game_id%TYPE;
  v_name games.name%TYPE;
  v_price games.price%TYPE;
  v_agecategory_id games.agecategory_id%TYPE;
  v_producer_id games.producer_id%TYPE;
  v_genre_id games.genre_id%TYPE;
  v_platform_id games.platform_id%TYPE;
  v_order_id games.order_id%TYPE;
  v_cover_id games.cover_id%TYPE;
BEGIN
    SELECT 
      ExtractValue(Value(g), '/game/id/text()'),
      ExtractValue(Value(g), '/game/name/text()'),
      ExtractValue(Value(g), '/game/price/text()'),
      ExtractValue(Value(g), '/game/agecategory_id/text()'),
      ExtractValue(Value(g), '/game/producer_id/text()'),
      ExtractValue(Value(g), '/game/genre_id/text()'),
      ExtractValue(Value(g), '/game/platform_id/text()'),
      ExtractValue(Value(g), '/game/order_id/text()'),
      ExtractValue(Value(g), '/game/cover_id/text()')
    INTO
      v_id,
      v_name,
      v_price,
      v_agecategory_id,
      v_producer_id,
      v_genre_id,
      v_platform_id,
      v_order_id,
      v_cover_id
    FROM TABLE(XMLSequence(Extract(xmlFile, '/games/game'))) g
    WHERE ExtractValue(Value(g), '/game/id/text()') = id;
    IF SQL%FOUND THEN
      DBMS_OUTPUT.PUT_LINE('ID: ' || v_id);
      DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
      DBMS_OUTPUT.PUT_LINE('Price: ' || v_price);
      DBMS_OUTPUT.PUT_LINE('Age category id: ' || v_agecategory_id);
      DBMS_OUTPUT.PUT_LINE('Producer id: ' || v_producer_id);
      DBMS_OUTPUT.PUT_LINE('Genre id: ' || v_genre_id);
      DBMS_OUTPUT.PUT_LINE('Platform id: ' || v_platform_id);
      DBMS_OUTPUT.PUT_LINE('Order id: ' || v_order_id);
      DBMS_OUTPUT.PUT_LINE('Cover id: ' || v_cover_id);
    ELSE
      DBMS_OUTPUT.PUT_LINE('No data found');
    END IF;
END;
