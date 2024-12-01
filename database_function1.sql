CREATE FUNCTION GetSellerRevenue(@SellerID INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @Revenue DECIMAL(10, 2);

    SELECT @Revenue = SUM(l.Price * od.Quantity)
    FROM Listings l
    JOIN OrderDetails od ON l.ListingID = od.ListingID
    WHERE l.SellerID = @SellerID;

    RETURN ISNULL(@Revenue, 0);
END;

SELECT dbo.GetSellerRevenue(2) AS SellerRevenue;
