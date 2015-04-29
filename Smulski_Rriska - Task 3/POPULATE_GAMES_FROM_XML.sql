create or replace 
PROCEDURE POPULATE_GAMES_FROM_XML
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
      ExtractValue(Value(g), '/game/name/text()') AS name,
      ExtractValue(Value(g), '/game/price/text()') AS price,
      ExtractValue(Value(g), '/game/agecategory_id/text()') AS agecategory_id,
      ExtractValue(Value(g), '/game/producer_id/text()') AS producer_id,
      ExtractValue(Value(g), '/game/genre_id/text()') AS genre_id,
      ExtractValue(Value(g), '/game/platform_id/text()') AS platform_id,
      ExtractValue(Value(g), '/game/order_id/text()') AS order_id,
      ExtractValue(Value(g), '/game/cover_id/text()') AS cover_id
    FROM TABLE(XMLSequence(Extract(xmlFile, '/games/game'))) g
  )
  LOOP
    INSERT INTO games(name, price, agecategory_id, producer_id, genre_id, platform_id, order_id, cover_id) VALUES (elem.name, elem.price, elem.agecategory_id, elem.producer_id, elem.genre_id, elem.platform_id, elem.order_id, elem.cover_id);
    commit;
  END LOOP;
END;