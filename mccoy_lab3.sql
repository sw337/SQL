CREATE DATABASE IF NOT EXISTS banks;
CREATE TABLE accounts
(
account_id INT NOT NULL auto_increment,
balance DOUBLE NOT NULL,
type VARCHAR(30) NOT NULL,
date_opened DATETIME NOT NULL,
status VARCHAR(30) NOT NULL,
PRIMARY KEY (account_id)
);
CREATE TABLE  transactions
(
transaction_id INT NOT NULL auto_increment,
date_time DATETIME NOT NULL,
amount DOUBLE NOT NULL,
remaining_balance DOUBLE NOT NULL,
account_id INT NOT NULL,
PRIMARY KEY (transaction_id)
);
ALTER TABLE transactions
ADD FOREIGN KEY (account_id) 
REFERENCES accounts(account_id)
ON DELETE CASCADE
ON UPDATE CASCADE;

INSERT accounts (balance,type,date_opened,status)
VALUES (1000, 'savings','2011-10-1', 'open');

INSERT accounts (balance,type,date_opened,status)
VALUES (1300, 'savings','2011-10-19', 'open');

INSERT accounts (balance,type,date_opened,status)
VALUES (13000, 'checkings','2017-10-19', 'open');

INSERT transactions (date_time, amount,remaining_balance, account_id)
VALUES ('2012-3-4 12:54:52', 500, 800, 1);

INSERT transactions (date_time, amount,remaining_balance, account_id)
VALUES ('2015-6-6 11:54:52', 5060, 8500, 2);

INSERT transactions (date_time, amount,remaining_balance, account_id)
VALUES ('2016-6-6 10:25:52', 200, 58000, 2);

INSERT transactions (date_time, amount,remaining_balance, account_id)
VALUES ('2017-6-6 01:05:59', 50, 850080, 2);

INSERT transactions (date_time, amount,remaining_balance, account_id)
VALUES ('2017-11-11 11:50:52', 50, 900500, 3);

SELECT * FROM bank.accounts
ORDER BY date_opened DESC; 

UPDATE accounts 
SET status = 'active'
WHERE account_id > 0;

DELETE FROM transactions
WHERE account_id < 2;