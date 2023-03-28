CREATE TABLE Students(
[Id] int primary key identity(1,1),
[Name] nvarchar(50) not null,
[Surname] nvarchar(50),
[Age] int,
[Email] nvarchar(60) unique,
[Address] nvarchar(60)
)

insert into Students([Name], [Surname], [Age], [Email], [Address])
values ('Aqsin', 'Hummetov', 27, 'aqsin@code.edu.az', 'Xirdalan'),
       ('Saiq', 'Kazimov', 25, 'saiq@code.edu.az', 'Sedmoy'),
	   ('Cavid', 'Ismayilzade', 22, 'cavid@code.edu.az', 'Sulutepe'),
	   ('Elcan', 'Qurbanov', 20, 'elcan@code.edu.az', 'Ehmedli')

	   select * from Students



CREATE TABLE StudentArchives(
[Id] int primary key identity(1,1),
[UserID] int,
[Operation] nvarchar(10),
[Date] datetime
)




CREATE TRIGGER trg_deleteStudents on Students
after delete 
as
BEGIN
   insert into StudentArchives([UserID], [Operation], [Date])
   select Id, 'Delete', GETDATE() from deleted
END


CREATE PROCEDURE usp_deletedStudents
@id int
as
BEGIN
    delete from Students where id = @id
END


exec usp_deletedStudents 2
