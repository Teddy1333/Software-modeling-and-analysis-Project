CREATE PROCEDURE GetUserOrders
    @UserID INT
AS
BEGIN
    SELECT o.OrderID, o.OrderDate, o.TotalPrice, l.Title, od.Quantity, l.Price
    FROM Orders o
    JOIN OrderDetails od ON o.OrderID = od.OrderID
    JOIN Listings l ON od.ListingID = l.ListingID
    WHERE o.BuyerID = @UserID;
END;

EXEC GetUserOrders @UserID = 1;
