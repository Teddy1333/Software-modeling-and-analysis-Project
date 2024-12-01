CREATE TRIGGER CheckListingsPrice
ON Listings
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @ListingID INT, @Price DECIMAL(10, 2);

    SELECT @ListingID = INSERTED.ListingID, @Price = INSERTED.Price FROM INSERTED;

    IF @Price < 1.00
    BEGIN
        PRINT 'Error: Listing price cannot be below $1.00.';
        ROLLBACK TRANSACTION;  
    END
END;


UPDATE Listings
SET Price = 0.50
WHERE ListingID = 2;

UPDATE Listings
SET Price = 1.50
WHERE ListingID = 2;
