CREATE FUNCTION GetAverageRating(@OrderID INT)
RETURNS DECIMAL(3, 2)
AS
BEGIN
    DECLARE @AvgRating DECIMAL(3, 2);

    SELECT @AvgRating = AVG(Rating)
    FROM Reviews
    WHERE OrderID = @OrderID;

    RETURN ISNULL(@AvgRating, 0);
END;

SELECT dbo.GetAverageRating(1) AS AverageOrderRating;
