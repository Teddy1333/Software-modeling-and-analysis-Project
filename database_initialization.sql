CREATE DATABASE CardMarket;
GO

USE CardMarket;
GO

-- Users Table
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Username NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    Password NVARCHAR(100) NOT NULL,
    Role NVARCHAR(20) NOT NULL CHECK (Role IN ('Buyer', 'Seller')),
    RegistrationDate DATETIME DEFAULT GETDATE()
);

-- Categories Table
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50) NOT NULL,
    Description NVARCHAR(200)
);

-- Listings Table
CREATE TABLE Listings (
    ListingID INT PRIMARY KEY IDENTITY(1,1),
    SellerID INT NOT NULL,
    CategoryID INT NOT NULL,
    Title NVARCHAR(100) NOT NULL,
    Description NVARCHAR(500),
    Price DECIMAL(10, 2) NOT NULL CHECK (Price > 0),
    Condition NVARCHAR(20) NOT NULL,
    FOREIGN KEY (SellerID) REFERENCES Users(UserID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    BuyerID INT NOT NULL,
    OrderDate DATETIME DEFAULT GETDATE(),
    TotalPrice DECIMAL(10, 2) NOT NULL CHECK (TotalPrice >= 0),
    FOREIGN KEY (BuyerID) REFERENCES Users(UserID)
);

-- OrderDetails Table (Many-to-Many between Orders and Listings)
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT NOT NULL,
    ListingID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ListingID) REFERENCES Listings(ListingID)
);

-- Reviews Table
CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT NOT NULL UNIQUE,
    UserID INT NOT NULL,
    Rating INT NOT NULL CHECK (Rating BETWEEN 1 AND 5),
    Comment NVARCHAR(500),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
GO
