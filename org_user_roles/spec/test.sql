create table users (
  id integer primary key autoincrement,
  name varchar(255)
);
create table organizations (
  id integer primary key autoincrement,
  name varchar(255),
  parent_id int(11)
);
create table roles (
  id integer primary key autoincrement,
  name char(10),
  user_id int(11),
  organization_id int(11)
);
