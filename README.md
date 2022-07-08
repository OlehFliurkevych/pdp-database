# pdp-database

project for resolving tasks from _**Database**_ module in scope of preparing to assesment.

### Consists of the following submodules:
 - Relational database design
 - Transactions and isolation levels
 - Query performance tuning
 - Functions (self-education through googling)
 - NoSQL: Mongo, Cassandra
 - Neo4j

## Tasks

[task1.sql](https://github.com/OlehFliurkevych/pdp-database/blob/master/task1.sql) contains the following queries: 
 - Find user by name (exact match)
 - Find user by surname (partial match)
 - Find user by phone number (partial match)
 - Find user with marks by user surname (partial match)

[task2.sql](https://github.com/OlehFliurkevych/pdp-database/blob/master/task2.sql) contains the following tasks: 
 - trigger that will update column updated_datetime to current date in case of updating any of student
 - validation on DB level that will check username on special characters (reject student name with next characters '@', '#', '$')
 
[task3.sql](https://github.com/OlehFliurkevych/pdp-database/blob/master/task3.sql) contains the following tasks: 
 - function that will return average mark for input user
 - function that will return avarage mark for input subject name
 - function that will return student at "red zone" (red zone means at least 2 marks <=3)
 - snapshot that will contain next data: student name, student surname, subject name, mark

[Index_investigation](https://github.com/OlehFliurkevych/pdp-database/blob/master/Index_investigation.pdf) file contains results of investigations.
 - created and tested different types of index (B-tree, Hash, GiST)
