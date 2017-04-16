create or replace package test_remove_rooms_by_name as

  -- %suite
  -- %displayname(Remove rooms by name)

  -- %beforeall
  procedure setup_rooms;

  -- %test
  -- %displayname(Removes a room without content in it)
  procedure remove_empty_room;

  -- %test
  -- %displayname(Does not remove room when it has content)
  procedure room_with_content;

  -- %test
  -- %displayname(Raises exception when null room name given)
  procedure null_room_name;

end;
/