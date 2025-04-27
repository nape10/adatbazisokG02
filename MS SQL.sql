/*CREATE TABLE Ugyfelek
(
login varchar(20) MASKED WITH (Function = 'partial(1,"XXX",1)'),
email varchar(30) MASKED WITH (function = 'email()'),
nev varchar(20),
szulev int MASKED WITH (FUNCTION = 'random(1900,2020)'),
nem varchar(10),
cim varchar(50)
)*/

INSERT INTO Ugyfelek (login, email, nev, szulev, nem, cim)
SELECT login, email, nev, szulev, nem, cim
FROM adatbhzi;

CREATE USER MaskUser WITHOUT Login;
GRANT SELECT ON Ugyfelek TO MaskUser

EXECUTE AS User= 'MaskUser';
SELECT * FROM Ugyfelek
REVERT