--liquibase formatted sql
--changeset utplsql:rooms_test
create table rooms (
  room_key number primary key,
  name varchar2(100)
);

create table room_contents (
  contents_key number primary key,
  room_key number,
  name varchar2(100),
  constraint fk_rooms foreign key (room_key) references rooms (room_key)
);

--rollback drop table rooms;
--rollback drop table room_contents;