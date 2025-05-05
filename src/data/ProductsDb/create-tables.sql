-- Drop tables if they exist (clean slate for development)
IF OBJECT_ID('dbo.InventoryItem', 'U') IS NOT NULL DROP TABLE dbo.InventoryItem;
IF OBJECT_ID('dbo.SupplierProduct', 'U') IS NOT NULL DROP TABLE dbo.SupplierProduct;
IF OBJECT_ID('dbo.PriceComponent', 'U') IS NOT NULL DROP TABLE dbo.PriceComponent;
IF OBJECT_ID('dbo.Product', 'U') IS NOT NULL DROP TABLE dbo.Product;

-- Product table
CREATE TABLE dbo.Product (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName NVARCHAR(255) NOT NULL,
    ProductDescription NVARCHAR(MAX) NULL,
    ProductType NVARCHAR(50) NOT NULL, -- Example values: 'Service', 'Good', etc.
    CreatedDate DATETIME2 DEFAULT GETDATE()
);

-- Price Component table
CREATE TABLE dbo.PriceComponent (
    PriceComponentID INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT NOT NULL,
    PriceAmount DECIMAL(18, 2) NOT NULL,
    CurrencyCode CHAR(3) DEFAULT 'USD', -- 3-letter ISO currency
    EffectiveDate DATE DEFAULT GETDATE(),
    FOREIGN KEY (ProductID) REFERENCES dbo.Product(ProductID)
);

-- Supplier Product table
CREATE TABLE dbo.SupplierProduct (
    SupplierProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT NOT NULL,
    SupplierName NVARCHAR(255) NOT NULL,
    AvailableFromDate DATE DEFAULT GETDATE(),
    FOREIGN KEY (ProductID) REFERENCES dbo.Product(ProductID)
);

-- Inventory Item table
CREATE TABLE dbo.InventoryItem (
    InventoryItemID INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT NOT NULL,
    SerialNumber NVARCHAR(100) NULL,
    InventoryStatus NVARCHAR(100) DEFAULT 'Available',
    QuantityOnHand INT DEFAULT 0,
    Location NVARCHAR(255) NULL,
    FOREIGN KEY (ProductID) REFERENCES dbo.Product(ProductID)
);
