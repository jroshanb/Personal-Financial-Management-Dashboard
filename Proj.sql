CREATE DATABASE Power_BI

CREATE TABLE Transactions (
    Year INT,
    MonthNumber INT,
    Day INT,
	MonthName VARCHAR(20),
    transaction_type VARCHAR(10),
    description VARCHAR(255),
    category VARCHAR(50),
    amount DECIMAL(10,2)
);

SELECT * FROM Transactions

CREATE TABLE Goal_Savings (
    Goal_Name VARCHAR(255) NOT NULL,
    Target_Amount DECIMAL(18,2) NOT NULL,
    Target_Date DATE NOT NULL,
    Priority VARCHAR(10) CHECK (Priority IN ('High', 'Medium', 'Low')),
    Notes VARCHAR(500) NULL
);

ALTER TABLE Goal_Savings ADD GoalType VARCHAR(20);

INSERT INTO Goal_Savings (Goal_Name, Target_Amount, Target_Date, Priority, GoalType, Notes)
VALUES
('Marriage', 1000000, '2030-12-31', 'High', 'Medium Term', 'Destination wedding'),
('Foreign Tour', 250000, '2026-06-01', 'Medium', 'Long Term', 'Europe Trip'),
('Football/F1 Event', 100000, '2025-09-15', 'Low', 'Short Term', 'FIFA World Cup'),
('Children’s Education', 2500000, '2040-06-30', 'High', 'Long Term', 'MBA for child');


