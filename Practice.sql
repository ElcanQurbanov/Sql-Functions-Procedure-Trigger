--CREATE VIEW getCustomerById
--as
--select * from Customers where Id = 1

--select * from getCustomerById


--CREATE FUNCTION SayHelloWorld()
--returns nvarchar(50)
--as
--BEGIN
--    return 'Hello World'
--END

--select dbo.SayHelloWorld() 



--CREATE FUNCTION dbo.writeWord(@word nvarchar(20))
--returns nvarchar(50)
--as
--BEGIN
--    return @word
--END

--declare @word nvarchar(20) = 'P135'

--select dbo.writeWord(@word)



--CREATE FUNCTION dbo.writeWordsWithToParametr(@word nvarchar(20), @source nvarchar(20))
--returns nvarchar(50)
--as
--BEGIN
--    return @word + @source
--END


--select dbo.writeWordsWithToParametr('Shaiq', 'P135') as 'Data'


--CREATE FUNCTION dbo.sumOfNumbers(@num1 int, @num2 int)
--returns int
--as
--BEGIN
--    return @num1 + @num2
--END


--select dbo.sumOfNumbers(5,10)



--CREATE FUNCTION dbo.getCustomerCount()
--returns int
--as
--BEGIN
--   declare @count int 
--   select @count = COUNT(*) from Customers
--   return @count
--END


--select dbo.getCustomerCount()



--CREATE FUNCTION dbo.getCustomerAvarageAgeById(@id int)
--returns int
--as
--BEGIN
--   declare @avgAge int 
--   select @avgAge = AVG(Age) from Customers where Id > @id
--   return @avgAge
--END


--select * from Customers

--select dbo.getCustomerAvarageAgeById(4)


--CREATE PROCEDURE usp_SayHelloWorld	
--as
--BEGIN
--   print 'Hello World'
--END


--EXEC usp_SayHelloWorld


--CREATE PROCEDURE usp_sumOfNums
--@num1 int,
--@num2 int
--as
--BEGIN
--   print @num1 + @num2
--END


--EXEC usp_sumOfNums 5,8




--CREATE PROCEDURE usp_addCustomer
--@name nvarchar(50),
--@surname nvarchar(50),
--@age int
--as
--BEGIN
--    insert into Customers([Name], [Surname], [Age])
--	values (@name, @surname, @age)
--END



--EXEC usp_addCustomer 'Eli', 'Talibov', 21


--CREATE PROCEDURE usp_deleteCustomerAndShowDatas
--@id int 
--as
--BEGIN
--   delete from Customers where Id = @id
--   select * from Customers
--END

--EXEC usp_deleteCustomerAndShowDatas 8



--CREATE PROCEDURE usp_searchOperation
--@text nvarchar(100),
--@search nvarchar(10)
--as
--BEGIN
--   declare @num int
--   SELECT @num = CHARINDEX(@search, @text)

--   if @num > 0
--      print 'Yes'
--   else
--      print 'No'
--END

--EXEC usp_searchOperation 'Azerbaycan', 'A'




--CREATE TABLE Users(
--[Id] int primary key identity (1,1),
--[Name] nvarchar(50) not null,
--[Age] int,
--[IsDeleted] bit default 'false'
--)

--insert into Users([Name], [Age], [IsDeleted])
--values ('Konul', 27, 0),
--	   ('Roya', 22, 0),
--	   ('Cavid', 29, 0),
--	   ('Ibrahim', 28, 0),
--	   ('Pervin', 27, 0),
--	   ('Mubariz', 18, 0)

--	   select * from Users



--CREATE TABLE UserLogs(
--[Id] int primary key identity(1,1),
--[UserID] int,
--[Operation] nvarchar(10),
--[Date] datetime
--)



--CREATE TRIGGER trg_insertUser on Users
--after insert 
--as
--BEGIN
--   insert into UserLogs([UserID], [Operation], [Date])
--   select Id, 'Insert', GETDATE() from inserted
--END


--CREATE PROCEDURE usp_insertUser
--@name nvarchar(20),
--@age int
--as
--BEGIN
--   insert into Users([Name],[Age])
--   values(@name, @age)
--END


--EXEC usp_insertUser 'Ceyhun', 23




--CREATE TRIGGER trg_deleteUser on Users
--after delete 
--as
--BEGIN
--   insert into UserLogs([UserID], [Operation], [Date])
--   select Id, 'Delete', GETDATE() from deleted
--END


--delete from Users where Id = 1



CREATE TRIGGER trg_updateUser on Users
after update 
as
BEGIN
   insert into UserLogs([UserID], [Operation], [Date])
   select Id, 'Update', GETDATE() from deleted
END


update Users
set [Name] = 'Elekber' where Id = 3

select * from UserLogs where UserId = 3
