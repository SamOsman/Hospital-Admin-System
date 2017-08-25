insert into doctors values ('john', 'smith', 'heart');
insert into doctors values ( 'francine', 'danials', 'bone');
insert into doctors values ('heather', 'kane', 'head');
insert into doctors values ('frank', 'sinatra', 'lung');

insert into patients values ('bobby', 'belcher', 38, 5486325);
insert into patients values ('jean', 'belcher', 11, 5239654);
insert into patients values ('louise', 'belcher', 8, 8463258);
insert into patients values ('tina', 'belcher', 13, 4522876);
insert into patients values ('linda', 'belcher', 32, 9684352);

insert into visits values (GETDATE(), null, 'Ran into a wall and hit head', 1, 3);
insert into visits values (GETDATE(), null, 'Heart palpitations', 2, 1);
insert into visits values (GETDATE(), null, 'head injury', 3, 2);
insert into visits values (GETDATE(), null, 'Fell down and hit head against stove', 4, 3);
insert into visits values (GETDATE(), null, 'Difficulty breathing, posible anxiety attack', 5, 4);

insert into users (firstname, lastname, username, password, status)
values('Yasemin', 'Fanaeian', 'admin', 'admin', 'admin');

insert into users (firstname, lastname, username, password, status)
values('John', 'Doe', 'user', 'user', 'user');


