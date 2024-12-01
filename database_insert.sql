-- Insert in Users
INSERT INTO Users (Username, Email, Password, Role)
VALUES 
('Alice', 'alice@example.com', 'password123', 'Buyer'),
('Bob', 'bob@example.com', 'password123', 'Seller');

-- Insert in Categories
INSERT INTO Categories (Name, Description)
VALUES 
('Magic: The Gathering', 'Magic cards and accessories'),
('Pokemon', 'Pokemon cards and accessories');

-- Insert in Listings
INSERT INTO Listings (SellerID, CategoryID, Title, Description, Price, Condition)
VALUES 
(2, 1, 'Black Lotus', 'Rare Magic card', 50000.00, 'Mint'),
(2, 2, 'Pikachu Card', 'Pokemon collector item', 100.00, 'Good');

-- Insert in Orders
INSERT INTO Orders (BuyerID, TotalPrice)
VALUES 
(1, 50100.00);

-- Insert in OrderDetails
INSERT INTO OrderDetails (OrderID, ListingID, Quantity)
VALUES 
(1, 1, 1),
(1, 2, 1);

-- Insert in Reviews
INSERT INTO Reviews (OrderID, UserID, Rating, Comment)
VALUES 
(1, 1, 5, 'Amazing purchase!');
GO
