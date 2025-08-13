--[MEDIUM QUESTION]
CREATE TABLE Employee(
    Emp_ID INT identity(1,1) PRIMARY KEY,
    Ename varchar(30) NOT NULL,
    Department varchar(20),
    ManagerID INT,
    foreign key (ManagerID) references Employee(Emp_ID)
);

insert into employee(Ename,Department,ManagerID) values
    ('Alice','HR',null),
    ('Bob','Finance',1),
    ('Charlie','IT',1),
    ('David','Finance',2),
    ('Eve','IT',3),
    ('Frank','HR',1)

select E1.EName as [Employee_Name], E2.EName as [Manager_Name], E1.Department as [Emp_Department], E2.Department as [Manager_Dept]
from Employee as E1
left outer join 
Employee as E2 
on E1.ManagerID=E2.Emp_ID; 

--[HARD QUESTION]
create table Year_tbl(
    ID INT not null,
    Year INT,
    NPV INT
);

create table Queries_tbl(
    ID int NOT NULL,
    Year INT
);

insert into Year_tbl(ID,Year,NPV) values
    (1,2018,100),
    (7,2020,30),
    (13,2019,40),
    (1,2019,113),
    (2,2008,121),
    (3,2009,112),
    (11,2020,99),
    (7,2019,0)

insert into Queries_tbl(ID,Year) values 
    (1,2019),
    (2,2008),
    (3,2009),
    (7,2018),
    (7,2019),
    (7,2020),
    (13,2019)

select Y.ID as [ID],Y.Year as [Year],isnull(Q.npv,0)
from Queries_tbl as Y
left outer join
Year_tbl as Q
on Y.ID=Q.ID
and
Y.Year =Q.Year;
