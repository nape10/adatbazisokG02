CREATE OR ALTER VIEW VSZOBA AS
SELECT sz.*,
szh.SZALLAS_NEV,
szh.HELY,
szh.CSILLAGOK_SZAMA
FROM Szoba sz JOIN Szallashely szh ON sz.SZALLAS_FK = szh.SZALLAS_ID
SELECT * FROM VSZOBA

CREATE OR ALTER PROCEDURE SPUgyfelfoglalasok
@ugyfelazon nvarchar(40)
AS
BEGIN
SELECT *
FROM Foglalas
WHERE ugyfel_fk = @ugyfelazon
END
EXEC SPUgyfelfoglalasok 'laszlo2'

CREATE OR ALTER FUNCTION UDFFerohely
(
  @fazon INT
)
RETURNS INT -- az érték típusa
AS
BEGIN
DECLARE @ferohely INT

  SELECT @ferohely = sz.FEROHELY
  FROM Foglalas f JOIN Szoba sz ON f.SZOBA_FK = sz.SZOBA_ID
  WHERE f.FOGLALAS_PK = @fazon
RETURN @ferohely
END
SELECT dbo.UDFFerhely(651)