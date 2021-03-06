set serveroutput on;
declare
  xmlfile xmltype;
  v_id games.game_id%type;
  v_name games.name%type;
	v_price games.price%type;
	v_agecategory_id games.agecategory_id%type;
	v_producer_id games.producer_id%type;
	v_genre_id games.genre_id%type;
	v_platform_id games.platform_id%type;
	v_order_id games.order_id%type;
	v_cover_id games.cover_id%type;
begin
  xmlfile := xmltype(bfilename('XML_FILES', 'test.xml'),nls_charset_id('AL32UTF8'));
  v_id := to_number(xmlfile.extract('/game/id/text()').getCLOBVal());
  v_name := xmlfile.extract('/game/name/text()').getCLOBVal();
	v_price := to_number(xmlfile.extract('/game/price/text()').getCLOBVal());
	v_agecategory_id := to_number(xmlfile.extract('/game/agecategory_id/text()').getCLOBVal());
	v_producer_id := to_number(xmlfile.extract('/game/producer_id/text()').getCLOBVal());
	v_genre_id := to_number(xmlfile.extract('/game/genre_id/text()').getCLOBVal());
	v_platform_id := to_number(xmlfile.extract('/game/platform_id/text()').getCLOBVal());
	v_order_id := to_number(xmlfile.extract('/game/order_id/text()').getCLOBVal());
	--v_cover_id := to_number(xmlfile.extract('/game/cover_id/text()').getCLOBVal());
  dbms_output.put_line('ID: ' || v_id);
  dbms_output.put_line('Name: ' || v_name);
  dbms_output.put_line('Price: ' || v_price);
  dbms_output.put_line('Age category id: ' || v_agecategory_id);
  dbms_output.put_line('Producer id: ' || v_producer_id);
  dbms_output.put_line('Genre id: ' || v_genre_id);
  dbms_output.put_line('Platform id: ' || v_platform_id);
  dbms_output.put_line('Order id: ' || v_order_id);
  --dbms_output.put_line(v_cover_id);
end;