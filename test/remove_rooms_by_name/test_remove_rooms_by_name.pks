create or replace package test_remove_rooms_by_name as

  -- %suite(Remove rooms by name)
  -- %suitepath(org.utplsql.demo.hotel)

  -- %beforeall
  procedure setup_rooms;

  -- %test(Removes a room without content in it)
  procedure remove_empty_room;

  -- %test(Does not remove room when it has content)
  procedure room_with_content;

  -- %test(Raises exception when null room name given)
  procedure null_room_name;

end;
/