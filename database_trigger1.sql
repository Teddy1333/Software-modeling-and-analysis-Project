CREATE TRIGGER UpdateTotalPrice
ON OrderDetails
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @OrderID INT;

    SELECT @OrderID = INSERTED.OrderID FROM INSERTED;

    UPDATE Orders
    SET TotalPrice = (
        SELECT SUM(l.Price * od.Quantity)
        FROM OrderDetails od
        JOIN Listings l ON od.ListingID = l.ListingID
        WHERE od.OrderID = @OrderID
    )
    WHERE OrderID = @OrderID;
END;
