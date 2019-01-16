-----------------------///(3)TCL COMMANDS///(transactions control language)--------------------------------------
------------------This is the third type of sub language in SQL to control our transactions---------------------
-
----(a)transaction(action/task/opperation)
---all the dml commands such as the update,delete and insert all are different tasks and opperations so they all are transactions

--so if the user want to control the above transactions on the table then we have to use the TCL LANG
---KEYWORDS used for controlling the transactions
---(1)Begin Transaction
---(2)COMMIT
---(3)ROLLBACK(similar to undo opperation)
---(4)SAVEPOINT

----with the help of the tcl commands the implicit functions are converted to the explicit functions
---that is the auto commit functions are converted to the the user controlable commands
---by default the dml commands all are auto commit functions




-----------///////////(1)BEGIN TRANSACTION(TO begin the transaction)////////---------
---------------------syntax-------------------
----begin transaction--
-------<statments>----
begin transaction
 insert into department(deptid,firstname,lastname,age) values(67,'punaa','kittu',5)

-----/////(2)commit Transaction(to make the transaction permanent by explicitly that is by user)----
--once the opperation is commited it cannot be rollback----
-----begin transaction----
---------------------syntax-------------------
-------<statments>-----
---------commit-----
begin transaction
 insert into department(deptid,firstname,lastname,age) values(9,'puaa','kitu',95)
 commit 


-------------example of begin transaction------
begin transaction
 insert into department(deptid,firstname,lastname,age) values(67,'punaa','kittu',5)
 begin transaction
 ROLLBACK
 select *from department
 ---so if we do not want a particular row to insert just temperorily then we write it under the begin transaction
 ---if we want to roll back then write it under begin transaction and rollback


 -----------example of commit-----
 ---if we write commit then there it will be permenatly written and no roll back
 begin transaction
 insert into department(deptid,firstname,lastname,age) values(9,'puaa','kitu',95)
 commit 
 begin transaction
 ROLLBACK--to get the previous state of the table
 --the above statment is the permenant execution of the opperation
 --that is when we write the commit statments we are explicitly writing the transaction and cannot be rolled back
 select *from department
 insert department values(763,'haj','mari',75)

 --------------//multiple records under the begin transaction//---------------
 begin transaction 
 insert department values(173,'sneha','las',994),(883,'neha','laame',774)
delete from department where lastname='marri'
begin transaction
rollback



/* if I want to explicitly control then I use the commit 
but among all only for only one statment if i dont want any commit then 
i go with the savepoint*/
-------------------/////////(4)SAVEPOINT///////////////-------------------------
/*It is used to creat a temporary memmory for storing the values which we want to 
cancle conditionally*/
------syntax-----
/*begin transaction
<statments>
save <pointer name>
<statments which we want to cancel conditinally>
*/

begin transaction 
delete from department where lastname='marri'
delete from department where lastname='nakula'
save transaction s1--s1 is the name of the transaction
delete from department where age='35'
commit
select*from department
/*so the first two delete statments are deleted permenatly but the last 
statment is deleted temprorily that is we can roll that back as it is stored in 
temprory variable*/
begin transaction 
rollback transaction s1--only the where age =35 row is rolled back as that was savepointed
begin transaction
rollback --when used this only the one in savepoint will be retored