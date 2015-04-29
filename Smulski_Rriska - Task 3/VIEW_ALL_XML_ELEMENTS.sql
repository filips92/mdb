create or replace 
PROCEDURE VIEW_ALL_XML_ELEMENTS
(
  directoryName IN varchar2,
  fileName IN varchar2
)
AS
  xmlFile xmltype := xmltype(bfilename(directoryName, fileName),nls_charset_id('AL32UTF8'));
BEGIN
  FOR elem IN
  (
    SELECT 
      ExtractValue(Value(g), '/game/id/text()') AS id,
      ExtractValue(Value(g), '/game/name/text()') AS name,
      ExtractValue(Value(g), '/game/price/text()') AS price,
      ExtractValue(Value(g), '/game/agecategory_id/text()') AS agecategory,
      ExtractValue(Value(g), '/game/producer_id/text()') AS producer_id,
      ExtractValue(Value(g), '/game/genre_id/text()') AS genre_id,
      ExtractValue(Value(g), '/game/platform_id/text()') AS platform_id,
      ExtractValue(Value(g), '/game/order_id/text()') AS order_id,
      ExtractValue(Value(g), '/game/cover_id/text()') AS cover_id
    FROM TABLE(XMLSequence(Extract(xmlFile, '/games/game'))) g
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE('ID: ' || elem.id);
    DBMS_OUTPUT.PUT_LINE('Name: ' || elem.name);
    DBMS_OUTPUT.PUT_LINE('Price: ' || elem.price);
    DBMS_OUTPUT.PUT_LINE('Age category id: ' || elem.agecategory);
    DBMS_OUTPUT.PUT_LINE('Producer id: ' || elem.producer_id);
    DBMS_OUTPUT.PUT_LINE('Genre id: ' || elem.genre_id);
    DBMS_OUTPUT.PUT_LINE('Platform id: ' || elem.platform_id);
    DBMS_OUTPUT.PUT_LINE('Order id: ' || elem.order_id);
    DBMS_OUTPUT.PUT_LINE('Cover id: ' || elem.cover_id);
    DBMS_OUTPUT.PUT_LINE('--------------------------');
  END LOOP;
END;
