delete from user_role;
delete from usr;

insert into usr(id, active, password, username) values
(1, true, '$2a$08$lL3.yAcbLExKoPIl8vKgNu5vxUdhNh./a507YHk4J0a7N1hVVUld6', 'admin'),
(2, true, '$2a$08$lL3.yAcbLExKoPIl8vKgNu5vxUdhNh./a507YHk4J0a7N1hVVUld6', 'user');

insert  into  user_role(user_id, roles) values
(1, 'USER'), (1, 'ADMIN'),
(2, 'USER');
