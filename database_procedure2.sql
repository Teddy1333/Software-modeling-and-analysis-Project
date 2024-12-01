CREATE PROCEDURE UpdateListingPrice
    @ListingID INT,
    @NewPrice DECIMAL(10, 2)
AS
BEGIN
    UPDATE Listings
    SET Price = @NewPrice
    WHERE ListingID = @ListingID;
    
    SELECT ListingID, Title, Price FROM Listings WHERE ListingID = @ListingID;
END;

EXEC UpdateListingPrice @ListingID = 1, @NewPrice = 500.00;
